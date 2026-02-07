import 'package:talker/talker.dart';
import 'package:uuid/uuid.dart';

import '../../features/workouts/domain/entities/detected_workout.dart';
import 'gemini_coach_service.dart' as gemini;
import 'healthkit_service.dart';

/// Service for detecting and classifying workouts from HealthKit data
///
/// Analyzes heart rate patterns, step data, and activity duration to
/// automatically detect workouts and classify their type.
abstract class WorkoutDetectionService {
  /// Detect workouts within a time range
  ///
  /// Analyzes HealthKit data to find workout patterns based on:
  /// - Elevated heart rate periods
  /// - Movement/step patterns
  /// - Activity duration
  Future<List<DetectedWorkout>> detectWorkouts({
    required DateTime startTime,
    required DateTime endTime,
    required List<HeartRateSample> heartRates,
    required List<StepSample> steps,
  });

  /// Classify a detected workout using AI
  ///
  /// Uses heart rate patterns and other data to determine workout type
  Future<WorkoutClassification> classifyWorkout({
    required DetectedWorkout workout,
  });

  /// Get detected workouts for a specific day
  Future<List<DetectedWorkout>> getDetectedWorkoutsForDay(DateTime date);

  /// Confirm a detected workout (user validation)
  Future<void> confirmWorkout(String workoutId, String? correctedType);

  /// Dismiss a false positive detection
  Future<void> dismissWorkout(String workoutId);
}

/// Implementation of WorkoutDetectionService
class WorkoutDetectionServiceImpl implements WorkoutDetectionService {
  final gemini.GeminiCoachService _geminiService;
  final HealthKitService _healthKitService;
  final Talker _talker;
  final Uuid _uuid = const Uuid();

  // Detection thresholds
  static const int _minWorkoutDurationMinutes = 10;
  static const int _minHeartRateElevation = 20; // bpm above resting
  static const int _minSustainedElevationMinutes = 5;
  static const double _minConfidenceThreshold = 0.5;

  WorkoutDetectionServiceImpl({
    required gemini.GeminiCoachService geminiService,
    required HealthKitService healthKitService,
    required Talker talker,
  })  : _geminiService = geminiService,
        _healthKitService = healthKitService,
        _talker = talker;

  @override
  Future<List<DetectedWorkout>> detectWorkouts({
    required DateTime startTime,
    required DateTime endTime,
    required List<HeartRateSample> heartRates,
    required List<StepSample> steps,
  }) async {
    try {
      if (heartRates.isEmpty) {
        return [];
      }

      // Sort heart rate samples by timestamp
      final sortedHr = heartRates.toList()
        ..sort((a, b) => a.timestamp.compareTo(b.timestamp));

      // Calculate baseline heart rate (lowest 10% of readings)
      final sortedByHr = heartRates.toList()
        ..sort((a, b) => a.heartRate.compareTo(b.heartRate));
      final baselineCount = (sortedByHr.length * 0.1).ceil().clamp(1, 10);
      final baselineHr =
          sortedByHr.take(baselineCount).map((s) => s.heartRate).reduce(
                    (a, b) => a + b,
                  ) /
              baselineCount;

      // Find elevated heart rate periods
      final elevatedPeriods = _findElevatedPeriods(
        sortedHr,
        baselineHr.round(),
        _minHeartRateElevation,
      );

      // Convert elevated periods to detected workouts
      final detectedWorkouts = <DetectedWorkout>[];

      for (final period in elevatedPeriods) {
        final duration = period.endTime.difference(period.startTime).inMinutes;

        if (duration < _minWorkoutDurationMinutes) {
          continue;
        }

        // Get heart rate samples for this period
        final periodSamples = sortedHr
            .where(
              (s) =>
                  s.timestamp.isAfter(period.startTime) &&
                  s.timestamp.isBefore(period.endTime),
            )
            .toList();

        if (periodSamples.isEmpty) continue;

        // Calculate metrics for this period
        final avgHr =
            periodSamples.map((s) => s.heartRate).reduce((a, b) => a + b) /
                periodSamples.length;
        final maxHr = periodSamples
            .map((s) => s.heartRate)
            .reduce((a, b) => a > b ? a : b);
        final minHr = periodSamples
            .map((s) => s.heartRate)
            .reduce((a, b) => a < b ? a : b);

        // Get steps during this period
        final periodSteps = steps
            .where(
              (s) =>
                  s.timestamp.isAfter(period.startTime) &&
                  s.timestamp.isBefore(period.endTime),
            )
            .toList();
        final totalSteps = periodSteps.isNotEmpty
            ? periodSteps.map((s) => s.steps).reduce((a, b) => a + b)
            : null;

        // Calculate heart rate zones
        final zones = _calculateHeartRateZones(periodSamples, 190); // Assuming max HR of 190

        // Determine intensity
        final intensity = _determineIntensity(avgHr, maxHr, baselineHr.round());

        // Initial type classification based on patterns
        final suggestedType = _classifyWorkoutType(
          avgHr: avgHr,
          maxHr: maxHr.toDouble(),
          duration: duration,
          steps: totalSteps,
          zones: zones,
        );

        // Calculate confidence
        final confidence = _calculateDetectionConfidence(
          periodSamples,
          duration,
          avgHr,
          baselineHr,
        );

        if (confidence < _minConfidenceThreshold) {
          continue;
        }

        // Estimate calories
        final estimatedCalories = _estimateCalories(
          duration: duration,
          avgHr: avgHr.round(),
          intensity: intensity,
        );

        final workout = DetectedWorkout(
          id: _uuid.v4(),
          startTime: period.startTime,
          endTime: period.endTime,
          durationMinutes: duration,
          averageHeartRate: avgHr,
          maxHeartRate: maxHr.toDouble(),
          minHeartRate: minHr.toDouble(),
          heartRateSamples: periodSamples,
          estimatedCalories: estimatedCalories,
          intensity: intensity,
          suggestedType: suggestedType,
          confidence: confidence,
          steps: totalSteps,
          heartRateZones: zones,
          source: DetectionSource.healthkit,
        );

        detectedWorkouts.add(workout);
      }

      return detectedWorkouts;
    } catch (e, st) {
      _talker.error('Failed to detect workouts', e, st);
      return [];
    }
  }

  @override
  Future<WorkoutClassification> classifyWorkout({
    required DetectedWorkout workout,
  }) async {
    try {
      // Use AI for more accurate classification
      final aiResult = await _geminiService.classifyWorkout(
        averageHeartRate: workout.averageHeartRate,
        maxHeartRate: workout.maxHeartRate,
        durationMinutes: workout.durationMinutes,
        heartRatePattern: workout.heartRateSamples
            .map((s) => {'time': s.timestamp.millisecondsSinceEpoch, 'hr': s.heartRate})
            .toList(),
        steps: workout.steps,
        zones: workout.heartRateZones != null
            ? {
                'zone1': workout.heartRateZones!.zone1Minutes,
                'zone2': workout.heartRateZones!.zone2Minutes,
                'zone3': workout.heartRateZones!.zone3Minutes,
                'zone4': workout.heartRateZones!.zone4Minutes,
                'zone5': workout.heartRateZones!.zone5Minutes,
              }
            : null,
      );

      // Convert gemini.WorkoutClassification to freezed WorkoutClassification
      return WorkoutClassification(
        primaryType: aiResult.primaryType,
        confidence: aiResult.confidence,
        alternatives: aiResult.alternatives
            .map((a) => ClassificationAlternative(
                  type: a.type,
                  confidence: a.confidence,
                ))
            .toList(),
        reasoning: aiResult.reasoning,
        isAiClassified: true,
      );
    } catch (e, st) {
      _talker.error('Failed to classify workout with AI', e, st);

      // Fall back to rule-based classification
      return WorkoutClassification(
        primaryType: workout.suggestedType,
        confidence: workout.confidence * 0.8,
        alternatives: [],
        reasoning: 'Classification based on heart rate and activity patterns',
        isAiClassified: false,
      );
    }
  }

  @override
  Future<List<DetectedWorkout>> getDetectedWorkoutsForDay(DateTime date) async {
    try {
      // Fetch HealthKit data for the day
      final healthData = await _healthKitService.fetchRecoveryData(date);

      // We need more granular heart rate data
      // This would require an enhanced HealthKit service
      // For now, use the workouts from HealthKit directly if available
      if (healthData != null && healthData.workouts.isNotEmpty) {
        return healthData.workouts.map((w) {
          return DetectedWorkout(
            id: _uuid.v4(),
            startTime: w.startTime,
            endTime: w.endTime,
            durationMinutes: w.duration,
            averageHeartRate: 0, // Not available from basic workout data
            maxHeartRate: 0,
            estimatedCalories: w.calories ?? 0,
            intensity: WorkoutIntensity.moderate,
            suggestedType: w.type,
            confidence: 0.9, // High confidence since it's from Apple Watch workout
            source: DetectionSource.watch,
          );
        }).toList();
      }

      return [];
    } catch (e, st) {
      _talker.error('Failed to get detected workouts for day', e, st);
      return [];
    }
  }

  @override
  Future<void> confirmWorkout(String workoutId, String? correctedType) async {
    // In a full implementation, this would update the database
    _talker.info('Workout $workoutId confirmed with type: ${correctedType ?? 'original'}');
  }

  @override
  Future<void> dismissWorkout(String workoutId) async {
    // In a full implementation, this would mark as dismissed in the database
    _talker.info('Workout $workoutId dismissed');
  }

  // ============ PRIVATE HELPERS ============

  List<_ElevatedPeriod> _findElevatedPeriods(
    List<HeartRateSample> samples,
    int baselineHr,
    int elevationThreshold,
  ) {
    final periods = <_ElevatedPeriod>[];
    DateTime? periodStart;
    DateTime? lastElevatedTime;

    final elevatedThreshold = baselineHr + elevationThreshold;

    for (final sample in samples) {
      if (sample.heartRate >= elevatedThreshold) {
        periodStart ??= sample.timestamp;
        lastElevatedTime = sample.timestamp;
      } else {
        // Check if we've been below threshold for more than 3 minutes
        if (periodStart != null && lastElevatedTime != null) {
          final gapMinutes =
              sample.timestamp.difference(lastElevatedTime).inMinutes;

          if (gapMinutes > 3) {
            // End the current period
            final durationMinutes =
                lastElevatedTime.difference(periodStart).inMinutes;

            if (durationMinutes >= _minSustainedElevationMinutes) {
              periods.add(_ElevatedPeriod(
                startTime: periodStart,
                endTime: lastElevatedTime,
              ));
            }

            periodStart = null;
            lastElevatedTime = null;
          }
        }
      }
    }

    // Handle any ongoing period at the end
    if (periodStart != null && lastElevatedTime != null) {
      final durationMinutes =
          lastElevatedTime.difference(periodStart).inMinutes;

      if (durationMinutes >= _minSustainedElevationMinutes) {
        periods.add(_ElevatedPeriod(
          startTime: periodStart,
          endTime: lastElevatedTime,
        ));
      }
    }

    return periods;
  }

  HeartRateZones _calculateHeartRateZones(
    List<HeartRateSample> samples,
    int maxHeartRate,
  ) {
    var zone1 = 0;
    var zone2 = 0;
    var zone3 = 0;
    var zone4 = 0;
    var zone5 = 0;

    final zone1Max = maxHeartRate * 0.6;
    final zone2Max = maxHeartRate * 0.7;
    final zone3Max = maxHeartRate * 0.8;
    final zone4Max = maxHeartRate * 0.9;

    // Assume each sample represents roughly 1 minute
    // In reality, we'd calculate actual time between samples
    for (final sample in samples) {
      final hr = sample.heartRate;
      if (hr < zone1Max) {
        zone1++;
      } else if (hr < zone2Max) {
        zone2++;
      } else if (hr < zone3Max) {
        zone3++;
      } else if (hr < zone4Max) {
        zone4++;
      } else {
        zone5++;
      }
    }

    return HeartRateZones(
      zone1Minutes: zone1,
      zone2Minutes: zone2,
      zone3Minutes: zone3,
      zone4Minutes: zone4,
      zone5Minutes: zone5,
    );
  }

  WorkoutIntensity _determineIntensity(
    double avgHr,
    int maxHr,
    int baselineHr,
  ) {
    // Calculate percentage of heart rate reserve used
    final estimatedMaxHr = 190; // Could be personalized
    final hrReserve = estimatedMaxHr - baselineHr;
    final avgHrReserveUsed = (avgHr - baselineHr) / hrReserve;

    if (avgHrReserveUsed < 0.3) {
      return WorkoutIntensity.veryLight;
    } else if (avgHrReserveUsed < 0.5) {
      return WorkoutIntensity.light;
    } else if (avgHrReserveUsed < 0.7) {
      return WorkoutIntensity.moderate;
    } else if (avgHrReserveUsed < 0.85) {
      return WorkoutIntensity.high;
    } else {
      return WorkoutIntensity.maximum;
    }
  }

  String _classifyWorkoutType({
    required double avgHr,
    required double maxHr,
    required int duration,
    required int? steps,
    required HeartRateZones zones,
  }) {
    // Calculate steps per minute if available
    final stepsPerMinute = steps != null && duration > 0 ? steps / duration : 0;

    // Analyze heart rate variability pattern
    final highIntensityPercentage =
        (zones.zone4Minutes + zones.zone5Minutes) / zones.totalMinutes * 100;
    final lowIntensityPercentage =
        (zones.zone1Minutes + zones.zone2Minutes) / zones.totalMinutes * 100;

    // Classification rules
    if (stepsPerMinute > 150) {
      return WorkoutTypes.running;
    } else if (stepsPerMinute > 80) {
      return WorkoutTypes.walking;
    } else if (highIntensityPercentage > 60 && duration < 40) {
      return WorkoutTypes.hiit;
    } else if (lowIntensityPercentage > 70 && duration > 30) {
      return WorkoutTypes.yoga;
    } else if (highIntensityPercentage > 30 && duration > 20 && duration < 90) {
      // Could be sport or strength training
      if (steps == null || stepsPerMinute < 50) {
        return WorkoutTypes.strength;
      } else {
        return WorkoutTypes.futsal; // Common in Egypt
      }
    } else {
      return WorkoutTypes.other;
    }
  }

  double _calculateDetectionConfidence(
    List<HeartRateSample> samples,
    int duration,
    double avgHr,
    double baselineHr,
  ) {
    var confidence = 0.5;

    // More samples = higher confidence
    if (samples.length > 20) confidence += 0.1;
    if (samples.length > 50) confidence += 0.1;

    // Longer duration = higher confidence
    if (duration > 20) confidence += 0.1;
    if (duration > 45) confidence += 0.1;

    // Higher heart rate elevation = more confident it's a workout
    final hrElevation = (avgHr - baselineHr) / baselineHr;
    if (hrElevation > 0.3) confidence += 0.1;
    if (hrElevation > 0.5) confidence += 0.1;

    return confidence.clamp(0.0, 1.0);
  }

  int _estimateCalories({
    required int duration,
    required int avgHr,
    required WorkoutIntensity intensity,
  }) {
    // Simple calorie estimation
    // In reality, this would factor in age, weight, gender
    const baseCaloriesPerMinute = 5.0;
    final intensityMultiplier = intensity.strainMultiplier;
    final hrMultiplier = avgHr / 100; // Normalized around 100 bpm

    return (duration * baseCaloriesPerMinute * intensityMultiplier * hrMultiplier)
        .round();
  }
}

/// Helper class for elevated heart rate periods
class _ElevatedPeriod {
  final DateTime startTime;
  final DateTime endTime;

  _ElevatedPeriod({
    required this.startTime,
    required this.endTime,
  });
}

/// Result from AI workout classification
class AiWorkoutClassificationResult {
  final String primaryType;
  final double confidence;
  final List<ClassificationAlternative> alternatives;
  final String? reasoning;

  AiWorkoutClassificationResult({
    required this.primaryType,
    required this.confidence,
    this.alternatives = const [],
    this.reasoning,
  });

  WorkoutClassification toWorkoutClassification() {
    return WorkoutClassification(
      primaryType: primaryType,
      confidence: confidence,
      alternatives: alternatives,
      reasoning: reasoning,
      isAiClassified: true,
    );
  }
}

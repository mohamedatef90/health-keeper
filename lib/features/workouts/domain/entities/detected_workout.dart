import 'package:freezed_annotation/freezed_annotation.dart';

part 'detected_workout.freezed.dart';
part 'detected_workout.g.dart';

/// A workout detected from HealthKit data analysis
///
/// This entity represents workouts that are automatically detected
/// by analyzing heart rate patterns, movement data, and activity duration
/// from Apple Watch/HealthKit data.
@freezed
class DetectedWorkout with _$DetectedWorkout {
  const factory DetectedWorkout({
    required String id,

    /// When the workout started
    required DateTime startTime,

    /// When the workout ended
    required DateTime endTime,

    /// Duration in minutes
    required int durationMinutes,

    /// Average heart rate during the workout
    required double averageHeartRate,

    /// Maximum heart rate recorded
    required double maxHeartRate,

    /// Minimum heart rate during workout
    double? minHeartRate,

    /// Heart rate samples during workout
    @Default([]) List<HeartRateSample> heartRateSamples,

    /// Estimated calories burned
    required int estimatedCalories,

    /// Detected intensity level
    required WorkoutIntensity intensity,

    /// Suggested workout type based on pattern analysis
    required String suggestedType,

    /// AI confidence in the workout detection (0-100)
    required double confidence,

    /// Step count during workout (if available)
    int? steps,

    /// Active energy burned (HealthKit)
    int? activeEnergy,

    /// Distance covered (if applicable, in meters)
    double? distanceMeters,

    /// Elevation gain (if applicable, in meters)
    double? elevationGain,

    /// Heart rate zones distribution
    HeartRateZones? heartRateZones,

    /// Detection source
    @Default(DetectionSource.healthkit) DetectionSource source,

    /// Has this workout been confirmed by the user?
    @Default(false) bool isConfirmed,

    /// Has the user dismissed this detection?
    @Default(false) bool isDismissed,

    /// Notes from AI analysis
    String? analysisNotes,
  }) = _DetectedWorkout;

  factory DetectedWorkout.fromJson(Map<String, dynamic> json) =>
      _$DetectedWorkoutFromJson(json);
}

/// Heart rate sample for analysis
@freezed
class HeartRateSample with _$HeartRateSample {
  const factory HeartRateSample({
    required DateTime timestamp,
    required int heartRate,
  }) = _HeartRateSample;

  factory HeartRateSample.fromJson(Map<String, dynamic> json) =>
      _$HeartRateSampleFromJson(json);
}

/// Step sample for analysis
@freezed
class StepSample with _$StepSample {
  const factory StepSample({
    required DateTime timestamp,
    required int steps,
  }) = _StepSample;

  factory StepSample.fromJson(Map<String, dynamic> json) =>
      _$StepSampleFromJson(json);
}

/// Heart rate zone distribution during workout
@freezed
class HeartRateZones with _$HeartRateZones {
  const factory HeartRateZones({
    /// Minutes in Zone 1 (50-60% max HR)
    @Default(0) int zone1Minutes,

    /// Minutes in Zone 2 (60-70% max HR)
    @Default(0) int zone2Minutes,

    /// Minutes in Zone 3 (70-80% max HR)
    @Default(0) int zone3Minutes,

    /// Minutes in Zone 4 (80-90% max HR)
    @Default(0) int zone4Minutes,

    /// Minutes in Zone 5 (90-100% max HR)
    @Default(0) int zone5Minutes,
  }) = _HeartRateZones;

  factory HeartRateZones.fromJson(Map<String, dynamic> json) =>
      _$HeartRateZonesFromJson(json);
}

/// Extension for HeartRateZones
extension HeartRateZonesExtension on HeartRateZones {
  /// Total minutes across all zones
  int get totalMinutes =>
      zone1Minutes + zone2Minutes + zone3Minutes + zone4Minutes + zone5Minutes;

  /// Percentage in each zone
  double get zone1Percentage =>
      totalMinutes > 0 ? zone1Minutes / totalMinutes * 100 : 0;
  double get zone2Percentage =>
      totalMinutes > 0 ? zone2Minutes / totalMinutes * 100 : 0;
  double get zone3Percentage =>
      totalMinutes > 0 ? zone3Minutes / totalMinutes * 100 : 0;
  double get zone4Percentage =>
      totalMinutes > 0 ? zone4Minutes / totalMinutes * 100 : 0;
  double get zone5Percentage =>
      totalMinutes > 0 ? zone5Minutes / totalMinutes * 100 : 0;

  /// Minutes in aerobic zones (1-3)
  int get aerobicMinutes => zone1Minutes + zone2Minutes + zone3Minutes;

  /// Minutes in anaerobic zones (4-5)
  int get anaerobicMinutes => zone4Minutes + zone5Minutes;
}

/// Workout intensity classification
@JsonEnum()
enum WorkoutIntensity {
  /// Very light, mostly rest
  @JsonValue('very_light')
  veryLight,

  /// Light activity
  @JsonValue('light')
  light,

  /// Moderate effort
  @JsonValue('moderate')
  moderate,

  /// High intensity
  @JsonValue('high')
  high,

  /// Maximum effort
  @JsonValue('maximum')
  maximum,
}

/// Extension for WorkoutIntensity
extension WorkoutIntensityExtension on WorkoutIntensity {
  String get label {
    switch (this) {
      case WorkoutIntensity.veryLight:
        return 'Very Light';
      case WorkoutIntensity.light:
        return 'Light';
      case WorkoutIntensity.moderate:
        return 'Moderate';
      case WorkoutIntensity.high:
        return 'High';
      case WorkoutIntensity.maximum:
        return 'Maximum';
    }
  }

  String get labelAr {
    switch (this) {
      case WorkoutIntensity.veryLight:
        return 'خفيف جداً';
      case WorkoutIntensity.light:
        return 'خفيف';
      case WorkoutIntensity.moderate:
        return 'متوسط';
      case WorkoutIntensity.high:
        return 'عالي';
      case WorkoutIntensity.maximum:
        return 'أقصى شدة';
    }
  }

  /// Estimated strain multiplier for this intensity
  double get strainMultiplier {
    switch (this) {
      case WorkoutIntensity.veryLight:
        return 0.3;
      case WorkoutIntensity.light:
        return 0.5;
      case WorkoutIntensity.moderate:
        return 1.0;
      case WorkoutIntensity.high:
        return 1.5;
      case WorkoutIntensity.maximum:
        return 2.0;
    }
  }

  String get colorHex {
    switch (this) {
      case WorkoutIntensity.veryLight:
        return '#9E9E9E'; // Grey
      case WorkoutIntensity.light:
        return '#4CAF50'; // Green
      case WorkoutIntensity.moderate:
        return '#FFEB3B'; // Yellow
      case WorkoutIntensity.high:
        return '#FF9800'; // Orange
      case WorkoutIntensity.maximum:
        return '#F44336'; // Red
    }
  }
}

/// Source of workout detection
@JsonEnum()
enum DetectionSource {
  /// Detected from HealthKit data
  @JsonValue('healthkit')
  healthkit,

  /// Detected from Apple Watch workout
  @JsonValue('watch')
  watch,

  /// Detected from manual entry analysis
  @JsonValue('manual')
  manual,

  /// AI-classified from patterns
  @JsonValue('ai')
  ai,
}

/// Result of workout classification
@freezed
class WorkoutClassification with _$WorkoutClassification {
  const factory WorkoutClassification({
    /// Primary workout type classification
    required String primaryType,

    /// Confidence in primary classification (0-100)
    required double confidence,

    /// Alternative classifications with confidence
    @Default([]) List<ClassificationAlternative> alternatives,

    /// Reasoning for the classification
    String? reasoning,

    /// Was AI used for classification?
    @Default(false) bool isAiClassified,
  }) = _WorkoutClassification;

  factory WorkoutClassification.fromJson(Map<String, dynamic> json) =>
      _$WorkoutClassificationFromJson(json);
}

/// Alternative workout classification
@freezed
class ClassificationAlternative with _$ClassificationAlternative {
  const factory ClassificationAlternative({
    required String type,
    required double confidence,
  }) = _ClassificationAlternative;

  factory ClassificationAlternative.fromJson(Map<String, dynamic> json) =>
      _$ClassificationAlternativeFromJson(json);
}

/// Extension for DetectedWorkout
extension DetectedWorkoutExtension on DetectedWorkout {
  /// Calculate estimated strain score (0-21)
  double get estimatedStrain {
    // Base strain from duration
    final durationFactor = (durationMinutes / 60).clamp(0.0, 2.0);

    // Intensity factor
    final intensityFactor = intensity.strainMultiplier;

    // Heart rate contribution
    double hrFactor = 1.0;
    if (maxHeartRate > 0) {
      // Higher HR relative to estimated max (220 - age, assuming age 30)
      final estimatedMaxHr = 190.0;
      hrFactor = (maxHeartRate / estimatedMaxHr).clamp(0.5, 1.5);
    }

    final strain = durationFactor * intensityFactor * hrFactor * 10;
    return strain.clamp(0.0, 21.0);
  }

  /// Check if this looks like a cardio workout
  bool get isLikelyCardio {
    return suggestedType.toLowerCase().contains('running') ||
        suggestedType.toLowerCase().contains('cycling') ||
        suggestedType.toLowerCase().contains('walking') ||
        suggestedType.toLowerCase().contains('swimming') ||
        suggestedType.toLowerCase().contains('cardio');
  }

  /// Check if this looks like a strength workout
  bool get isLikelyStrength {
    return suggestedType.toLowerCase().contains('strength') ||
        suggestedType.toLowerCase().contains('weights') ||
        suggestedType.toLowerCase().contains('gym') ||
        suggestedType.toLowerCase().contains('resistance');
  }

  /// Get display name for the workout
  String getDisplayName(String language) {
    if (language == 'ar') {
      return _getArabicWorkoutName(suggestedType);
    }
    return suggestedType;
  }

  String _getArabicWorkoutName(String type) {
    final typeMap = {
      'walking': 'مشي',
      'running': 'جري',
      'cycling': 'دراجة',
      'swimming': 'سباحة',
      'hiit': 'تمرين متقطع',
      'strength': 'تمرين قوة',
      'yoga': 'يوجا',
      'stretching': 'تمدد',
      'football': 'كرة قدم',
      'futsal': 'كرة صالات',
      'basketball': 'كرة سلة',
      'other': 'تمرين آخر',
    };
    return typeMap[type.toLowerCase()] ?? type;
  }
}

/// Workout types for classification
class WorkoutTypes {
  WorkoutTypes._();

  static const String walking = 'Walking';
  static const String running = 'Running';
  static const String cycling = 'Cycling';
  static const String swimming = 'Swimming';
  static const String hiit = 'HIIT';
  static const String strength = 'Strength Training';
  static const String yoga = 'Yoga';
  static const String stretching = 'Stretching';
  static const String football = 'Football';
  static const String futsal = 'Futsal';
  static const String basketball = 'Basketball';
  static const String other = 'Other';

  static const List<String> all = [
    walking,
    running,
    cycling,
    swimming,
    hiit,
    strength,
    yoga,
    stretching,
    football,
    futsal,
    basketball,
    other,
  ];

  /// Arabic workout names
  static const Map<String, String> arabicNames = {
    walking: 'مشي',
    running: 'جري',
    cycling: 'دراجة',
    swimming: 'سباحة',
    hiit: 'تمرين متقطع عالي الشدة',
    strength: 'تمرين قوة',
    yoga: 'يوجا',
    stretching: 'تمدد',
    football: 'كرة قدم',
    futsal: 'كرة صالات',
    basketball: 'كرة سلة',
    other: 'تمرين آخر',
  };
}

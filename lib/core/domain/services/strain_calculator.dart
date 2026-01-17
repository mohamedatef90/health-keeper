import 'dart:math' as math;
import 'package:uuid/uuid.dart';

import '../entities/strain_score.dart';

/// Service for calculating strain scores based on WHOOP-inspired algorithm
///
/// Formula: S = k * log_b(weighted_zone_sum + c)
/// Where:
/// - k = scaling factor to normalize to 0-21 range
/// - b = logarithmic base
/// - weighted_zone_sum = sum of (zone_minutes * zone_weight)
/// - c = offset constant to prevent log(0)
///
/// HR Zones based on max HR:
/// - Zone 1: 50-60% max HR (weight: 1)
/// - Zone 2: 60-70% max HR (weight: 2)
/// - Zone 3: 70-80% max HR (weight: 3)
/// - Zone 4: 80-90% max HR (weight: 5)
/// - Zone 5: 90-100% max HR (weight: 8)
abstract class StrainCalculator {
  /// Calculate strain score from heart rate zone data
  StrainScore calculateFromZoneData({
    required DateTime date,
    required int maxHeartRate,
    required HRZoneData zoneData,
    int? peakHeartRate,
    int? averageHeartRate,
    int workoutCount = 0,
    int? caloriesBurned,
    StrainDataSource dataSource = StrainDataSource.calculated,
  });

  /// Calculate strain from raw heart rate samples
  StrainScore calculateFromHeartRateSamples({
    required DateTime date,
    required int maxHeartRate,
    required List<HeartRateSample> samples,
    int workoutCount = 0,
    int? caloriesBurned,
    StrainDataSource dataSource = StrainDataSource.healthkit,
  });

  /// Calculate max heart rate using age-based formula
  int calculateMaxHeartRate(int age);

  /// Get HR zone for a given heart rate
  int getHeartRateZone(int heartRate, int maxHeartRate);

  /// Get zone boundaries for a given max heart rate
  HeartRateZoneBoundaries getZoneBoundaries(int maxHeartRate);
}

/// Heart rate sample data point
class HeartRateSample {
  final DateTime timestamp;
  final int heartRate;
  final int durationSeconds;

  const HeartRateSample({
    required this.timestamp,
    required this.heartRate,
    required this.durationSeconds,
  });
}

/// Heart rate zone boundaries
class HeartRateZoneBoundaries {
  final int maxHeartRate;
  final int zone1Min;
  final int zone1Max;
  final int zone2Min;
  final int zone2Max;
  final int zone3Min;
  final int zone3Max;
  final int zone4Min;
  final int zone4Max;
  final int zone5Min;
  final int zone5Max;

  const HeartRateZoneBoundaries({
    required this.maxHeartRate,
    required this.zone1Min,
    required this.zone1Max,
    required this.zone2Min,
    required this.zone2Max,
    required this.zone3Min,
    required this.zone3Max,
    required this.zone4Min,
    required this.zone4Max,
    required this.zone5Min,
    required this.zone5Max,
  });
}

/// Implementation of the strain calculator
class StrainCalculatorImpl implements StrainCalculator {
  static const _uuid = Uuid();

  // Zone weights based on WHOOP-inspired algorithm
  static const double _zone1Weight = 1.0;
  static const double _zone2Weight = 2.0;
  static const double _zone3Weight = 3.0;
  static const double _zone4Weight = 5.0;
  static const double _zone5Weight = 8.0;

  // Logarithmic constants for strain formula
  // These are calibrated so that:
  // - 60 mins in Zone 5 alone = ~21 strain
  // - 60 mins in Zone 3 alone = ~10 strain
  // - 30 mins in Zone 2 alone = ~3 strain
  static const double _scalingFactor = 5.5;
  static const double _logBase = 2.0;
  static const double _offset = 1.0;

  // Maximum strain score
  static const double _maxStrain = 21.0;

  @override
  StrainScore calculateFromZoneData({
    required DateTime date,
    required int maxHeartRate,
    required HRZoneData zoneData,
    int? peakHeartRate,
    int? averageHeartRate,
    int workoutCount = 0,
    int? caloriesBurned,
    StrainDataSource dataSource = StrainDataSource.calculated,
  }) {
    final weightedSum = _calculateWeightedZoneSum(zoneData);
    final score = _calculateStrainScore(weightedSum);

    final totalMinutes = zoneData.zone1Minutes +
        zoneData.zone2Minutes +
        zoneData.zone3Minutes +
        zoneData.zone4Minutes +
        zoneData.zone5Minutes;

    return StrainScore(
      id: _uuid.v4(),
      date: date,
      calculatedAt: DateTime.now(),
      score: score,
      maxHeartRate: maxHeartRate,
      zoneData: zoneData,
      totalActiveMinutes: totalMinutes,
      peakHeartRate: peakHeartRate,
      averageHeartRate: averageHeartRate,
      workoutCount: workoutCount,
      caloriesBurned: caloriesBurned,
      dataSource: dataSource,
    );
  }

  @override
  StrainScore calculateFromHeartRateSamples({
    required DateTime date,
    required int maxHeartRate,
    required List<HeartRateSample> samples,
    int workoutCount = 0,
    int? caloriesBurned,
    StrainDataSource dataSource = StrainDataSource.healthkit,
  }) {
    if (samples.isEmpty) {
      return StrainScore(
        id: _uuid.v4(),
        date: date,
        calculatedAt: DateTime.now(),
        score: 0,
        maxHeartRate: maxHeartRate,
        zoneData: const HRZoneData(),
        totalActiveMinutes: 0,
        workoutCount: workoutCount,
        caloriesBurned: caloriesBurned,
        dataSource: dataSource,
      );
    }

    // Accumulate time in each zone
    int zone1Seconds = 0;
    int zone2Seconds = 0;
    int zone3Seconds = 0;
    int zone4Seconds = 0;
    int zone5Seconds = 0;

    int peakHR = 0;
    int totalHR = 0;
    int hrCount = 0;

    for (final sample in samples) {
      final zone = getHeartRateZone(sample.heartRate, maxHeartRate);
      final duration = sample.durationSeconds;

      switch (zone) {
        case 1:
          zone1Seconds += duration;
          break;
        case 2:
          zone2Seconds += duration;
          break;
        case 3:
          zone3Seconds += duration;
          break;
        case 4:
          zone4Seconds += duration;
          break;
        case 5:
          zone5Seconds += duration;
          break;
      }

      if (sample.heartRate > peakHR) {
        peakHR = sample.heartRate;
      }
      totalHR += sample.heartRate;
      hrCount++;
    }

    final zoneData = HRZoneData(
      zone1Minutes: (zone1Seconds / 60).round(),
      zone2Minutes: (zone2Seconds / 60).round(),
      zone3Minutes: (zone3Seconds / 60).round(),
      zone4Minutes: (zone4Seconds / 60).round(),
      zone5Minutes: (zone5Seconds / 60).round(),
    );

    final averageHR = hrCount > 0 ? (totalHR / hrCount).round() : null;

    return calculateFromZoneData(
      date: date,
      maxHeartRate: maxHeartRate,
      zoneData: zoneData,
      peakHeartRate: peakHR > 0 ? peakHR : null,
      averageHeartRate: averageHR,
      workoutCount: workoutCount,
      caloriesBurned: caloriesBurned,
      dataSource: dataSource,
    );
  }

  @override
  int calculateMaxHeartRate(int age) {
    // Using the Tanaka formula: 208 - (0.7 * age)
    // More accurate than traditional 220 - age
    return (208 - (0.7 * age)).round();
  }

  @override
  int getHeartRateZone(int heartRate, int maxHeartRate) {
    final percentage = heartRate / maxHeartRate * 100;

    if (percentage >= 90) return 5;
    if (percentage >= 80) return 4;
    if (percentage >= 70) return 3;
    if (percentage >= 60) return 2;
    if (percentage >= 50) return 1;
    return 0; // Below zone 1
  }

  @override
  HeartRateZoneBoundaries getZoneBoundaries(int maxHeartRate) {
    return HeartRateZoneBoundaries(
      maxHeartRate: maxHeartRate,
      zone1Min: (maxHeartRate * 0.50).round(),
      zone1Max: (maxHeartRate * 0.60).round() - 1,
      zone2Min: (maxHeartRate * 0.60).round(),
      zone2Max: (maxHeartRate * 0.70).round() - 1,
      zone3Min: (maxHeartRate * 0.70).round(),
      zone3Max: (maxHeartRate * 0.80).round() - 1,
      zone4Min: (maxHeartRate * 0.80).round(),
      zone4Max: (maxHeartRate * 0.90).round() - 1,
      zone5Min: (maxHeartRate * 0.90).round(),
      zone5Max: maxHeartRate,
    );
  }

  /// Calculate the weighted sum of zone minutes
  double _calculateWeightedZoneSum(HRZoneData zoneData) {
    return (zoneData.zone1Minutes * _zone1Weight) +
        (zoneData.zone2Minutes * _zone2Weight) +
        (zoneData.zone3Minutes * _zone3Weight) +
        (zoneData.zone4Minutes * _zone4Weight) +
        (zoneData.zone5Minutes * _zone5Weight);
  }

  /// Calculate strain score using logarithmic formula
  double _calculateStrainScore(double weightedSum) {
    if (weightedSum <= 0) return 0;

    // S = k * log_b(weighted_sum + c)
    // Using natural log and converting: log_b(x) = ln(x) / ln(b)
    final logValue = math.log(weightedSum + _offset) / math.log(_logBase);
    final rawScore = _scalingFactor * logValue;

    // Clamp to valid range
    return rawScore.clamp(0, _maxStrain);
  }
}

/// Recommended strain based on recovery score
class StrainRecommendation {
  final double minStrain;
  final double maxStrain;
  final String message;

  const StrainRecommendation({
    required this.minStrain,
    required this.maxStrain,
    required this.message,
  });

  /// Get strain recommendation based on recovery score
  static StrainRecommendation forRecoveryScore(int recoveryScore) {
    if (recoveryScore >= 80) {
      return const StrainRecommendation(
        minStrain: 12,
        maxStrain: 21,
        message: 'Your body is ready for high-intensity training',
      );
    } else if (recoveryScore >= 60) {
      return const StrainRecommendation(
        minStrain: 8,
        maxStrain: 14,
        message: 'Moderate training is recommended today',
      );
    } else if (recoveryScore >= 40) {
      return const StrainRecommendation(
        minStrain: 4,
        maxStrain: 10,
        message: 'Light activity is best for recovery',
      );
    } else {
      return const StrainRecommendation(
        minStrain: 0,
        maxStrain: 5,
        message: 'Focus on rest and recovery today',
      );
    }
  }
}

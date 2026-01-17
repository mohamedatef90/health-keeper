import 'dart:math' as math;
import 'package:uuid/uuid.dart';

import '../entities/recovery_score.dart';
import '../entities/recovery_metrics.dart';

/// Service for calculating recovery scores based on WHOOP-inspired algorithm
///
/// Component Weights:
/// - HRV: 40% - Heart Rate Variability compared to 7-day baseline
/// - RHR: 25% - Resting Heart Rate compared to 7-day baseline
/// - Sleep: 25% - Sleep performance (actual vs needed)
/// - Respiratory Rate: 10% - Deviation from baseline
abstract class RecoveryCalculator {
  /// Calculate recovery score from current metrics and baseline
  RecoveryScore calculate({
    required DateTime date,
    required DailyMetrics todayMetrics,
    required List<DailyMetrics> historicalMetrics,
    double? previousDayStrain,
  });

  /// Calculate baseline metrics from historical data
  BaselineMetrics calculateBaseline(List<DailyMetrics> metrics);

  /// Calculate sleep need based on strain and recovery
  double calculateSleepNeed({
    required double previousDayStrain,
    required int age,
    int? previousRecoveryScore,
  });

  /// Get recovery state from score
  RecoveryState getRecoveryState(int score);
}

/// Daily metrics input for recovery calculation
class DailyMetrics {
  final DateTime date;
  final int? hrv; // Heart Rate Variability in ms
  final int? restingHeartRate; // Resting HR in bpm
  final double? sleepDuration; // Sleep duration in hours
  final int? sleepQuality; // 0-100 quality score
  final double? respiratoryRate; // Breaths per minute

  const DailyMetrics({
    required this.date,
    this.hrv,
    this.restingHeartRate,
    this.sleepDuration,
    this.sleepQuality,
    this.respiratoryRate,
  });

  /// Create from RecoveryMetrics entity
  factory DailyMetrics.fromRecoveryMetrics(RecoveryMetrics metrics) {
    return DailyMetrics(
      date: metrics.date,
      hrv: metrics.hrv,
      restingHeartRate: metrics.restingHR,
      sleepDuration: metrics.sleepDuration,
      sleepQuality: metrics.sleepQuality,
    );
  }

  bool get hasHrv => hrv != null;
  bool get hasRhr => restingHeartRate != null;
  bool get hasSleep => sleepDuration != null;
  bool get hasRespiratoryRate => respiratoryRate != null;
}

/// Implementation of the recovery calculator
class RecoveryCalculatorImpl implements RecoveryCalculator {
  static const _uuid = Uuid();

  // Component weights
  static const double _hrvWeight = 0.40;
  static const double _rhrWeight = 0.25;
  static const double _sleepWeight = 0.25;
  static const double _respiratoryWeight = 0.10;

  // Default values when data is missing
  static const double _defaultHrv = 50.0;
  static const double _defaultRhr = 60.0;
  static const double _defaultSleepHours = 7.0;
  static const double _defaultRespiratoryRate = 14.0;

  // Sleep need calculation constants
  static const double _baseSleepNeed = 7.5; // Base sleep need in hours
  static const double _strainSleepFactor = 0.1; // Additional hours per strain point above 10

  @override
  RecoveryScore calculate({
    required DateTime date,
    required DailyMetrics todayMetrics,
    required List<DailyMetrics> historicalMetrics,
    double? previousDayStrain,
  }) {
    // Calculate baseline from historical data
    final baseline = calculateBaseline(historicalMetrics);

    // Calculate component scores
    final hrvScore = _calculateHrvScore(
      (todayMetrics.hrv ?? _defaultHrv).toDouble(),
      baseline.avgHrv,
      baseline.hrvStdDev,
    );

    final rhrScore = _calculateRhrScore(
      (todayMetrics.restingHeartRate ?? _defaultRhr).toDouble(),
      baseline.avgRhr,
      baseline.rhrStdDev,
    );

    final sleepNeed = calculateSleepNeed(
      previousDayStrain: previousDayStrain ?? 10.0,
      age: 30, // Default age, should be passed from user profile
    );

    final sleepScore = _calculateSleepScore(
      todayMetrics.sleepDuration ?? _defaultSleepHours,
      sleepNeed,
      todayMetrics.sleepQuality,
    );

    final respiratoryScore = _calculateRespiratoryScore(
      todayMetrics.respiratoryRate ?? _defaultRespiratoryRate,
      baseline.avgRespiratoryRate,
      baseline.respiratoryRateStdDev,
    );

    // Calculate weighted overall score
    final overallScore = (
      (hrvScore * _hrvWeight) +
      (rhrScore * _rhrWeight) +
      (sleepScore * _sleepWeight) +
      (respiratoryScore * _respiratoryWeight)
    ).round().clamp(0, 100);

    // Calculate deviations
    final deviations = _calculateDeviations(
      todayMetrics,
      baseline,
      sleepNeed,
    );

    // Create sleep performance data
    final sleepPerformance = todayMetrics.hasSleep
        ? SleepPerformance(
            actualSleep: todayMetrics.sleepDuration!,
            neededSleep: sleepNeed,
            qualityScore: todayMetrics.sleepQuality,
          )
        : null;

    return RecoveryScore(
      id: _uuid.v4(),
      date: date,
      calculatedAt: DateTime.now(),
      score: overallScore,
      components: RecoveryComponents(
        hrvScore: hrvScore,
        rhrScore: rhrScore,
        sleepScore: sleepScore,
        respiratoryScore: respiratoryScore,
      ),
      baseline: baseline,
      deviations: deviations,
      sleepPerformance: sleepPerformance,
      state: getRecoveryState(overallScore),
      dataSource: RecoveryDataSource.calculated,
    );
  }

  @override
  BaselineMetrics calculateBaseline(List<DailyMetrics> metrics) {
    if (metrics.isEmpty) {
      return BaselineMetrics(
        avgHrv: _defaultHrv.toDouble(),
        hrvStdDev: 10,
        avgRhr: _defaultRhr.toDouble(),
        rhrStdDev: 5,
        avgSleepDuration: _defaultSleepHours,
        avgRespiratoryRate: _defaultRespiratoryRate,
        respiratoryRateStdDev: 1,
        daysInBaseline: 0,
      );
    }

    // Collect valid values for each metric
    final hrvValues = metrics
        .where((m) => m.hasHrv)
        .map((m) => m.hrv!.toDouble())
        .toList();

    final rhrValues = metrics
        .where((m) => m.hasRhr)
        .map((m) => m.restingHeartRate!.toDouble())
        .toList();

    final sleepValues = metrics
        .where((m) => m.hasSleep)
        .map((m) => m.sleepDuration!)
        .toList();

    final respiratoryValues = metrics
        .where((m) => m.hasRespiratoryRate)
        .map((m) => m.respiratoryRate!)
        .toList();

    return BaselineMetrics(
      avgHrv: _calculateMean(hrvValues, _defaultHrv.toDouble()),
      hrvStdDev: _calculateStdDev(hrvValues, 10),
      avgRhr: _calculateMean(rhrValues, _defaultRhr.toDouble()),
      rhrStdDev: _calculateStdDev(rhrValues, 5),
      avgSleepDuration: _calculateMean(sleepValues, _defaultSleepHours),
      avgRespiratoryRate: _calculateMean(respiratoryValues, _defaultRespiratoryRate),
      respiratoryRateStdDev: _calculateStdDev(respiratoryValues, 1),
      daysInBaseline: metrics.length,
    );
  }

  @override
  double calculateSleepNeed({
    required double previousDayStrain,
    required int age,
    int? previousRecoveryScore,
  }) {
    // Base sleep need adjusted by age
    double baseSleep = _baseSleepNeed;
    if (age < 25) {
      baseSleep += 0.5; // Younger people need more sleep
    } else if (age > 50) {
      baseSleep -= 0.25; // Older adults may need slightly less
    }

    // Add sleep based on previous day's strain
    double strainAdjustment = 0;
    if (previousDayStrain > 10) {
      strainAdjustment = (previousDayStrain - 10) * _strainSleepFactor;
    }

    // Adjust for recovery deficit
    double recoveryAdjustment = 0;
    if (previousRecoveryScore != null && previousRecoveryScore < 50) {
      recoveryAdjustment = (50 - previousRecoveryScore) * 0.02;
    }

    return (baseSleep + strainAdjustment + recoveryAdjustment).clamp(6.0, 10.0);
  }

  @override
  RecoveryState getRecoveryState(int score) {
    if (score >= 80) return RecoveryState.peak;
    if (score >= 60) return RecoveryState.good;
    if (score >= 40) return RecoveryState.moderate;
    if (score >= 20) return RecoveryState.low;
    return RecoveryState.rest;
  }

  /// Calculate HRV component score (0-100)
  /// Higher HRV is better - indicates good parasympathetic tone
  int _calculateHrvScore(double hrv, double baselineHrv, double stdDev) {
    if (stdDev == 0) stdDev = 10; // Prevent division by zero

    // Calculate z-score
    final zScore = (hrv - baselineHrv) / stdDev;

    // Convert z-score to 0-100 scale
    // z-score of +2 = 100, z-score of -2 = 0
    final score = 50 + (zScore * 25);

    return score.round().clamp(0, 100);
  }

  /// Calculate RHR component score (0-100)
  /// Lower RHR is better - indicates good cardiovascular fitness
  int _calculateRhrScore(double rhr, double baselineRhr, double stdDev) {
    if (stdDev == 0) stdDev = 5;

    // Calculate z-score (inverted - lower is better)
    final zScore = (baselineRhr - rhr) / stdDev;

    // Convert z-score to 0-100 scale
    final score = 50 + (zScore * 25);

    return score.round().clamp(0, 100);
  }

  /// Calculate sleep component score (0-100)
  int _calculateSleepScore(
    double actualSleep,
    double neededSleep,
    int? qualityScore,
  ) {
    // Sleep duration score (0-100)
    final durationRatio = actualSleep / neededSleep;
    int durationScore;

    if (durationRatio >= 1.0) {
      // Met or exceeded sleep need
      durationScore = 100;
    } else if (durationRatio >= 0.9) {
      // 90-100% of need
      durationScore = 80 + ((durationRatio - 0.9) * 200).round();
    } else if (durationRatio >= 0.75) {
      // 75-90% of need
      durationScore = 50 + ((durationRatio - 0.75) * 200).round();
    } else {
      // Less than 75% of need
      durationScore = (durationRatio * 66.67).round();
    }

    // Combine with quality if available
    if (qualityScore != null) {
      return ((durationScore * 0.6) + (qualityScore * 0.4)).round().clamp(0, 100);
    }

    return durationScore.clamp(0, 100);
  }

  /// Calculate respiratory rate score (0-100)
  /// Stability is good - large deviations indicate stress
  int _calculateRespiratoryScore(
    double rate,
    double baselineRate,
    double stdDev,
  ) {
    if (stdDev == 0) stdDev = 1;

    // Calculate absolute deviation
    final deviation = (rate - baselineRate).abs();
    final zScore = deviation / stdDev;

    // Score decreases with deviation
    // 0 std dev = 100, 2+ std dev = 0
    final score = 100 - (zScore * 50);

    return score.round().clamp(0, 100);
  }

  /// Calculate deviations for each metric
  MetricDeviations _calculateDeviations(
    DailyMetrics metrics,
    BaselineMetrics baseline,
    double sleepNeed,
  ) {
    final hrvDev = baseline.hrvStdDev > 0
        ? ((metrics.hrv ?? baseline.avgHrv) - baseline.avgHrv) / baseline.hrvStdDev
        : 0.0;

    final rhrDev = baseline.rhrStdDev > 0
        ? ((metrics.restingHeartRate ?? baseline.avgRhr) - baseline.avgRhr) /
            baseline.rhrStdDev
        : 0.0;

    final sleepDev = sleepNeed > 0
        ? (metrics.sleepDuration ?? baseline.avgSleepDuration) / sleepNeed
        : 1.0;

    final respDev = baseline.respiratoryRateStdDev > 0
        ? ((metrics.respiratoryRate ?? baseline.avgRespiratoryRate) -
                baseline.avgRespiratoryRate) /
            baseline.respiratoryRateStdDev
        : 0.0;

    return MetricDeviations(
      hrvDeviation: hrvDev,
      rhrDeviation: rhrDev,
      sleepDeviation: sleepDev,
      respiratoryDeviation: respDev,
    );
  }

  /// Calculate mean of a list of values
  double _calculateMean(List<double> values, double defaultValue) {
    if (values.isEmpty) return defaultValue;
    return values.reduce((a, b) => a + b) / values.length;
  }

  /// Calculate standard deviation
  double _calculateStdDev(List<double> values, double defaultValue) {
    if (values.length < 2) return defaultValue;

    final mean = _calculateMean(values, 0);
    final squaredDiffs = values.map((v) => math.pow(v - mean, 2));
    final variance = squaredDiffs.reduce((a, b) => a + b) / values.length;

    return math.sqrt(variance);
  }
}

/// Recovery insights generator
class RecoveryInsights {
  final RecoveryScore recovery;
  final double? previousDayStrain;

  RecoveryInsights(this.recovery, {this.previousDayStrain});

  /// Get main insight message
  String get mainInsight {
    switch (recovery.state) {
      case RecoveryState.peak:
        return 'Your body is fully recovered and ready for peak performance.';
      case RecoveryState.good:
        return 'Good recovery! You can train at normal intensity.';
      case RecoveryState.moderate:
        return 'Moderate recovery. Consider a lighter training day.';
      case RecoveryState.low:
        return 'Recovery is low. Focus on rest and recovery activities.';
      case RecoveryState.rest:
        return 'Your body needs rest. Take a recovery day.';
    }
  }

  /// Get list of actionable recommendations
  List<String> get recommendations {
    final recs = <String>[];

    // Sleep recommendations
    if (recovery.sleepPerformance != null) {
      final sleepDiff = recovery.sleepPerformance!.actualSleep -
          recovery.sleepPerformance!.neededSleep;
      if (sleepDiff < -1) {
        recs.add('Go to bed ${(-sleepDiff).toStringAsFixed(1)} hours earlier tonight');
      }
    }

    // HRV-based recommendations
    if (recovery.components.hrvScore < 50) {
      recs.add('Practice stress-reduction techniques');
      recs.add('Avoid stimulants like caffeine');
    }

    // RHR-based recommendations
    if (recovery.components.rhrScore < 50) {
      recs.add('Ensure proper hydration');
      recs.add('Consider lower training intensity');
    }

    // General state-based recommendations
    if (recovery.state == RecoveryState.rest ||
        recovery.state == RecoveryState.low) {
      recs.add('Take a rest day or do light activity');
      recs.add('Focus on nutrition and hydration');
    }

    return recs;
  }

  /// Get recommended max strain for today
  double get recommendedMaxStrain {
    if (recovery.score >= 80) return 21;
    if (recovery.score >= 60) return 14;
    if (recovery.score >= 40) return 10;
    if (recovery.score >= 20) return 5;
    return 3;
  }
}

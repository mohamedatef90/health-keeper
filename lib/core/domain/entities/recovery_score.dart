import 'package:freezed_annotation/freezed_annotation.dart';

part 'recovery_score.freezed.dart';
part 'recovery_score.g.dart';

/// Recovery score entity representing body readiness on a 0-100% scale
/// Based on WHOOP-inspired recovery calculations
@freezed
class RecoveryScore with _$RecoveryScore {
  const factory RecoveryScore({
    required String id,
    required DateTime date,
    required DateTime calculatedAt,

    /// Overall recovery score (0-100)
    required int score,

    /// Component scores used in calculation
    required RecoveryComponents components,

    /// 7-day baseline metrics for comparison
    required BaselineMetrics baseline,

    /// Individual metric deviations from baseline
    required MetricDeviations deviations,

    /// Sleep performance data
    SleepPerformance? sleepPerformance,

    /// Recovery state classification
    required RecoveryState state,

    /// Data source
    required RecoveryDataSource dataSource,
  }) = _RecoveryScore;

  factory RecoveryScore.fromJson(Map<String, dynamic> json) =>
      _$RecoveryScoreFromJson(json);
}

/// Component scores that make up recovery
@freezed
class RecoveryComponents with _$RecoveryComponents {
  const factory RecoveryComponents({
    /// HRV component score (0-100), weight: 40%
    required int hrvScore,

    /// Resting HR component score (0-100), weight: 25%
    required int rhrScore,

    /// Sleep performance score (0-100), weight: 25%
    required int sleepScore,

    /// Respiratory rate score (0-100), weight: 10%
    required int respiratoryScore,
  }) = _RecoveryComponents;

  factory RecoveryComponents.fromJson(Map<String, dynamic> json) =>
      _$RecoveryComponentsFromJson(json);
}

/// 7-day rolling baseline metrics
@freezed
class BaselineMetrics with _$BaselineMetrics {
  const factory BaselineMetrics({
    /// Average HRV over 7 days (in ms)
    required double avgHrv,

    /// Standard deviation of HRV
    required double hrvStdDev,

    /// Average resting heart rate over 7 days (bpm)
    required double avgRhr,

    /// Standard deviation of RHR
    required double rhrStdDev,

    /// Average sleep duration over 7 days (hours)
    required double avgSleepDuration,

    /// Average respiratory rate (breaths per minute)
    required double avgRespiratoryRate,

    /// Standard deviation of respiratory rate
    required double respiratoryRateStdDev,

    /// Number of days used for baseline calculation
    required int daysInBaseline,
  }) = _BaselineMetrics;

  factory BaselineMetrics.fromJson(Map<String, dynamic> json) =>
      _$BaselineMetricsFromJson(json);
}

/// Metric deviations from baseline
@freezed
class MetricDeviations with _$MetricDeviations {
  const factory MetricDeviations({
    /// HRV deviation in standard deviations
    /// Positive = above baseline (good)
    required double hrvDeviation,

    /// RHR deviation in standard deviations
    /// Negative = below baseline (good, lower RHR is better)
    required double rhrDeviation,

    /// Sleep deviation as percentage of needed sleep
    /// 1.0 = exactly meeting sleep need
    required double sleepDeviation,

    /// Respiratory rate deviation in standard deviations
    /// Close to 0 is good
    required double respiratoryDeviation,
  }) = _MetricDeviations;

  factory MetricDeviations.fromJson(Map<String, dynamic> json) =>
      _$MetricDeviationsFromJson(json);
}

/// Sleep performance data
@freezed
class SleepPerformance with _$SleepPerformance {
  const factory SleepPerformance({
    /// Actual sleep duration in hours
    required double actualSleep,

    /// Needed sleep in hours (based on strain and recovery)
    required double neededSleep,

    /// Sleep efficiency percentage (time asleep / time in bed)
    int? efficiency,

    /// Time spent in different sleep stages (if available)
    SleepStages? stages,

    /// Sleep quality score (0-100)
    int? qualityScore,
  }) = _SleepPerformance;

  factory SleepPerformance.fromJson(Map<String, dynamic> json) =>
      _$SleepPerformanceFromJson(json);
}

/// Sleep stages breakdown
@freezed
class SleepStages with _$SleepStages {
  const factory SleepStages({
    /// Minutes in light sleep
    @Default(0) int lightMinutes,

    /// Minutes in deep sleep (SWS)
    @Default(0) int deepMinutes,

    /// Minutes in REM sleep
    @Default(0) int remMinutes,

    /// Minutes awake during sleep period
    @Default(0) int awakeMinutes,
  }) = _SleepStages;

  factory SleepStages.fromJson(Map<String, dynamic> json) =>
      _$SleepStagesFromJson(json);
}

/// Recovery state classification
enum RecoveryState {
  /// 80-100%: Peak performance ready
  peak,

  /// 60-79%: Good to go
  good,

  /// 40-59%: Need to be mindful
  moderate,

  /// 20-39%: Recovery needed
  low,

  /// 0-19%: Rest required
  rest,
}

/// Extension for recovery state helpers
extension RecoveryStateExtension on RecoveryState {
  String get label {
    switch (this) {
      case RecoveryState.peak:
        return 'Peak';
      case RecoveryState.good:
        return 'Good';
      case RecoveryState.moderate:
        return 'Moderate';
      case RecoveryState.low:
        return 'Low';
      case RecoveryState.rest:
        return 'Rest';
    }
  }

  String get description {
    switch (this) {
      case RecoveryState.peak:
        return 'Ready for peak performance';
      case RecoveryState.good:
        return 'Good to train normally';
      case RecoveryState.moderate:
        return 'Be mindful of intensity';
      case RecoveryState.low:
        return 'Focus on recovery activities';
      case RecoveryState.rest:
        return 'Rest day recommended';
    }
  }

  String get trainingRecommendation {
    switch (this) {
      case RecoveryState.peak:
        return 'High intensity training, competition, or PRs';
      case RecoveryState.good:
        return 'Normal training, strength or endurance work';
      case RecoveryState.moderate:
        return 'Moderate training, technique work, or light cardio';
      case RecoveryState.low:
        return 'Light activity, mobility, or active recovery';
      case RecoveryState.rest:
        return 'Complete rest, stretching, or meditation';
    }
  }
}

/// Extension for recovery score helpers
extension RecoveryScoreExtension on RecoveryScore {
  /// Get color for displaying recovery (hex values)
  String get colorHex {
    if (score >= 80) return '#4CAF50'; // Green
    if (score >= 60) return '#8BC34A'; // Light Green
    if (score >= 40) return '#FFEB3B'; // Yellow
    if (score >= 20) return '#FF9800'; // Orange
    return '#F44336'; // Red
  }

  /// Check if recovery supports a given strain level
  bool canHandleStrain(double targetStrain) {
    final maxRecommendedStrain = _getMaxRecommendedStrain();
    return targetStrain <= maxRecommendedStrain;
  }

  double _getMaxRecommendedStrain() {
    if (score >= 80) return 21;
    if (score >= 60) return 14;
    if (score >= 40) return 10;
    if (score >= 20) return 5;
    return 3;
  }

  /// Get list of insights based on recovery components
  List<String> get insights {
    final insights = <String>[];

    // HRV insights
    if (components.hrvScore >= 80) {
      insights.add('Your HRV is strong - great autonomic balance');
    } else if (components.hrvScore < 40) {
      insights.add('HRV is below baseline - body is under stress');
    }

    // RHR insights
    if (components.rhrScore >= 80) {
      insights.add('Resting heart rate is optimal');
    } else if (components.rhrScore < 40) {
      insights.add('Elevated resting heart rate detected');
    }

    // Sleep insights
    if (sleepPerformance != null) {
      final sleepDiff = sleepPerformance!.actualSleep - sleepPerformance!.neededSleep;
      if (sleepDiff >= 0) {
        insights.add('You met your sleep need last night');
      } else if (sleepDiff < -1) {
        insights.add('Sleep debt: ${(-sleepDiff).toStringAsFixed(1)} hours short');
      }
    }

    return insights;
  }
}

/// Data source for recovery calculation
@JsonEnum()
enum RecoveryDataSource {
  @JsonValue('healthkit')
  healthkit,

  @JsonValue('manual')
  manual,

  @JsonValue('calculated')
  calculated,
}

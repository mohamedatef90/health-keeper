import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_anomaly.freezed.dart';
part 'health_anomaly.g.dart';

/// Type of health anomaly detected
@JsonEnum()
enum AnomalyType {
  /// HRV dropped significantly from baseline
  @JsonValue('hrv_drop')
  hrvDrop,

  /// Resting heart rate elevated above normal
  @JsonValue('rhr_elevation')
  rhrElevation,

  /// Accumulated sleep debt
  @JsonValue('sleep_debt')
  sleepDebt,

  /// Strain/recovery imbalance (high strain, low recovery)
  @JsonValue('strain_recovery_imbalance')
  strainRecoveryImbalance,

  /// Multiple consecutive days of low recovery
  @JsonValue('prolonged_low_recovery')
  prolongedLowRecovery,

  /// Sudden weight change
  @JsonValue('weight_change')
  weightChange,

  /// Unusual activity pattern
  @JsonValue('activity_anomaly')
  activityAnomaly,

  /// Multiple warning signs combined
  @JsonValue('combined_warning')
  combinedWarning,
}

/// Severity level of the anomaly
@JsonEnum()
enum AnomalySeverity {
  /// Informational - worth noting but not concerning
  @JsonValue('info')
  info,

  /// Low - minor deviation, keep an eye on it
  @JsonValue('low')
  low,

  /// Moderate - notable deviation, consider adjustments
  @JsonValue('moderate')
  moderate,

  /// High - significant deviation, action recommended
  @JsonValue('high')
  high,

  /// Critical - immediate attention needed
  @JsonValue('critical')
  critical,
}

/// Health anomaly detected by the AI Brain monitor
@freezed
class HealthAnomaly with _$HealthAnomaly {
  const HealthAnomaly._();

  const factory HealthAnomaly({
    required String id,
    required AnomalyType type,
    required AnomalySeverity severity,

    /// Title of the anomaly (English)
    required String title,
    String? titleAr,

    /// Description of what was detected (English)
    required String description,
    String? descriptionAr,

    /// The metric that triggered this anomaly
    required String metric,

    /// Current value of the metric
    required double currentValue,

    /// Expected/baseline value
    required double expectedValue,

    /// Deviation from expected (as percentage or absolute)
    required double deviation,

    /// Unit of measurement
    String? unit,

    /// Recommended actions to address the anomaly
    @Default([]) List<AnomalyAction> recommendedActions,

    /// Related metrics that also show concerning patterns
    @Default([]) List<String> relatedMetrics,

    /// Historical context (how long has this been happening)
    int? daysActive,

    /// Confidence in the anomaly detection (0-100)
    @Default(80) int confidence,

    /// Whether this anomaly has been acknowledged by user
    @Default(false) bool isAcknowledged,

    /// Whether this anomaly has been resolved
    @Default(false) bool isResolved,

    /// Timestamps
    required DateTime detectedAt,
    DateTime? acknowledgedAt,
    DateTime? resolvedAt,

    /// Raw data that led to this detection (for debugging)
    Map<String, dynamic>? rawData,
  }) = _HealthAnomaly;

  factory HealthAnomaly.fromJson(Map<String, dynamic> json) =>
      _$HealthAnomalyFromJson(json);

  /// Get localized title
  String getTitle(String language) =>
      language == 'ar' && titleAr != null ? titleAr! : title;

  /// Get localized description
  String getDescription(String language) =>
      language == 'ar' && descriptionAr != null ? descriptionAr! : description;

  /// Check if anomaly is still active (not resolved or acknowledged > 24h ago)
  bool get isActive =>
      !isResolved &&
      (!isAcknowledged ||
          (acknowledgedAt != null &&
              DateTime.now().difference(acknowledgedAt!).inHours < 24));

  /// Get priority score (for sorting)
  int get priorityScore {
    switch (severity) {
      case AnomalySeverity.critical:
        return 100;
      case AnomalySeverity.high:
        return 80;
      case AnomalySeverity.moderate:
        return 60;
      case AnomalySeverity.low:
        return 40;
      case AnomalySeverity.info:
        return 20;
    }
  }
}

/// Recommended action for addressing an anomaly
@freezed
class AnomalyAction with _$AnomalyAction {
  const factory AnomalyAction({
    required String action,
    String? actionAr,
    required String rationale,
    String? rationaleAr,
    @Default('medium') String priority,
    @Default('general') String category,
  }) = _AnomalyAction;

  factory AnomalyAction.fromJson(Map<String, dynamic> json) =>
      _$AnomalyActionFromJson(json);
}

/// Detection thresholds for anomalies
class AnomalyThresholds {
  /// HRV drop threshold (percentage below baseline)
  static const double hrvDropThreshold = 0.25; // 25% drop

  /// RHR elevation threshold (bpm above baseline)
  static const double rhrElevationThreshold = 10; // 10 bpm

  /// Sleep debt accumulation threshold (hours)
  static const double sleepDebtThreshold = 5; // 5 hours accumulated

  /// Days of low recovery before flagging
  static const int lowRecoveryDays = 2;

  /// Recovery score considered "low"
  static const int lowRecoveryThreshold = 40;

  /// Strain/recovery imbalance ratio
  static const double strainRecoveryImbalance = 1.5;

  /// Weight change threshold (kg per week)
  static const double weightChangeThreshold = 2.0;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'recovery_metrics.freezed.dart';
part 'recovery_metrics.g.dart';

@freezed
class RecoveryMetrics with _$RecoveryMetrics {
  const factory RecoveryMetrics({
    required String id,
    required String dailyLogId,
    required DateTime date,
    required DateTime fetchedAt,
    double? sleepDuration, // in hours
    int? sleepQuality, // 1-100 if available
    int? hrv, // Heart Rate Variability in ms
    int? restingHR, // Resting Heart Rate in bpm
    int? steps,
    int? activeEnergy, // in kcal
    int? workoutsCount,
    required DataSource dataSource,
  }) = _RecoveryMetrics;

  factory RecoveryMetrics.fromJson(Map<String, dynamic> json) =>
      _$RecoveryMetricsFromJson(json);
}

@freezed
class DailyBrief with _$DailyBrief {
  const factory DailyBrief({
    required String id,
    required DateTime date,
    required DateTime generatedAt,
    required int recoveryScore, // 0-100
    required int readinessScore, // 0-100
    @Default([]) List<String> topActions, // max 3
    @Default([]) List<String> warnings, // max 2
    required int suggestedIntensity, // 1-5
    required String coachingText,
    @Default(true) bool isAiGenerated,
    String? dailyLogId,
  }) = _DailyBrief;

  factory DailyBrief.fromJson(Map<String, dynamic> json) =>
      _$DailyBriefFromJson(json);
}

@freezed
class WeeklyReport with _$WeeklyReport {
  const factory WeeklyReport({
    required String id,
    required DateTime weekStartDate,
    required DateTime generatedAt,
    required String summary,
    @Default([]) List<String> highlights,
    @Default([]) List<String> concerns,
    required String progressAnalysis,
    required String nextWeekFocus,
    @Default(true) bool isAiGenerated,
  }) = _WeeklyReport;

  factory WeeklyReport.fromJson(Map<String, dynamic> json) =>
      _$WeeklyReportFromJson(json);
}

@JsonEnum()
enum DataSource {
  @JsonValue('healthkit')
  healthkit,
  @JsonValue('manual')
  manual,
}

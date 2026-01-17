import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_prediction.freezed.dart';
part 'health_prediction.g.dart';

/// Overall health prediction with risk factors and recommendations
@freezed
class HealthPrediction with _$HealthPrediction {
  const factory HealthPrediction({
    required String id,
    required DateTime generatedAt,
    required HealthStatus overallStatus,
    required int overallScore, // 0-100
    required int confidence, // 0-100
    required IllnessRisk illnessRisk,
    required OvertrainingRisk overtrainingRisk,
    required SleepDebtAssessment sleepDebt,
    @Default([]) List<RiskFactor> riskFactors,
    @Default([]) List<HealthRecommendation> recommendations,
    @Default([]) List<String> positiveIndicators,
    required String summary,
    required String disclaimer,
  }) = _HealthPrediction;

  factory HealthPrediction.fromJson(Map<String, dynamic> json) =>
      _$HealthPredictionFromJson(json);

  /// Creates a fallback prediction when AI is unavailable
  factory HealthPrediction.fallback() => HealthPrediction(
        id: 'fallback',
        generatedAt: DateTime.now(),
        overallStatus: HealthStatus.unknown,
        overallScore: 50,
        confidence: 0,
        illnessRisk: IllnessRisk.fallback(),
        overtrainingRisk: OvertrainingRisk.fallback(),
        sleepDebt: SleepDebtAssessment.fallback(),
        riskFactors: [],
        recommendations: [],
        positiveIndicators: [],
        summary: 'Unable to generate health prediction. Please ensure you have logged enough data.',
        disclaimer: 'This is for informational purposes only. Consult a healthcare provider for medical advice.',
      );
}

/// Health status enum representing overall health state
@JsonEnum()
enum HealthStatus {
  @JsonValue('excellent')
  excellent,
  @JsonValue('good')
  good,
  @JsonValue('moderate')
  moderate,
  @JsonValue('attention_needed')
  attentionNeeded,
  @JsonValue('unknown')
  unknown,
}

/// Illness risk prediction based on biometric trends
@freezed
class IllnessRisk with _$IllnessRisk {
  const factory IllnessRisk({
    required int probability, // 0-100
    required IllnessRiskLevel riskLevel,
    required int confidence, // 0-100
    @Default([]) List<ContributingFactor> contributingFactors,
    @Default([]) List<PreventiveAction> preventiveActions,
    @Default([]) List<String> symptoms,
    String? timeframe, // e.g., "next 24-48 hours"
    required String explanation,
    required bool shouldConsultDoctor,
  }) = _IllnessRisk;

  factory IllnessRisk.fromJson(Map<String, dynamic> json) =>
      _$IllnessRiskFromJson(json);

  factory IllnessRisk.fallback() => const IllnessRisk(
        probability: 0,
        riskLevel: IllnessRiskLevel.unknown,
        confidence: 0,
        contributingFactors: [],
        preventiveActions: [],
        symptoms: [],
        explanation: 'Insufficient data to assess illness risk.',
        shouldConsultDoctor: false,
      );
}

/// Illness risk level
@JsonEnum()
enum IllnessRiskLevel {
  @JsonValue('low')
  low,
  @JsonValue('moderate')
  moderate,
  @JsonValue('elevated')
  elevated,
  @JsonValue('high')
  high,
  @JsonValue('unknown')
  unknown,
}

/// Contributing factor to illness risk
@freezed
class ContributingFactor with _$ContributingFactor {
  const factory ContributingFactor({
    required String factor,
    required String observation, // What was observed
    required String normalRange, // What is considered normal
    required int impactScore, // 0-100, how much this contributes to risk
    required FactorTrend trend,
  }) = _ContributingFactor;

  factory ContributingFactor.fromJson(Map<String, dynamic> json) =>
      _$ContributingFactorFromJson(json);
}

/// Trend direction for factors
@JsonEnum()
enum FactorTrend {
  @JsonValue('improving')
  improving,
  @JsonValue('stable')
  stable,
  @JsonValue('declining')
  declining,
  @JsonValue('rapidly_declining')
  rapidlyDeclining,
}

/// Preventive action to reduce illness risk
@freezed
class PreventiveAction with _$PreventiveAction {
  const factory PreventiveAction({
    required String action,
    required String rationale,
    required ActionPriority priority,
    required ActionCategory category,
  }) = _PreventiveAction;

  factory PreventiveAction.fromJson(Map<String, dynamic> json) =>
      _$PreventiveActionFromJson(json);
}

/// Action priority level
@JsonEnum()
enum ActionPriority {
  @JsonValue('immediate')
  immediate,
  @JsonValue('high')
  high,
  @JsonValue('medium')
  medium,
  @JsonValue('low')
  low,
}

/// Action category
@JsonEnum()
enum ActionCategory {
  @JsonValue('sleep')
  sleep,
  @JsonValue('nutrition')
  nutrition,
  @JsonValue('hydration')
  hydration,
  @JsonValue('activity')
  activity,
  @JsonValue('stress')
  stress,
  @JsonValue('medical')
  medical,
}

/// Overtraining risk assessment
@freezed
class OvertrainingRisk with _$OvertrainingRisk {
  const factory OvertrainingRisk({
    required int riskScore, // 0-100
    required OvertrainingLevel riskLevel,
    required int confidence, // 0-100
    required StrainTrend strainTrend,
    required RecoveryTrend recoveryTrend,
    required double strainRecoveryBalance, // Ratio, <1 means under-recovered
    @Default([]) List<String> warningSignals,
    @Default([]) List<String> recommendations,
    required int daysToRecovery, // Estimated days needed to recover
    required String explanation,
  }) = _OvertrainingRisk;

  factory OvertrainingRisk.fromJson(Map<String, dynamic> json) =>
      _$OvertrainingRiskFromJson(json);

  factory OvertrainingRisk.fallback() => const OvertrainingRisk(
        riskScore: 0,
        riskLevel: OvertrainingLevel.unknown,
        confidence: 0,
        strainTrend: StrainTrend(
          trend: FactorTrend.stable,
          averageLast7Days: 0,
          averageLast30Days: 0,
          peakLast7Days: 0,
        ),
        recoveryTrend: RecoveryTrend(
          trend: FactorTrend.stable,
          averageLast7Days: 0,
          averageLast30Days: 0,
          lowestLast7Days: 0,
        ),
        strainRecoveryBalance: 1.0,
        warningSignals: [],
        recommendations: [],
        daysToRecovery: 0,
        explanation: 'Insufficient data to assess overtraining risk.',
      );
}

/// Overtraining risk level
@JsonEnum()
enum OvertrainingLevel {
  @JsonValue('optimal')
  optimal,
  @JsonValue('adequate')
  adequate,
  @JsonValue('elevated')
  elevated,
  @JsonValue('high')
  high,
  @JsonValue('critical')
  critical,
  @JsonValue('unknown')
  unknown,
}

/// Strain trend data
@freezed
class StrainTrend with _$StrainTrend {
  const factory StrainTrend({
    required FactorTrend trend,
    required double averageLast7Days,
    required double averageLast30Days,
    required double peakLast7Days,
  }) = _StrainTrend;

  factory StrainTrend.fromJson(Map<String, dynamic> json) =>
      _$StrainTrendFromJson(json);
}

/// Recovery trend data
@freezed
class RecoveryTrend with _$RecoveryTrend {
  const factory RecoveryTrend({
    required FactorTrend trend,
    required double averageLast7Days,
    required double averageLast30Days,
    required double lowestLast7Days,
  }) = _RecoveryTrend;

  factory RecoveryTrend.fromJson(Map<String, dynamic> json) =>
      _$RecoveryTrendFromJson(json);
}

/// Sleep debt assessment
@freezed
class SleepDebtAssessment with _$SleepDebtAssessment {
  const factory SleepDebtAssessment({
    required double accumulatedDebtHours, // Total sleep debt in hours
    required double averageSleepLast7Days,
    required double targetSleepHours,
    required double deficitPerNight,
    required SleepDebtLevel level,
    required int daysToRecover, // Days of good sleep needed
    @Default([]) List<String> impacts, // How sleep debt is affecting health
    @Default([]) List<String> recommendations,
    required String explanation,
  }) = _SleepDebtAssessment;

  factory SleepDebtAssessment.fromJson(Map<String, dynamic> json) =>
      _$SleepDebtAssessmentFromJson(json);

  factory SleepDebtAssessment.fallback() => const SleepDebtAssessment(
        accumulatedDebtHours: 0,
        averageSleepLast7Days: 0,
        targetSleepHours: 8,
        deficitPerNight: 0,
        level: SleepDebtLevel.unknown,
        daysToRecover: 0,
        impacts: [],
        recommendations: [],
        explanation: 'Insufficient sleep data to assess sleep debt.',
      );
}

/// Sleep debt level
@JsonEnum()
enum SleepDebtLevel {
  @JsonValue('none')
  none,
  @JsonValue('mild')
  mild,
  @JsonValue('moderate')
  moderate,
  @JsonValue('severe')
  severe,
  @JsonValue('critical')
  critical,
  @JsonValue('unknown')
  unknown,
}

/// General risk factor
@freezed
class RiskFactor with _$RiskFactor {
  const factory RiskFactor({
    required String name,
    required String description,
    required int severity, // 0-100
    required RiskCategory category,
    required bool isActionable,
    String? suggestedAction,
  }) = _RiskFactor;

  factory RiskFactor.fromJson(Map<String, dynamic> json) =>
      _$RiskFactorFromJson(json);
}

/// Risk category
@JsonEnum()
enum RiskCategory {
  @JsonValue('biometric')
  biometric,
  @JsonValue('behavioral')
  behavioral,
  @JsonValue('environmental')
  environmental,
  @JsonValue('trend')
  trend,
}

/// Health recommendation
@freezed
class HealthRecommendation with _$HealthRecommendation {
  const factory HealthRecommendation({
    required String title,
    required String description,
    required ActionCategory category,
    required ActionPriority priority,
    required String rationale,
    String? duration, // e.g., "for the next 3 days"
    @Default(false) bool requiresProfessional,
  }) = _HealthRecommendation;

  factory HealthRecommendation.fromJson(Map<String, dynamic> json) =>
      _$HealthRecommendationFromJson(json);
}

/// Behavior correlation analysis
@freezed
class BehaviorCorrelation with _$BehaviorCorrelation {
  const factory BehaviorCorrelation({
    required String behavior, // The behavior being analyzed
    required BehaviorImpact impactOnRecovery, // Positive, negative, neutral
    required double correlationStrength, // -1.0 to 1.0
    required int confidence, // 0-100
    required int occurrences, // How many times this behavior was tracked
    required double averageRecoveryWith, // Average recovery score when behavior present
    required double averageRecoveryWithout, // Average recovery score when behavior absent
    required String explanation,
    @Default([]) List<String> insights,
  }) = _BehaviorCorrelation;

  factory BehaviorCorrelation.fromJson(Map<String, dynamic> json) =>
      _$BehaviorCorrelationFromJson(json);
}

/// Behavior impact direction
@JsonEnum()
enum BehaviorImpact {
  @JsonValue('strongly_positive')
  stronglyPositive,
  @JsonValue('positive')
  positive,
  @JsonValue('neutral')
  neutral,
  @JsonValue('negative')
  negative,
  @JsonValue('strongly_negative')
  stronglyNegative,
}

/// Health context for prediction input
@freezed
class HealthContext with _$HealthContext {
  const factory HealthContext({
    required String userId,
    required DateTime date,
    // HRV data
    int? currentHrv,
    int? baselineHrv,
    @Default([]) List<int> hrvLast7Days,
    // Heart rate data
    int? currentRhr,
    int? baselineRhr,
    @Default([]) List<int> rhrLast7Days,
    // Sleep data
    double? lastNightSleep,
    int? sleepQuality,
    @Default([]) List<double> sleepLast7Days,
    @Default([]) List<int> sleepQualityLast7Days,
    // Respiratory data
    double? respiratoryRate,
    @Default([]) List<double> respiratoryRateLast7Days,
    // SpO2 data
    double? spo2,
    @Default([]) List<double> spo2Last7Days,
    // Strain and recovery
    double? strainScore, // 0-21
    int? recoveryScore, // 0-100
    @Default([]) List<double> strainLast7Days,
    @Default([]) List<int> recoveryLast7Days,
    // Symptoms and behaviors
    @Default([]) List<String> currentSymptoms,
    @Default([]) List<String> recentBehaviors,
    // Additional context
    int? moodEnergy, // 1-5
    int? stressLevel, // 1-5
  }) = _HealthContext;

  factory HealthContext.fromJson(Map<String, dynamic> json) =>
      _$HealthContextFromJson(json);
}

/// Strain and recovery history for overtraining analysis
@freezed
class StrainRecoveryHistory with _$StrainRecoveryHistory {
  const factory StrainRecoveryHistory({
    required String userId,
    @Default([]) List<DailyStrainRecovery> dailyData,
    @Default([]) List<WorkoutSummary> workouts,
  }) = _StrainRecoveryHistory;

  factory StrainRecoveryHistory.fromJson(Map<String, dynamic> json) =>
      _$StrainRecoveryHistoryFromJson(json);
}

/// Daily strain and recovery data point
@freezed
class DailyStrainRecovery with _$DailyStrainRecovery {
  const factory DailyStrainRecovery({
    required DateTime date,
    required double strainScore, // 0-21
    required int recoveryScore, // 0-100
    int? hrv,
    int? rhr,
    double? sleepHours,
  }) = _DailyStrainRecovery;

  factory DailyStrainRecovery.fromJson(Map<String, dynamic> json) =>
      _$DailyStrainRecoveryFromJson(json);
}

/// Workout summary for history
@freezed
class WorkoutSummary with _$WorkoutSummary {
  const factory WorkoutSummary({
    required DateTime date,
    required String type,
    required int durationMinutes,
    required int intensity, // 1-10
    double? strainContribution,
  }) = _WorkoutSummary;

  factory WorkoutSummary.fromJson(Map<String, dynamic> json) =>
      _$WorkoutSummaryFromJson(json);
}

/// Journal behavior history for correlation analysis
@freezed
class JournalHistory with _$JournalHistory {
  const factory JournalHistory({
    required String userId,
    @Default([]) List<DailyJournalEntry> entries,
    @Default([]) List<String> allTrackedBehaviors,
  }) = _JournalHistory;

  factory JournalHistory.fromJson(Map<String, dynamic> json) =>
      _$JournalHistoryFromJson(json);
}

/// Daily journal entry
@freezed
class DailyJournalEntry with _$DailyJournalEntry {
  const factory DailyJournalEntry({
    required DateTime date,
    required int recoveryScore, // 0-100
    @Default([]) List<String> behaviors, // Behaviors logged that day
    int? moodEnergy,
    int? stress,
    double? sleepHours,
    int? sleepQuality,
  }) = _DailyJournalEntry;

  factory DailyJournalEntry.fromJson(Map<String, dynamic> json) =>
      _$DailyJournalEntryFromJson(json);
}

/// Proactive health insight
@freezed
class ProactiveInsight with _$ProactiveInsight {
  const factory ProactiveInsight({
    required String id,
    required DateTime generatedAt,
    required InsightType type,
    required String title,
    required String message,
    required ActionPriority priority,
    required int confidence, // 0-100
    String? actionableAdvice,
    String? relatedMetric,
    double? metricChange,
    required bool isUrgent,
  }) = _ProactiveInsight;

  factory ProactiveInsight.fromJson(Map<String, dynamic> json) =>
      _$ProactiveInsightFromJson(json);
}

/// Insight type
@JsonEnum()
enum InsightType {
  @JsonValue('trend_alert')
  trendAlert,
  @JsonValue('pattern_detected')
  patternDetected,
  @JsonValue('milestone')
  milestone,
  @JsonValue('recommendation')
  recommendation,
  @JsonValue('warning')
  warning,
  @JsonValue('celebration')
  celebration,
}

/// Health Q&A response
@freezed
class HealthQAResponse with _$HealthQAResponse {
  const factory HealthQAResponse({
    required String question,
    required String answer,
    required int confidence, // 0-100
    @Default([]) List<String> relatedTopics,
    @Default([]) List<String> disclaimers,
    @Default(false) bool suggestsConsultingDoctor,
    String? followUpQuestion,
  }) = _HealthQAResponse;

  factory HealthQAResponse.fromJson(Map<String, dynamic> json) =>
      _$HealthQAResponseFromJson(json);

  factory HealthQAResponse.fallback(String question) => HealthQAResponse(
        question: question,
        answer: 'I apologize, but I am unable to answer this question at the moment. Please try again later.',
        confidence: 0,
        relatedTopics: [],
        disclaimers: [
          'This AI assistant provides informational content only.',
          'Always consult a healthcare professional for medical advice.',
        ],
        suggestsConsultingDoctor: false,
      );
}

/// Recovery factors analysis result
@freezed
class RecoveryFactorsAnalysis with _$RecoveryFactorsAnalysis {
  const factory RecoveryFactorsAnalysis({
    required String userId,
    required DateTime analyzedAt,
    required int dataPointsAnalyzed,
    @Default([]) List<BehaviorCorrelation> helpfulBehaviors,
    @Default([]) List<BehaviorCorrelation> harmfulBehaviors,
    @Default([]) List<BehaviorCorrelation> neutralBehaviors,
    @Default([]) List<String> keyInsights,
    required String personalizedAdvice,
    required int confidence, // 0-100
  }) = _RecoveryFactorsAnalysis;

  factory RecoveryFactorsAnalysis.fromJson(Map<String, dynamic> json) =>
      _$RecoveryFactorsAnalysisFromJson(json);

  factory RecoveryFactorsAnalysis.fallback() => RecoveryFactorsAnalysis(
        userId: '',
        analyzedAt: DateTime.now(),
        dataPointsAnalyzed: 0,
        helpfulBehaviors: [],
        harmfulBehaviors: [],
        neutralBehaviors: [],
        keyInsights: [],
        personalizedAdvice: 'Log more behaviors to receive personalized recovery insights.',
        confidence: 0,
      );
}

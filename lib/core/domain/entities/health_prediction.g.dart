// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_prediction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HealthPredictionImpl _$$HealthPredictionImplFromJson(
  Map<String, dynamic> json,
) => _$HealthPredictionImpl(
  id: json['id'] as String,
  generatedAt: DateTime.parse(json['generatedAt'] as String),
  overallStatus: $enumDecode(_$HealthStatusEnumMap, json['overallStatus']),
  overallScore: (json['overallScore'] as num).toInt(),
  confidence: (json['confidence'] as num).toInt(),
  illnessRisk: IllnessRisk.fromJson(
    json['illnessRisk'] as Map<String, dynamic>,
  ),
  overtrainingRisk: OvertrainingRisk.fromJson(
    json['overtrainingRisk'] as Map<String, dynamic>,
  ),
  sleepDebt: SleepDebtAssessment.fromJson(
    json['sleepDebt'] as Map<String, dynamic>,
  ),
  riskFactors:
      (json['riskFactors'] as List<dynamic>?)
          ?.map((e) => RiskFactor.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  recommendations:
      (json['recommendations'] as List<dynamic>?)
          ?.map((e) => HealthRecommendation.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  positiveIndicators:
      (json['positiveIndicators'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  summary: json['summary'] as String,
  disclaimer: json['disclaimer'] as String,
);

Map<String, dynamic> _$$HealthPredictionImplToJson(
  _$HealthPredictionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'generatedAt': instance.generatedAt.toIso8601String(),
  'overallStatus': _$HealthStatusEnumMap[instance.overallStatus]!,
  'overallScore': instance.overallScore,
  'confidence': instance.confidence,
  'illnessRisk': instance.illnessRisk,
  'overtrainingRisk': instance.overtrainingRisk,
  'sleepDebt': instance.sleepDebt,
  'riskFactors': instance.riskFactors,
  'recommendations': instance.recommendations,
  'positiveIndicators': instance.positiveIndicators,
  'summary': instance.summary,
  'disclaimer': instance.disclaimer,
};

const _$HealthStatusEnumMap = {
  HealthStatus.excellent: 'excellent',
  HealthStatus.good: 'good',
  HealthStatus.moderate: 'moderate',
  HealthStatus.attentionNeeded: 'attention_needed',
  HealthStatus.unknown: 'unknown',
};

_$IllnessRiskImpl _$$IllnessRiskImplFromJson(
  Map<String, dynamic> json,
) => _$IllnessRiskImpl(
  probability: (json['probability'] as num).toInt(),
  riskLevel: $enumDecode(_$IllnessRiskLevelEnumMap, json['riskLevel']),
  confidence: (json['confidence'] as num).toInt(),
  contributingFactors:
      (json['contributingFactors'] as List<dynamic>?)
          ?.map((e) => ContributingFactor.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  preventiveActions:
      (json['preventiveActions'] as List<dynamic>?)
          ?.map((e) => PreventiveAction.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  symptoms:
      (json['symptoms'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  timeframe: json['timeframe'] as String?,
  explanation: json['explanation'] as String,
  shouldConsultDoctor: json['shouldConsultDoctor'] as bool,
);

Map<String, dynamic> _$$IllnessRiskImplToJson(_$IllnessRiskImpl instance) =>
    <String, dynamic>{
      'probability': instance.probability,
      'riskLevel': _$IllnessRiskLevelEnumMap[instance.riskLevel]!,
      'confidence': instance.confidence,
      'contributingFactors': instance.contributingFactors,
      'preventiveActions': instance.preventiveActions,
      'symptoms': instance.symptoms,
      'timeframe': instance.timeframe,
      'explanation': instance.explanation,
      'shouldConsultDoctor': instance.shouldConsultDoctor,
    };

const _$IllnessRiskLevelEnumMap = {
  IllnessRiskLevel.low: 'low',
  IllnessRiskLevel.moderate: 'moderate',
  IllnessRiskLevel.elevated: 'elevated',
  IllnessRiskLevel.high: 'high',
  IllnessRiskLevel.unknown: 'unknown',
};

_$ContributingFactorImpl _$$ContributingFactorImplFromJson(
  Map<String, dynamic> json,
) => _$ContributingFactorImpl(
  factor: json['factor'] as String,
  observation: json['observation'] as String,
  normalRange: json['normalRange'] as String,
  impactScore: (json['impactScore'] as num).toInt(),
  trend: $enumDecode(_$FactorTrendEnumMap, json['trend']),
);

Map<String, dynamic> _$$ContributingFactorImplToJson(
  _$ContributingFactorImpl instance,
) => <String, dynamic>{
  'factor': instance.factor,
  'observation': instance.observation,
  'normalRange': instance.normalRange,
  'impactScore': instance.impactScore,
  'trend': _$FactorTrendEnumMap[instance.trend]!,
};

const _$FactorTrendEnumMap = {
  FactorTrend.improving: 'improving',
  FactorTrend.stable: 'stable',
  FactorTrend.declining: 'declining',
  FactorTrend.rapidlyDeclining: 'rapidly_declining',
};

_$PreventiveActionImpl _$$PreventiveActionImplFromJson(
  Map<String, dynamic> json,
) => _$PreventiveActionImpl(
  action: json['action'] as String,
  rationale: json['rationale'] as String,
  priority: $enumDecode(_$ActionPriorityEnumMap, json['priority']),
  category: $enumDecode(_$ActionCategoryEnumMap, json['category']),
);

Map<String, dynamic> _$$PreventiveActionImplToJson(
  _$PreventiveActionImpl instance,
) => <String, dynamic>{
  'action': instance.action,
  'rationale': instance.rationale,
  'priority': _$ActionPriorityEnumMap[instance.priority]!,
  'category': _$ActionCategoryEnumMap[instance.category]!,
};

const _$ActionPriorityEnumMap = {
  ActionPriority.immediate: 'immediate',
  ActionPriority.high: 'high',
  ActionPriority.medium: 'medium',
  ActionPriority.low: 'low',
};

const _$ActionCategoryEnumMap = {
  ActionCategory.sleep: 'sleep',
  ActionCategory.nutrition: 'nutrition',
  ActionCategory.hydration: 'hydration',
  ActionCategory.activity: 'activity',
  ActionCategory.stress: 'stress',
  ActionCategory.medical: 'medical',
};

_$OvertrainingRiskImpl _$$OvertrainingRiskImplFromJson(
  Map<String, dynamic> json,
) => _$OvertrainingRiskImpl(
  riskScore: (json['riskScore'] as num).toInt(),
  riskLevel: $enumDecode(_$OvertrainingLevelEnumMap, json['riskLevel']),
  confidence: (json['confidence'] as num).toInt(),
  strainTrend: StrainTrend.fromJson(
    json['strainTrend'] as Map<String, dynamic>,
  ),
  recoveryTrend: RecoveryTrend.fromJson(
    json['recoveryTrend'] as Map<String, dynamic>,
  ),
  strainRecoveryBalance: (json['strainRecoveryBalance'] as num).toDouble(),
  warningSignals:
      (json['warningSignals'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  recommendations:
      (json['recommendations'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  daysToRecovery: (json['daysToRecovery'] as num).toInt(),
  explanation: json['explanation'] as String,
);

Map<String, dynamic> _$$OvertrainingRiskImplToJson(
  _$OvertrainingRiskImpl instance,
) => <String, dynamic>{
  'riskScore': instance.riskScore,
  'riskLevel': _$OvertrainingLevelEnumMap[instance.riskLevel]!,
  'confidence': instance.confidence,
  'strainTrend': instance.strainTrend,
  'recoveryTrend': instance.recoveryTrend,
  'strainRecoveryBalance': instance.strainRecoveryBalance,
  'warningSignals': instance.warningSignals,
  'recommendations': instance.recommendations,
  'daysToRecovery': instance.daysToRecovery,
  'explanation': instance.explanation,
};

const _$OvertrainingLevelEnumMap = {
  OvertrainingLevel.optimal: 'optimal',
  OvertrainingLevel.adequate: 'adequate',
  OvertrainingLevel.elevated: 'elevated',
  OvertrainingLevel.high: 'high',
  OvertrainingLevel.critical: 'critical',
  OvertrainingLevel.unknown: 'unknown',
};

_$StrainTrendImpl _$$StrainTrendImplFromJson(Map<String, dynamic> json) =>
    _$StrainTrendImpl(
      trend: $enumDecode(_$FactorTrendEnumMap, json['trend']),
      averageLast7Days: (json['averageLast7Days'] as num).toDouble(),
      averageLast30Days: (json['averageLast30Days'] as num).toDouble(),
      peakLast7Days: (json['peakLast7Days'] as num).toDouble(),
    );

Map<String, dynamic> _$$StrainTrendImplToJson(_$StrainTrendImpl instance) =>
    <String, dynamic>{
      'trend': _$FactorTrendEnumMap[instance.trend]!,
      'averageLast7Days': instance.averageLast7Days,
      'averageLast30Days': instance.averageLast30Days,
      'peakLast7Days': instance.peakLast7Days,
    };

_$RecoveryTrendImpl _$$RecoveryTrendImplFromJson(Map<String, dynamic> json) =>
    _$RecoveryTrendImpl(
      trend: $enumDecode(_$FactorTrendEnumMap, json['trend']),
      averageLast7Days: (json['averageLast7Days'] as num).toDouble(),
      averageLast30Days: (json['averageLast30Days'] as num).toDouble(),
      lowestLast7Days: (json['lowestLast7Days'] as num).toDouble(),
    );

Map<String, dynamic> _$$RecoveryTrendImplToJson(_$RecoveryTrendImpl instance) =>
    <String, dynamic>{
      'trend': _$FactorTrendEnumMap[instance.trend]!,
      'averageLast7Days': instance.averageLast7Days,
      'averageLast30Days': instance.averageLast30Days,
      'lowestLast7Days': instance.lowestLast7Days,
    };

_$SleepDebtAssessmentImpl _$$SleepDebtAssessmentImplFromJson(
  Map<String, dynamic> json,
) => _$SleepDebtAssessmentImpl(
  accumulatedDebtHours: (json['accumulatedDebtHours'] as num).toDouble(),
  averageSleepLast7Days: (json['averageSleepLast7Days'] as num).toDouble(),
  targetSleepHours: (json['targetSleepHours'] as num).toDouble(),
  deficitPerNight: (json['deficitPerNight'] as num).toDouble(),
  level: $enumDecode(_$SleepDebtLevelEnumMap, json['level']),
  daysToRecover: (json['daysToRecover'] as num).toInt(),
  impacts:
      (json['impacts'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  recommendations:
      (json['recommendations'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  explanation: json['explanation'] as String,
);

Map<String, dynamic> _$$SleepDebtAssessmentImplToJson(
  _$SleepDebtAssessmentImpl instance,
) => <String, dynamic>{
  'accumulatedDebtHours': instance.accumulatedDebtHours,
  'averageSleepLast7Days': instance.averageSleepLast7Days,
  'targetSleepHours': instance.targetSleepHours,
  'deficitPerNight': instance.deficitPerNight,
  'level': _$SleepDebtLevelEnumMap[instance.level]!,
  'daysToRecover': instance.daysToRecover,
  'impacts': instance.impacts,
  'recommendations': instance.recommendations,
  'explanation': instance.explanation,
};

const _$SleepDebtLevelEnumMap = {
  SleepDebtLevel.none: 'none',
  SleepDebtLevel.mild: 'mild',
  SleepDebtLevel.moderate: 'moderate',
  SleepDebtLevel.severe: 'severe',
  SleepDebtLevel.critical: 'critical',
  SleepDebtLevel.unknown: 'unknown',
};

_$RiskFactorImpl _$$RiskFactorImplFromJson(Map<String, dynamic> json) =>
    _$RiskFactorImpl(
      name: json['name'] as String,
      description: json['description'] as String,
      severity: (json['severity'] as num).toInt(),
      category: $enumDecode(_$RiskCategoryEnumMap, json['category']),
      isActionable: json['isActionable'] as bool,
      suggestedAction: json['suggestedAction'] as String?,
    );

Map<String, dynamic> _$$RiskFactorImplToJson(_$RiskFactorImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'severity': instance.severity,
      'category': _$RiskCategoryEnumMap[instance.category]!,
      'isActionable': instance.isActionable,
      'suggestedAction': instance.suggestedAction,
    };

const _$RiskCategoryEnumMap = {
  RiskCategory.biometric: 'biometric',
  RiskCategory.behavioral: 'behavioral',
  RiskCategory.environmental: 'environmental',
  RiskCategory.trend: 'trend',
};

_$HealthRecommendationImpl _$$HealthRecommendationImplFromJson(
  Map<String, dynamic> json,
) => _$HealthRecommendationImpl(
  title: json['title'] as String,
  description: json['description'] as String,
  category: $enumDecode(_$ActionCategoryEnumMap, json['category']),
  priority: $enumDecode(_$ActionPriorityEnumMap, json['priority']),
  rationale: json['rationale'] as String,
  duration: json['duration'] as String?,
  requiresProfessional: json['requiresProfessional'] as bool? ?? false,
);

Map<String, dynamic> _$$HealthRecommendationImplToJson(
  _$HealthRecommendationImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'category': _$ActionCategoryEnumMap[instance.category]!,
  'priority': _$ActionPriorityEnumMap[instance.priority]!,
  'rationale': instance.rationale,
  'duration': instance.duration,
  'requiresProfessional': instance.requiresProfessional,
};

_$BehaviorCorrelationImpl _$$BehaviorCorrelationImplFromJson(
  Map<String, dynamic> json,
) => _$BehaviorCorrelationImpl(
  behavior: json['behavior'] as String,
  impactOnRecovery: $enumDecode(
    _$BehaviorImpactEnumMap,
    json['impactOnRecovery'],
  ),
  correlationStrength: (json['correlationStrength'] as num).toDouble(),
  confidence: (json['confidence'] as num).toInt(),
  occurrences: (json['occurrences'] as num).toInt(),
  averageRecoveryWith: (json['averageRecoveryWith'] as num).toDouble(),
  averageRecoveryWithout: (json['averageRecoveryWithout'] as num).toDouble(),
  explanation: json['explanation'] as String,
  insights:
      (json['insights'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$$BehaviorCorrelationImplToJson(
  _$BehaviorCorrelationImpl instance,
) => <String, dynamic>{
  'behavior': instance.behavior,
  'impactOnRecovery': _$BehaviorImpactEnumMap[instance.impactOnRecovery]!,
  'correlationStrength': instance.correlationStrength,
  'confidence': instance.confidence,
  'occurrences': instance.occurrences,
  'averageRecoveryWith': instance.averageRecoveryWith,
  'averageRecoveryWithout': instance.averageRecoveryWithout,
  'explanation': instance.explanation,
  'insights': instance.insights,
};

const _$BehaviorImpactEnumMap = {
  BehaviorImpact.stronglyPositive: 'strongly_positive',
  BehaviorImpact.positive: 'positive',
  BehaviorImpact.neutral: 'neutral',
  BehaviorImpact.negative: 'negative',
  BehaviorImpact.stronglyNegative: 'strongly_negative',
};

_$HealthContextImpl _$$HealthContextImplFromJson(Map<String, dynamic> json) =>
    _$HealthContextImpl(
      userId: json['userId'] as String,
      date: DateTime.parse(json['date'] as String),
      currentHrv: (json['currentHrv'] as num?)?.toInt(),
      baselineHrv: (json['baselineHrv'] as num?)?.toInt(),
      hrvLast7Days:
          (json['hrvLast7Days'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      currentRhr: (json['currentRhr'] as num?)?.toInt(),
      baselineRhr: (json['baselineRhr'] as num?)?.toInt(),
      rhrLast7Days:
          (json['rhrLast7Days'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      lastNightSleep: (json['lastNightSleep'] as num?)?.toDouble(),
      sleepQuality: (json['sleepQuality'] as num?)?.toInt(),
      sleepLast7Days:
          (json['sleepLast7Days'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          const [],
      sleepQualityLast7Days:
          (json['sleepQualityLast7Days'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      respiratoryRate: (json['respiratoryRate'] as num?)?.toDouble(),
      respiratoryRateLast7Days:
          (json['respiratoryRateLast7Days'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          const [],
      spo2: (json['spo2'] as num?)?.toDouble(),
      spo2Last7Days:
          (json['spo2Last7Days'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          const [],
      strainScore: (json['strainScore'] as num?)?.toDouble(),
      recoveryScore: (json['recoveryScore'] as num?)?.toInt(),
      strainLast7Days:
          (json['strainLast7Days'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          const [],
      recoveryLast7Days:
          (json['recoveryLast7Days'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      currentSymptoms:
          (json['currentSymptoms'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      recentBehaviors:
          (json['recentBehaviors'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      moodEnergy: (json['moodEnergy'] as num?)?.toInt(),
      stressLevel: (json['stressLevel'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$HealthContextImplToJson(_$HealthContextImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'date': instance.date.toIso8601String(),
      'currentHrv': instance.currentHrv,
      'baselineHrv': instance.baselineHrv,
      'hrvLast7Days': instance.hrvLast7Days,
      'currentRhr': instance.currentRhr,
      'baselineRhr': instance.baselineRhr,
      'rhrLast7Days': instance.rhrLast7Days,
      'lastNightSleep': instance.lastNightSleep,
      'sleepQuality': instance.sleepQuality,
      'sleepLast7Days': instance.sleepLast7Days,
      'sleepQualityLast7Days': instance.sleepQualityLast7Days,
      'respiratoryRate': instance.respiratoryRate,
      'respiratoryRateLast7Days': instance.respiratoryRateLast7Days,
      'spo2': instance.spo2,
      'spo2Last7Days': instance.spo2Last7Days,
      'strainScore': instance.strainScore,
      'recoveryScore': instance.recoveryScore,
      'strainLast7Days': instance.strainLast7Days,
      'recoveryLast7Days': instance.recoveryLast7Days,
      'currentSymptoms': instance.currentSymptoms,
      'recentBehaviors': instance.recentBehaviors,
      'moodEnergy': instance.moodEnergy,
      'stressLevel': instance.stressLevel,
    };

_$StrainRecoveryHistoryImpl _$$StrainRecoveryHistoryImplFromJson(
  Map<String, dynamic> json,
) => _$StrainRecoveryHistoryImpl(
  userId: json['userId'] as String,
  dailyData:
      (json['dailyData'] as List<dynamic>?)
          ?.map((e) => DailyStrainRecovery.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  workouts:
      (json['workouts'] as List<dynamic>?)
          ?.map((e) => WorkoutSummary.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$StrainRecoveryHistoryImplToJson(
  _$StrainRecoveryHistoryImpl instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'dailyData': instance.dailyData,
  'workouts': instance.workouts,
};

_$DailyStrainRecoveryImpl _$$DailyStrainRecoveryImplFromJson(
  Map<String, dynamic> json,
) => _$DailyStrainRecoveryImpl(
  date: DateTime.parse(json['date'] as String),
  strainScore: (json['strainScore'] as num).toDouble(),
  recoveryScore: (json['recoveryScore'] as num).toInt(),
  hrv: (json['hrv'] as num?)?.toInt(),
  rhr: (json['rhr'] as num?)?.toInt(),
  sleepHours: (json['sleepHours'] as num?)?.toDouble(),
);

Map<String, dynamic> _$$DailyStrainRecoveryImplToJson(
  _$DailyStrainRecoveryImpl instance,
) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'strainScore': instance.strainScore,
  'recoveryScore': instance.recoveryScore,
  'hrv': instance.hrv,
  'rhr': instance.rhr,
  'sleepHours': instance.sleepHours,
};

_$WorkoutSummaryImpl _$$WorkoutSummaryImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutSummaryImpl(
      date: DateTime.parse(json['date'] as String),
      type: json['type'] as String,
      durationMinutes: (json['durationMinutes'] as num).toInt(),
      intensity: (json['intensity'] as num).toInt(),
      strainContribution: (json['strainContribution'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$WorkoutSummaryImplToJson(
  _$WorkoutSummaryImpl instance,
) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'type': instance.type,
  'durationMinutes': instance.durationMinutes,
  'intensity': instance.intensity,
  'strainContribution': instance.strainContribution,
};

_$JournalHistoryImpl _$$JournalHistoryImplFromJson(Map<String, dynamic> json) =>
    _$JournalHistoryImpl(
      userId: json['userId'] as String,
      entries:
          (json['entries'] as List<dynamic>?)
              ?.map(
                (e) => DailyJournalEntry.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      allTrackedBehaviors:
          (json['allTrackedBehaviors'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$JournalHistoryImplToJson(
  _$JournalHistoryImpl instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'entries': instance.entries,
  'allTrackedBehaviors': instance.allTrackedBehaviors,
};

_$DailyJournalEntryImpl _$$DailyJournalEntryImplFromJson(
  Map<String, dynamic> json,
) => _$DailyJournalEntryImpl(
  date: DateTime.parse(json['date'] as String),
  recoveryScore: (json['recoveryScore'] as num).toInt(),
  behaviors:
      (json['behaviors'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  moodEnergy: (json['moodEnergy'] as num?)?.toInt(),
  stress: (json['stress'] as num?)?.toInt(),
  sleepHours: (json['sleepHours'] as num?)?.toDouble(),
  sleepQuality: (json['sleepQuality'] as num?)?.toInt(),
);

Map<String, dynamic> _$$DailyJournalEntryImplToJson(
  _$DailyJournalEntryImpl instance,
) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'recoveryScore': instance.recoveryScore,
  'behaviors': instance.behaviors,
  'moodEnergy': instance.moodEnergy,
  'stress': instance.stress,
  'sleepHours': instance.sleepHours,
  'sleepQuality': instance.sleepQuality,
};

_$ProactiveInsightImpl _$$ProactiveInsightImplFromJson(
  Map<String, dynamic> json,
) => _$ProactiveInsightImpl(
  id: json['id'] as String,
  generatedAt: DateTime.parse(json['generatedAt'] as String),
  type: $enumDecode(_$InsightTypeEnumMap, json['type']),
  title: json['title'] as String,
  message: json['message'] as String,
  priority: $enumDecode(_$ActionPriorityEnumMap, json['priority']),
  confidence: (json['confidence'] as num).toInt(),
  actionableAdvice: json['actionableAdvice'] as String?,
  relatedMetric: json['relatedMetric'] as String?,
  metricChange: (json['metricChange'] as num?)?.toDouble(),
  isUrgent: json['isUrgent'] as bool,
);

Map<String, dynamic> _$$ProactiveInsightImplToJson(
  _$ProactiveInsightImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'generatedAt': instance.generatedAt.toIso8601String(),
  'type': _$InsightTypeEnumMap[instance.type]!,
  'title': instance.title,
  'message': instance.message,
  'priority': _$ActionPriorityEnumMap[instance.priority]!,
  'confidence': instance.confidence,
  'actionableAdvice': instance.actionableAdvice,
  'relatedMetric': instance.relatedMetric,
  'metricChange': instance.metricChange,
  'isUrgent': instance.isUrgent,
};

const _$InsightTypeEnumMap = {
  InsightType.trendAlert: 'trend_alert',
  InsightType.patternDetected: 'pattern_detected',
  InsightType.milestone: 'milestone',
  InsightType.recommendation: 'recommendation',
  InsightType.warning: 'warning',
  InsightType.celebration: 'celebration',
};

_$HealthQAResponseImpl _$$HealthQAResponseImplFromJson(
  Map<String, dynamic> json,
) => _$HealthQAResponseImpl(
  question: json['question'] as String,
  answer: json['answer'] as String,
  confidence: (json['confidence'] as num).toInt(),
  relatedTopics:
      (json['relatedTopics'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  disclaimers:
      (json['disclaimers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  suggestsConsultingDoctor: json['suggestsConsultingDoctor'] as bool? ?? false,
  followUpQuestion: json['followUpQuestion'] as String?,
);

Map<String, dynamic> _$$HealthQAResponseImplToJson(
  _$HealthQAResponseImpl instance,
) => <String, dynamic>{
  'question': instance.question,
  'answer': instance.answer,
  'confidence': instance.confidence,
  'relatedTopics': instance.relatedTopics,
  'disclaimers': instance.disclaimers,
  'suggestsConsultingDoctor': instance.suggestsConsultingDoctor,
  'followUpQuestion': instance.followUpQuestion,
};

_$RecoveryFactorsAnalysisImpl _$$RecoveryFactorsAnalysisImplFromJson(
  Map<String, dynamic> json,
) => _$RecoveryFactorsAnalysisImpl(
  userId: json['userId'] as String,
  analyzedAt: DateTime.parse(json['analyzedAt'] as String),
  dataPointsAnalyzed: (json['dataPointsAnalyzed'] as num).toInt(),
  helpfulBehaviors:
      (json['helpfulBehaviors'] as List<dynamic>?)
          ?.map((e) => BehaviorCorrelation.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  harmfulBehaviors:
      (json['harmfulBehaviors'] as List<dynamic>?)
          ?.map((e) => BehaviorCorrelation.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  neutralBehaviors:
      (json['neutralBehaviors'] as List<dynamic>?)
          ?.map((e) => BehaviorCorrelation.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  keyInsights:
      (json['keyInsights'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  personalizedAdvice: json['personalizedAdvice'] as String,
  confidence: (json['confidence'] as num).toInt(),
);

Map<String, dynamic> _$$RecoveryFactorsAnalysisImplToJson(
  _$RecoveryFactorsAnalysisImpl instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'analyzedAt': instance.analyzedAt.toIso8601String(),
  'dataPointsAnalyzed': instance.dataPointsAnalyzed,
  'helpfulBehaviors': instance.helpfulBehaviors,
  'harmfulBehaviors': instance.harmfulBehaviors,
  'neutralBehaviors': instance.neutralBehaviors,
  'keyInsights': instance.keyInsights,
  'personalizedAdvice': instance.personalizedAdvice,
  'confidence': instance.confidence,
};

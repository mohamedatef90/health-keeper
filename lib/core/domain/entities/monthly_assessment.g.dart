// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_assessment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MonthlyAssessmentImpl _$$MonthlyAssessmentImplFromJson(
  Map<String, dynamic> json,
) => _$MonthlyAssessmentImpl(
  id: json['id'] as String,
  monthStart: DateTime.parse(json['monthStart'] as String),
  generatedAt: DateTime.parse(json['generatedAt'] as String),
  averages: MonthlyAverages.fromJson(json['averages'] as Map<String, dynamic>),
  comparison: json['comparison'] == null
      ? null
      : MonthlyComparison.fromJson(json['comparison'] as Map<String, dynamic>),
  recoveryTrend: TrendAnalysis.fromJson(
    json['recoveryTrend'] as Map<String, dynamic>,
  ),
  strainTrend: TrendAnalysis.fromJson(
    json['strainTrend'] as Map<String, dynamic>,
  ),
  sleepTrend: TrendAnalysis.fromJson(
    json['sleepTrend'] as Map<String, dynamic>,
  ),
  positiveCorrelations:
      (json['positiveCorrelations'] as List<dynamic>?)
          ?.map(
            (e) =>
                MonthlyBehaviorCorrelation.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  negativeCorrelations:
      (json['negativeCorrelations'] as List<dynamic>?)
          ?.map(
            (e) =>
                MonthlyBehaviorCorrelation.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  weeklyBreakdowns:
      (json['weeklyBreakdowns'] as List<dynamic>?)
          ?.map((e) => WeeklyBreakdown.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  insights:
      (json['insights'] as List<dynamic>?)
          ?.map((e) => MonthlyInsight.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  aiSummary: json['aiSummary'] as String?,
  aiSummaryAr: json['aiSummaryAr'] as String?,
  bestDay: json['bestDay'] == null
      ? null
      : DateTime.parse(json['bestDay'] as String),
  bestDayRecovery: (json['bestDayRecovery'] as num?)?.toInt(),
  worstDay: json['worstDay'] == null
      ? null
      : DateTime.parse(json['worstDay'] as String),
  worstDayRecovery: (json['worstDayRecovery'] as num?)?.toInt(),
  workoutDays: (json['workoutDays'] as num).toInt(),
  restDays: (json['restDays'] as num).toInt(),
  streakData: json['streakData'] == null
      ? null
      : MonthlyStreakData.fromJson(json['streakData'] as Map<String, dynamic>),
  isAiGenerated: json['isAiGenerated'] as bool? ?? false,
  dataCompleteness: (json['dataCompleteness'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$$MonthlyAssessmentImplToJson(
  _$MonthlyAssessmentImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'monthStart': instance.monthStart.toIso8601String(),
  'generatedAt': instance.generatedAt.toIso8601String(),
  'averages': instance.averages,
  'comparison': instance.comparison,
  'recoveryTrend': instance.recoveryTrend,
  'strainTrend': instance.strainTrend,
  'sleepTrend': instance.sleepTrend,
  'positiveCorrelations': instance.positiveCorrelations,
  'negativeCorrelations': instance.negativeCorrelations,
  'weeklyBreakdowns': instance.weeklyBreakdowns,
  'insights': instance.insights,
  'aiSummary': instance.aiSummary,
  'aiSummaryAr': instance.aiSummaryAr,
  'bestDay': instance.bestDay?.toIso8601String(),
  'bestDayRecovery': instance.bestDayRecovery,
  'worstDay': instance.worstDay?.toIso8601String(),
  'worstDayRecovery': instance.worstDayRecovery,
  'workoutDays': instance.workoutDays,
  'restDays': instance.restDays,
  'streakData': instance.streakData,
  'isAiGenerated': instance.isAiGenerated,
  'dataCompleteness': instance.dataCompleteness,
};

_$MonthlyAveragesImpl _$$MonthlyAveragesImplFromJson(
  Map<String, dynamic> json,
) => _$MonthlyAveragesImpl(
  avgRecovery: (json['avgRecovery'] as num).toDouble(),
  avgStrain: (json['avgStrain'] as num).toDouble(),
  avgSleep: (json['avgSleep'] as num).toDouble(),
  avgHrv: (json['avgHrv'] as num?)?.toDouble(),
  avgRhr: (json['avgRhr'] as num?)?.toDouble(),
  avgCalories: (json['avgCalories'] as num?)?.toInt(),
  avgProtein: (json['avgProtein'] as num?)?.toInt(),
  avgSteps: (json['avgSteps'] as num?)?.toInt(),
);

Map<String, dynamic> _$$MonthlyAveragesImplToJson(
  _$MonthlyAveragesImpl instance,
) => <String, dynamic>{
  'avgRecovery': instance.avgRecovery,
  'avgStrain': instance.avgStrain,
  'avgSleep': instance.avgSleep,
  'avgHrv': instance.avgHrv,
  'avgRhr': instance.avgRhr,
  'avgCalories': instance.avgCalories,
  'avgProtein': instance.avgProtein,
  'avgSteps': instance.avgSteps,
};

_$MonthlyComparisonImpl _$$MonthlyComparisonImplFromJson(
  Map<String, dynamic> json,
) => _$MonthlyComparisonImpl(
  recoveryChange: (json['recoveryChange'] as num).toDouble(),
  strainChange: (json['strainChange'] as num).toDouble(),
  sleepChange: (json['sleepChange'] as num).toDouble(),
  hrvChange: (json['hrvChange'] as num?)?.toDouble(),
  rhrChange: (json['rhrChange'] as num?)?.toDouble(),
  workoutDaysChange: (json['workoutDaysChange'] as num?)?.toInt(),
);

Map<String, dynamic> _$$MonthlyComparisonImplToJson(
  _$MonthlyComparisonImpl instance,
) => <String, dynamic>{
  'recoveryChange': instance.recoveryChange,
  'strainChange': instance.strainChange,
  'sleepChange': instance.sleepChange,
  'hrvChange': instance.hrvChange,
  'rhrChange': instance.rhrChange,
  'workoutDaysChange': instance.workoutDaysChange,
};

_$TrendAnalysisImpl _$$TrendAnalysisImplFromJson(Map<String, dynamic> json) =>
    _$TrendAnalysisImpl(
      direction: $enumDecode(_$TrendDirectionEnumMap, json['direction']),
      changePercent: (json['changePercent'] as num).toDouble(),
      weeklyValues:
          (json['weeklyValues'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          const [],
      isSignificant: json['isSignificant'] as bool? ?? false,
    );

Map<String, dynamic> _$$TrendAnalysisImplToJson(_$TrendAnalysisImpl instance) =>
    <String, dynamic>{
      'direction': _$TrendDirectionEnumMap[instance.direction]!,
      'changePercent': instance.changePercent,
      'weeklyValues': instance.weeklyValues,
      'isSignificant': instance.isSignificant,
    };

const _$TrendDirectionEnumMap = {
  TrendDirection.improving: 'improving',
  TrendDirection.stable: 'stable',
  TrendDirection.declining: 'declining',
};

_$MonthlyBehaviorCorrelationImpl _$$MonthlyBehaviorCorrelationImplFromJson(
  Map<String, dynamic> json,
) => _$MonthlyBehaviorCorrelationImpl(
  behaviorId: json['behaviorId'] as String,
  behaviorName: json['behaviorName'] as String,
  behaviorNameAr: json['behaviorNameAr'] as String,
  category: json['category'] as String,
  correlation: (json['correlation'] as num).toDouble(),
  avgImpact: (json['avgImpact'] as num).toDouble(),
  occurrences: (json['occurrences'] as num).toInt(),
  isSignificant: json['isSignificant'] as bool? ?? false,
  confidence: (json['confidence'] as num?)?.toInt() ?? 70,
);

Map<String, dynamic> _$$MonthlyBehaviorCorrelationImplToJson(
  _$MonthlyBehaviorCorrelationImpl instance,
) => <String, dynamic>{
  'behaviorId': instance.behaviorId,
  'behaviorName': instance.behaviorName,
  'behaviorNameAr': instance.behaviorNameAr,
  'category': instance.category,
  'correlation': instance.correlation,
  'avgImpact': instance.avgImpact,
  'occurrences': instance.occurrences,
  'isSignificant': instance.isSignificant,
  'confidence': instance.confidence,
};

_$WeeklyBreakdownImpl _$$WeeklyBreakdownImplFromJson(
  Map<String, dynamic> json,
) => _$WeeklyBreakdownImpl(
  weekStart: DateTime.parse(json['weekStart'] as String),
  weekNumber: (json['weekNumber'] as num).toInt(),
  avgRecovery: (json['avgRecovery'] as num).toDouble(),
  avgStrain: (json['avgStrain'] as num).toDouble(),
  avgSleep: (json['avgSleep'] as num).toDouble(),
  workoutDays: (json['workoutDays'] as num).toInt(),
  restDays: (json['restDays'] as num).toInt(),
);

Map<String, dynamic> _$$WeeklyBreakdownImplToJson(
  _$WeeklyBreakdownImpl instance,
) => <String, dynamic>{
  'weekStart': instance.weekStart.toIso8601String(),
  'weekNumber': instance.weekNumber,
  'avgRecovery': instance.avgRecovery,
  'avgStrain': instance.avgStrain,
  'avgSleep': instance.avgSleep,
  'workoutDays': instance.workoutDays,
  'restDays': instance.restDays,
};

_$MonthlyInsightImpl _$$MonthlyInsightImplFromJson(Map<String, dynamic> json) =>
    _$MonthlyInsightImpl(
      id: json['id'] as String,
      type: $enumDecode(_$MonthlyInsightTypeEnumMap, json['type']),
      title: json['title'] as String,
      titleAr: json['titleAr'] as String,
      message: json['message'] as String,
      messageAr: json['messageAr'] as String,
      priority: (json['priority'] as num?)?.toInt() ?? 3,
      isActionable: json['isActionable'] as bool? ?? false,
      actionSuggestion: json['actionSuggestion'] as String?,
      actionSuggestionAr: json['actionSuggestionAr'] as String?,
    );

Map<String, dynamic> _$$MonthlyInsightImplToJson(
  _$MonthlyInsightImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': _$MonthlyInsightTypeEnumMap[instance.type]!,
  'title': instance.title,
  'titleAr': instance.titleAr,
  'message': instance.message,
  'messageAr': instance.messageAr,
  'priority': instance.priority,
  'isActionable': instance.isActionable,
  'actionSuggestion': instance.actionSuggestion,
  'actionSuggestionAr': instance.actionSuggestionAr,
};

const _$MonthlyInsightTypeEnumMap = {
  MonthlyInsightType.achievement: 'achievement',
  MonthlyInsightType.improvement: 'improvement',
  MonthlyInsightType.concern: 'concern',
  MonthlyInsightType.pattern: 'pattern',
  MonthlyInsightType.recommendation: 'recommendation',
};

_$MonthlyStreakDataImpl _$$MonthlyStreakDataImplFromJson(
  Map<String, dynamic> json,
) => _$MonthlyStreakDataImpl(
  longestRecoveryStreak: (json['longestRecoveryStreak'] as num).toInt(),
  longestWorkoutStreak: (json['longestWorkoutStreak'] as num).toInt(),
  longestMealStreak: (json['longestMealStreak'] as num).toInt(),
  completeLogDays: (json['completeLogDays'] as num).toInt(),
);

Map<String, dynamic> _$$MonthlyStreakDataImplToJson(
  _$MonthlyStreakDataImpl instance,
) => <String, dynamic>{
  'longestRecoveryStreak': instance.longestRecoveryStreak,
  'longestWorkoutStreak': instance.longestWorkoutStreak,
  'longestMealStreak': instance.longestMealStreak,
  'completeLogDays': instance.completeLogDays,
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'healthspan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HealthspanImpl _$$HealthspanImplFromJson(
  Map<String, dynamic> json,
) => _$HealthspanImpl(
  id: json['id'] as String,
  calculatedAt: DateTime.parse(json['calculatedAt'] as String),
  chronologicalAge: (json['chronologicalAge'] as num).toInt(),
  biologicalAge: (json['biologicalAge'] as num).toInt(),
  ageDifference: (json['ageDifference'] as num).toInt(),
  factors: HealthspanFactors.fromJson(json['factors'] as Map<String, dynamic>),
  history:
      (json['history'] as List<dynamic>?)
          ?.map(
            (e) => HealthspanHistoryPoint.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  recommendations:
      (json['recommendations'] as List<dynamic>?)
          ?.map(
            (e) => HealthspanRecommendation.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  aiInsight: json['aiInsight'] as String?,
  aiInsightAr: json['aiInsightAr'] as String?,
  confidence: (json['confidence'] as num?)?.toInt() ?? 70,
  dataCompleteness: (json['dataCompleteness'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$$HealthspanImplToJson(_$HealthspanImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'calculatedAt': instance.calculatedAt.toIso8601String(),
      'chronologicalAge': instance.chronologicalAge,
      'biologicalAge': instance.biologicalAge,
      'ageDifference': instance.ageDifference,
      'factors': instance.factors,
      'history': instance.history,
      'recommendations': instance.recommendations,
      'aiInsight': instance.aiInsight,
      'aiInsightAr': instance.aiInsightAr,
      'confidence': instance.confidence,
      'dataCompleteness': instance.dataCompleteness,
    };

_$HealthspanFactorsImpl _$$HealthspanFactorsImplFromJson(
  Map<String, dynamic> json,
) => _$HealthspanFactorsImpl(
  hrvAdjustment: (json['hrvAdjustment'] as num).toInt(),
  rhrAdjustment: (json['rhrAdjustment'] as num).toInt(),
  sleepAdjustment: (json['sleepAdjustment'] as num).toInt(),
  activityAdjustment: (json['activityAdjustment'] as num).toInt(),
  recoveryAdjustment: (json['recoveryAdjustment'] as num).toInt(),
  avgHrv: (json['avgHrv'] as num?)?.toDouble(),
  avgRhr: (json['avgRhr'] as num?)?.toDouble(),
  avgSleepHours: (json['avgSleepHours'] as num?)?.toDouble(),
  avgStrain: (json['avgStrain'] as num?)?.toDouble(),
  avgRecovery: (json['avgRecovery'] as num?)?.toDouble(),
);

Map<String, dynamic> _$$HealthspanFactorsImplToJson(
  _$HealthspanFactorsImpl instance,
) => <String, dynamic>{
  'hrvAdjustment': instance.hrvAdjustment,
  'rhrAdjustment': instance.rhrAdjustment,
  'sleepAdjustment': instance.sleepAdjustment,
  'activityAdjustment': instance.activityAdjustment,
  'recoveryAdjustment': instance.recoveryAdjustment,
  'avgHrv': instance.avgHrv,
  'avgRhr': instance.avgRhr,
  'avgSleepHours': instance.avgSleepHours,
  'avgStrain': instance.avgStrain,
  'avgRecovery': instance.avgRecovery,
};

_$HealthspanRecommendationImpl _$$HealthspanRecommendationImplFromJson(
  Map<String, dynamic> json,
) => _$HealthspanRecommendationImpl(
  area: $enumDecode(_$HealthspanAreaEnumMap, json['area']),
  title: json['title'] as String,
  titleAr: json['titleAr'] as String,
  description: json['description'] as String,
  descriptionAr: json['descriptionAr'] as String,
  potentialImpact: (json['potentialImpact'] as num).toInt(),
  priority: (json['priority'] as num?)?.toInt() ?? 2,
);

Map<String, dynamic> _$$HealthspanRecommendationImplToJson(
  _$HealthspanRecommendationImpl instance,
) => <String, dynamic>{
  'area': _$HealthspanAreaEnumMap[instance.area]!,
  'title': instance.title,
  'titleAr': instance.titleAr,
  'description': instance.description,
  'descriptionAr': instance.descriptionAr,
  'potentialImpact': instance.potentialImpact,
  'priority': instance.priority,
};

const _$HealthspanAreaEnumMap = {
  HealthspanArea.hrv: 'hrv',
  HealthspanArea.rhr: 'rhr',
  HealthspanArea.sleep: 'sleep',
  HealthspanArea.activity: 'activity',
  HealthspanArea.recovery: 'recovery',
};

_$HealthspanHistoryPointImpl _$$HealthspanHistoryPointImplFromJson(
  Map<String, dynamic> json,
) => _$HealthspanHistoryPointImpl(
  calculatedAt: DateTime.parse(json['calculatedAt'] as String),
  biologicalAge: (json['biologicalAge'] as num).toInt(),
  ageDifference: (json['ageDifference'] as num).toInt(),
);

Map<String, dynamic> _$$HealthspanHistoryPointImplToJson(
  _$HealthspanHistoryPointImpl instance,
) => <String, dynamic>{
  'calculatedAt': instance.calculatedAt.toIso8601String(),
  'biologicalAge': instance.biologicalAge,
  'ageDifference': instance.ageDifference,
};

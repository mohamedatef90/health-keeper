// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_recommendation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActivityRecommendationImpl _$$ActivityRecommendationImplFromJson(
  Map<String, dynamic> json,
) => _$ActivityRecommendationImpl(
  id: json['id'] as String,
  generatedAt: DateTime.parse(json['generatedAt'] as String),
  recommendationType: $enumDecode(
    _$RecommendationTypeEnumMap,
    json['recommendationType'],
  ),
  primaryRecommendation: json['primaryRecommendation'] as String,
  alternativeActivities:
      (json['alternativeActivities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  reasoning: json['reasoning'] as String,
  targetStrainRange: StrainRange.fromJson(
    json['targetStrainRange'] as Map<String, dynamic>,
  ),
  suggestedDuration: (json['suggestedDuration'] as num).toInt(),
  suggestedIntensity: (json['suggestedIntensity'] as num).toInt(),
  warnings:
      (json['warnings'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  recoveryScore: (json['recoveryScore'] as num).toDouble(),
  previousDayStrain: (json['previousDayStrain'] as num?)?.toDouble(),
  isAiGenerated: json['isAiGenerated'] as bool? ?? true,
  confidence: (json['confidence'] as num?)?.toInt() ?? 70,
  suggestedActivities:
      (json['suggestedActivities'] as List<dynamic>?)
          ?.map((e) => SuggestedActivity.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  recoveryProtocols:
      (json['recoveryProtocols'] as List<dynamic>?)
          ?.map((e) => RecoveryProtocol.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$ActivityRecommendationImplToJson(
  _$ActivityRecommendationImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'generatedAt': instance.generatedAt.toIso8601String(),
  'recommendationType':
      _$RecommendationTypeEnumMap[instance.recommendationType]!,
  'primaryRecommendation': instance.primaryRecommendation,
  'alternativeActivities': instance.alternativeActivities,
  'reasoning': instance.reasoning,
  'targetStrainRange': instance.targetStrainRange,
  'suggestedDuration': instance.suggestedDuration,
  'suggestedIntensity': instance.suggestedIntensity,
  'warnings': instance.warnings,
  'recoveryScore': instance.recoveryScore,
  'previousDayStrain': instance.previousDayStrain,
  'isAiGenerated': instance.isAiGenerated,
  'confidence': instance.confidence,
  'suggestedActivities': instance.suggestedActivities,
  'recoveryProtocols': instance.recoveryProtocols,
};

const _$RecommendationTypeEnumMap = {
  RecommendationType.rest: 'rest',
  RecommendationType.light: 'light',
  RecommendationType.moderate: 'moderate',
  RecommendationType.intense: 'intense',
};

_$StrainRangeImpl _$$StrainRangeImplFromJson(Map<String, dynamic> json) =>
    _$StrainRangeImpl(
      min: (json['min'] as num).toDouble(),
      max: (json['max'] as num).toDouble(),
    );

Map<String, dynamic> _$$StrainRangeImplToJson(_$StrainRangeImpl instance) =>
    <String, dynamic>{'min': instance.min, 'max': instance.max};

_$SuggestedActivityImpl _$$SuggestedActivityImplFromJson(
  Map<String, dynamic> json,
) => _$SuggestedActivityImpl(
  name: json['name'] as String,
  nameAr: json['nameAr'] as String?,
  type: json['type'] as String,
  duration: (json['duration'] as num).toInt(),
  intensity: (json['intensity'] as num).toInt(),
  description: json['description'] as String?,
  equipment:
      (json['equipment'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  weatherAppropriate: json['weatherAppropriate'] as bool? ?? true,
  localContextNote: json['localContextNote'] as String?,
);

Map<String, dynamic> _$$SuggestedActivityImplToJson(
  _$SuggestedActivityImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'nameAr': instance.nameAr,
  'type': instance.type,
  'duration': instance.duration,
  'intensity': instance.intensity,
  'description': instance.description,
  'equipment': instance.equipment,
  'weatherAppropriate': instance.weatherAppropriate,
  'localContextNote': instance.localContextNote,
};

_$RecoveryProtocolImpl _$$RecoveryProtocolImplFromJson(
  Map<String, dynamic> json,
) => _$RecoveryProtocolImpl(
  name: json['name'] as String,
  nameAr: json['nameAr'] as String?,
  category: $enumDecode(_$RecoveryCategoryEnumMap, json['category']),
  timing: json['timing'] as String,
  duration: (json['duration'] as num?)?.toInt(),
  description: json['description'] as String?,
  priority:
      $enumDecodeNullable(_$RecoveryPriorityEnumMap, json['priority']) ??
      RecoveryPriority.medium,
);

Map<String, dynamic> _$$RecoveryProtocolImplToJson(
  _$RecoveryProtocolImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'nameAr': instance.nameAr,
  'category': _$RecoveryCategoryEnumMap[instance.category]!,
  'timing': instance.timing,
  'duration': instance.duration,
  'description': instance.description,
  'priority': _$RecoveryPriorityEnumMap[instance.priority]!,
};

const _$RecoveryCategoryEnumMap = {
  RecoveryCategory.sleep: 'sleep',
  RecoveryCategory.nutrition: 'nutrition',
  RecoveryCategory.hydration: 'hydration',
  RecoveryCategory.mobility: 'mobility',
  RecoveryCategory.stress: 'stress',
  RecoveryCategory.coldTherapy: 'cold_therapy',
  RecoveryCategory.heatTherapy: 'heat_therapy',
  RecoveryCategory.compression: 'compression',
};

const _$RecoveryPriorityEnumMap = {
  RecoveryPriority.low: 'low',
  RecoveryPriority.medium: 'medium',
  RecoveryPriority.high: 'high',
  RecoveryPriority.critical: 'critical',
};

_$ActivityRecommendationContextImpl
_$$ActivityRecommendationContextImplFromJson(Map<String, dynamic> json) =>
    _$ActivityRecommendationContextImpl(
      recoveryScore: (json['recoveryScore'] as num).toDouble(),
      strainScore: (json['strainScore'] as num?)?.toDouble(),
      recentWorkouts:
          (json['recentWorkouts'] as List<dynamic>?)
              ?.map(
                (e) => RecentWorkoutInfo.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      constraints:
          (json['constraints'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      weeklyPlan:
          (json['weeklyPlan'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isScheduledTrainingDay: json['isScheduledTrainingDay'] as bool? ?? false,
      scheduledWorkoutType: json['scheduledWorkoutType'] as String?,
      currentHrv: (json['currentHrv'] as num?)?.toInt(),
      baselineHrv: (json['baselineHrv'] as num?)?.toInt(),
      currentRhr: (json['currentRhr'] as num?)?.toInt(),
      baselineRhr: (json['baselineRhr'] as num?)?.toInt(),
      sleepHours: (json['sleepHours'] as num?)?.toDouble(),
      sleepQuality: (json['sleepQuality'] as num?)?.toInt(),
      moodEnergy: (json['moodEnergy'] as num?)?.toInt(),
      stressLevel: (json['stressLevel'] as num?)?.toInt(),
      isRamadan: json['isRamadan'] as bool? ?? false,
      weatherCondition: json['weatherCondition'] as String?,
      temperatureCelsius: (json['temperatureCelsius'] as num?)?.toDouble(),
      language: json['language'] as String? ?? 'ar',
    );

Map<String, dynamic> _$$ActivityRecommendationContextImplToJson(
  _$ActivityRecommendationContextImpl instance,
) => <String, dynamic>{
  'recoveryScore': instance.recoveryScore,
  'strainScore': instance.strainScore,
  'recentWorkouts': instance.recentWorkouts,
  'constraints': instance.constraints,
  'weeklyPlan': instance.weeklyPlan,
  'isScheduledTrainingDay': instance.isScheduledTrainingDay,
  'scheduledWorkoutType': instance.scheduledWorkoutType,
  'currentHrv': instance.currentHrv,
  'baselineHrv': instance.baselineHrv,
  'currentRhr': instance.currentRhr,
  'baselineRhr': instance.baselineRhr,
  'sleepHours': instance.sleepHours,
  'sleepQuality': instance.sleepQuality,
  'moodEnergy': instance.moodEnergy,
  'stressLevel': instance.stressLevel,
  'isRamadan': instance.isRamadan,
  'weatherCondition': instance.weatherCondition,
  'temperatureCelsius': instance.temperatureCelsius,
  'language': instance.language,
};

_$RecentWorkoutInfoImpl _$$RecentWorkoutInfoImplFromJson(
  Map<String, dynamic> json,
) => _$RecentWorkoutInfoImpl(
  date: DateTime.parse(json['date'] as String),
  type: json['type'] as String,
  durationMinutes: (json['durationMinutes'] as num).toInt(),
  intensity: (json['intensity'] as num?)?.toInt(),
  strainScore: (json['strainScore'] as num?)?.toDouble(),
);

Map<String, dynamic> _$$RecentWorkoutInfoImplToJson(
  _$RecentWorkoutInfoImpl instance,
) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'type': instance.type,
  'durationMinutes': instance.durationMinutes,
  'intensity': instance.intensity,
  'strainScore': instance.strainScore,
};

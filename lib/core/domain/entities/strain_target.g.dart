// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'strain_target.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StrainTargetImpl _$$StrainTargetImplFromJson(Map<String, dynamic> json) =>
    _$StrainTargetImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      calculatedAt: DateTime.parse(json['calculatedAt'] as String),
      recoveryScore: (json['recoveryScore'] as num).toInt(),
      minStrain: (json['minStrain'] as num).toDouble(),
      maxStrain: (json['maxStrain'] as num).toDouble(),
      optimalStrain: (json['optimalStrain'] as num).toDouble(),
      currentStrain: (json['currentStrain'] as num?)?.toDouble() ?? 0.0,
      targetMet: json['targetMet'] as bool? ?? false,
      suggestedIntensity: $enumDecode(
        _$StrainIntensityEnumMap,
        json['suggestedIntensity'],
      ),
      recommendation: json['recommendation'] as String,
      recommendationAr: json['recommendationAr'] as String,
      guidance: json['guidance'] as String?,
      guidanceAr: json['guidanceAr'] as String?,
    );

Map<String, dynamic> _$$StrainTargetImplToJson(
  _$StrainTargetImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'date': instance.date.toIso8601String(),
  'calculatedAt': instance.calculatedAt.toIso8601String(),
  'recoveryScore': instance.recoveryScore,
  'minStrain': instance.minStrain,
  'maxStrain': instance.maxStrain,
  'optimalStrain': instance.optimalStrain,
  'currentStrain': instance.currentStrain,
  'targetMet': instance.targetMet,
  'suggestedIntensity': _$StrainIntensityEnumMap[instance.suggestedIntensity]!,
  'recommendation': instance.recommendation,
  'recommendationAr': instance.recommendationAr,
  'guidance': instance.guidance,
  'guidanceAr': instance.guidanceAr,
};

const _$StrainIntensityEnumMap = {
  StrainIntensity.rest: 'rest',
  StrainIntensity.light: 'light',
  StrainIntensity.moderate: 'moderate',
  StrainIntensity.intense: 'intense',
  StrainIntensity.allOut: 'allOut',
};

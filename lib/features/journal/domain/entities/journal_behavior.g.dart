// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_behavior.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JournalBehaviorImpl _$$JournalBehaviorImplFromJson(
  Map<String, dynamic> json,
) => _$JournalBehaviorImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  category: $enumDecode(_$BehaviorCategoryEnumMap, json['category']),
  inputType: $enumDecode(_$BehaviorInputTypeEnumMap, json['inputType']),
  icon: json['icon'] as String?,
  unit: json['unit'] as String?,
  minValue: (json['minValue'] as num?)?.toDouble(),
  maxValue: (json['maxValue'] as num?)?.toDouble(),
  defaultValue: (json['defaultValue'] as num?)?.toDouble(),
  options:
      (json['options'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  description: json['description'] as String?,
  isCustom: json['isCustom'] as bool? ?? false,
  isActive: json['isActive'] as bool? ?? true,
  isPositiveForRecovery: json['isPositiveForRecovery'] as bool?,
);

Map<String, dynamic> _$$JournalBehaviorImplToJson(
  _$JournalBehaviorImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'category': _$BehaviorCategoryEnumMap[instance.category]!,
  'inputType': _$BehaviorInputTypeEnumMap[instance.inputType]!,
  'icon': instance.icon,
  'unit': instance.unit,
  'minValue': instance.minValue,
  'maxValue': instance.maxValue,
  'defaultValue': instance.defaultValue,
  'options': instance.options,
  'description': instance.description,
  'isCustom': instance.isCustom,
  'isActive': instance.isActive,
  'isPositiveForRecovery': instance.isPositiveForRecovery,
};

const _$BehaviorCategoryEnumMap = {
  BehaviorCategory.diet: 'diet',
  BehaviorCategory.sleep: 'sleep',
  BehaviorCategory.activity: 'activity',
  BehaviorCategory.wellness: 'wellness',
  BehaviorCategory.symptoms: 'symptoms',
  BehaviorCategory.supplements: 'supplements',
  BehaviorCategory.medications: 'medications',
  BehaviorCategory.womensHealth: 'womens_health',
  BehaviorCategory.social: 'social',
  BehaviorCategory.mental: 'mental',
};

const _$BehaviorInputTypeEnumMap = {
  BehaviorInputType.toggle: 'toggle',
  BehaviorInputType.numeric: 'numeric',
  BehaviorInputType.duration: 'duration',
  BehaviorInputType.intensity: 'intensity',
  BehaviorInputType.time: 'time',
  BehaviorInputType.options: 'options',
};

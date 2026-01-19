// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_autonomy_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserAutonomySettingsImpl _$$UserAutonomySettingsImplFromJson(
  Map<String, dynamic> json,
) => _$UserAutonomySettingsImpl(
  id: json['id'] as String,
  autoApplyLevel:
      $enumDecodeNullable(_$AutoApplyLevelEnumMap, json['autoApplyLevel']) ??
      AutoApplyLevel.moderate,
  notificationFrequency:
      $enumDecodeNullable(
        _$NotificationFrequencyEnumMap,
        json['notificationFrequency'],
      ) ??
      NotificationFrequency.normal,
  canAutoAdjustCalories: json['canAutoAdjustCalories'] as bool? ?? true,
  canAutoAdjustProtein: json['canAutoAdjustProtein'] as bool? ?? true,
  canAutoAddRestDay: json['canAutoAddRestDay'] as bool? ?? false,
  canAutoRemoveWorkout: json['canAutoRemoveWorkout'] as bool? ?? false,
  canAutoAdjustIntensity: json['canAutoAdjustIntensity'] as bool? ?? true,
  canAutoAdjustMealTiming: json['canAutoAdjustMealTiming'] as bool? ?? true,
  canAutoSendNotifications: json['canAutoSendNotifications'] as bool? ?? true,
  quietHoursEnabled: json['quietHoursEnabled'] as bool? ?? true,
  quietHoursStart: (json['quietHoursStart'] as num?)?.toInt() ?? 22,
  quietHoursEnd: (json['quietHoursEnd'] as num?)?.toInt() ?? 7,
  aiLanguage: json['aiLanguage'] as String? ?? 'ar',
  coachingTone: json['coachingTone'] as String? ?? 'supportive',
  showAiReasoning: json['showAiReasoning'] as bool? ?? false,
  enableExperimentalFeatures:
      json['enableExperimentalFeatures'] as bool? ?? false,
  minRecoveryForIntensityIncrease:
      (json['minRecoveryForIntensityIncrease'] as num?)?.toInt() ?? 60,
  maxCalorieAdjustmentPerDay:
      (json['maxCalorieAdjustmentPerDay'] as num?)?.toInt() ?? 300,
  maxProteinAdjustmentPerDay:
      (json['maxProteinAdjustmentPerDay'] as num?)?.toInt() ?? 30,
  lowRecoveryDaysBeforeRestSuggestion:
      (json['lowRecoveryDaysBeforeRestSuggestion'] as num?)?.toInt() ?? 2,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$$UserAutonomySettingsImplToJson(
  _$UserAutonomySettingsImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'autoApplyLevel': _$AutoApplyLevelEnumMap[instance.autoApplyLevel]!,
  'notificationFrequency':
      _$NotificationFrequencyEnumMap[instance.notificationFrequency]!,
  'canAutoAdjustCalories': instance.canAutoAdjustCalories,
  'canAutoAdjustProtein': instance.canAutoAdjustProtein,
  'canAutoAddRestDay': instance.canAutoAddRestDay,
  'canAutoRemoveWorkout': instance.canAutoRemoveWorkout,
  'canAutoAdjustIntensity': instance.canAutoAdjustIntensity,
  'canAutoAdjustMealTiming': instance.canAutoAdjustMealTiming,
  'canAutoSendNotifications': instance.canAutoSendNotifications,
  'quietHoursEnabled': instance.quietHoursEnabled,
  'quietHoursStart': instance.quietHoursStart,
  'quietHoursEnd': instance.quietHoursEnd,
  'aiLanguage': instance.aiLanguage,
  'coachingTone': instance.coachingTone,
  'showAiReasoning': instance.showAiReasoning,
  'enableExperimentalFeatures': instance.enableExperimentalFeatures,
  'minRecoveryForIntensityIncrease': instance.minRecoveryForIntensityIncrease,
  'maxCalorieAdjustmentPerDay': instance.maxCalorieAdjustmentPerDay,
  'maxProteinAdjustmentPerDay': instance.maxProteinAdjustmentPerDay,
  'lowRecoveryDaysBeforeRestSuggestion':
      instance.lowRecoveryDaysBeforeRestSuggestion,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};

const _$AutoApplyLevelEnumMap = {
  AutoApplyLevel.conservative: 'conservative',
  AutoApplyLevel.moderate: 'moderate',
  AutoApplyLevel.aggressive: 'aggressive',
};

const _$NotificationFrequencyEnumMap = {
  NotificationFrequency.minimal: 'minimal',
  NotificationFrequency.normal: 'normal',
  NotificationFrequency.all: 'all',
};

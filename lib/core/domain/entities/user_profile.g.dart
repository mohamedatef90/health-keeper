// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      height: (json['height'] as num?)?.toDouble(),
      age: (json['age'] as num?)?.toInt(),
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      timezone: json['timezone'] as String,
      goals: UserGoals.fromJson(json['goals'] as Map<String, dynamic>),
      aiPreferences: AiPreferences.fromJson(
        json['aiPreferences'] as Map<String, dynamic>,
      ),
      hasCompletedOnboarding: json['hasCompletedOnboarding'] as bool? ?? false,
      hasGrantedHealthKitPermission:
          json['hasGrantedHealthKitPermission'] as bool? ?? false,
      hasGrantedAiConsent: json['hasGrantedAiConsent'] as bool? ?? false,
      hasGrantedPhotoConsent: json['hasGrantedPhotoConsent'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'height': instance.height,
      'age': instance.age,
      'gender': _$GenderEnumMap[instance.gender],
      'timezone': instance.timezone,
      'goals': instance.goals,
      'aiPreferences': instance.aiPreferences,
      'hasCompletedOnboarding': instance.hasCompletedOnboarding,
      'hasGrantedHealthKitPermission': instance.hasGrantedHealthKitPermission,
      'hasGrantedAiConsent': instance.hasGrantedAiConsent,
      'hasGrantedPhotoConsent': instance.hasGrantedPhotoConsent,
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.other: 'other',
};

_$UserGoalsImpl _$$UserGoalsImplFromJson(Map<String, dynamic> json) =>
    _$UserGoalsImpl(
      targetWeight: (json['targetWeight'] as num?)?.toDouble(),
      targetWaist: (json['targetWaist'] as num?)?.toDouble(),
      targetSteps: (json['targetSteps'] as num?)?.toInt(),
      targetCalories: (json['targetCalories'] as num?)?.toInt(),
      targetProtein: (json['targetProtein'] as num?)?.toInt(),
      targetSleepHours: (json['targetSleepHours'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$UserGoalsImplToJson(_$UserGoalsImpl instance) =>
    <String, dynamic>{
      'targetWeight': instance.targetWeight,
      'targetWaist': instance.targetWaist,
      'targetSteps': instance.targetSteps,
      'targetCalories': instance.targetCalories,
      'targetProtein': instance.targetProtein,
      'targetSleepHours': instance.targetSleepHours,
    };

_$AiPreferencesImpl _$$AiPreferencesImplFromJson(Map<String, dynamic> json) =>
    _$AiPreferencesImpl(
      coachingTone:
          $enumDecodeNullable(_$CoachingToneEnumMap, json['coachingTone']) ??
          CoachingTone.supportive,
      language:
          $enumDecodeNullable(_$AppLanguageEnumMap, json['language']) ??
          AppLanguage.arabic,
      enableDailyBrief: json['enableDailyBrief'] as bool? ?? true,
      enableFoodRecognition: json['enableFoodRecognition'] as bool? ?? true,
      enableWorkoutRecommendations:
          json['enableWorkoutRecommendations'] as bool? ?? true,
    );

Map<String, dynamic> _$$AiPreferencesImplToJson(_$AiPreferencesImpl instance) =>
    <String, dynamic>{
      'coachingTone': _$CoachingToneEnumMap[instance.coachingTone]!,
      'language': _$AppLanguageEnumMap[instance.language]!,
      'enableDailyBrief': instance.enableDailyBrief,
      'enableFoodRecognition': instance.enableFoodRecognition,
      'enableWorkoutRecommendations': instance.enableWorkoutRecommendations,
    };

const _$CoachingToneEnumMap = {
  CoachingTone.supportive: 'supportive',
  CoachingTone.direct: 'direct',
  CoachingTone.motivational: 'motivational',
};

const _$AppLanguageEnumMap = {
  AppLanguage.arabic: 'arabic',
  AppLanguage.english: 'english',
};

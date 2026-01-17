import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    double? height, // in cm
    int? age,
    Gender? gender,
    required String timezone,
    required UserGoals goals,
    required AiPreferences aiPreferences,
    @Default(false) bool hasCompletedOnboarding,
    @Default(false) bool hasGrantedHealthKitPermission,
    @Default(false) bool hasGrantedAiConsent,
    @Default(false) bool hasGrantedPhotoConsent,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

@freezed
class UserGoals with _$UserGoals {
  const factory UserGoals({
    double? targetWeight, // in kg
    double? targetWaist, // in cm
    int? targetSteps,
    int? targetCalories,
    int? targetProtein, // in grams
    double? targetSleepHours,
  }) = _UserGoals;

  factory UserGoals.fromJson(Map<String, dynamic> json) =>
      _$UserGoalsFromJson(json);
}

@freezed
class AiPreferences with _$AiPreferences {
  const factory AiPreferences({
    @Default(CoachingTone.supportive) CoachingTone coachingTone,
    @Default(AppLanguage.arabic) AppLanguage language,
    @Default(true) bool enableDailyBrief,
    @Default(true) bool enableFoodRecognition,
    @Default(true) bool enableWorkoutRecommendations,
  }) = _AiPreferences;

  factory AiPreferences.fromJson(Map<String, dynamic> json) =>
      _$AiPreferencesFromJson(json);
}

@JsonEnum()
enum Gender {
  @JsonValue('male')
  male,
  @JsonValue('female')
  female,
  @JsonValue('other')
  other,
}

@JsonEnum()
enum CoachingTone {
  @JsonValue('supportive')
  supportive,
  @JsonValue('direct')
  direct,
  @JsonValue('motivational')
  motivational,
}

@JsonEnum()
enum AppLanguage {
  @JsonValue('arabic')
  arabic,
  @JsonValue('english')
  english,
}

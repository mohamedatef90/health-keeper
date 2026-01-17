import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_recommendation.freezed.dart';
part 'activity_recommendation.g.dart';

/// AI-powered activity recommendation based on recovery score
///
/// Provides intelligent suggestions for what type of activity
/// to perform based on current recovery state, strain history,
/// and user's protocol/constraints.
@freezed
class ActivityRecommendation with _$ActivityRecommendation {
  const factory ActivityRecommendation({
    required String id,
    required DateTime generatedAt,

    /// The type of recommendation: rest, light, moderate, intense
    required RecommendationType recommendationType,

    /// Primary recommendation text
    required String primaryRecommendation,

    /// Alternative activities if user wants options
    @Default([]) List<String> alternativeActivities,

    /// Reasoning behind the recommendation
    required String reasoning,

    /// Target strain range for the day (min, max)
    required StrainRange targetStrainRange,

    /// Suggested duration in minutes
    required int suggestedDuration,

    /// Suggested intensity (1-10)
    required int suggestedIntensity,

    /// Warnings or cautions
    @Default([]) List<String> warnings,

    /// Recovery score this recommendation is based on
    required double recoveryScore,

    /// Strain score from previous day
    double? previousDayStrain,

    /// Is this an AI-generated recommendation?
    @Default(true) bool isAiGenerated,

    /// AI confidence in this recommendation (0-100)
    @Default(70) int confidence,

    /// Specific exercises or activities suggested
    @Default([]) List<SuggestedActivity> suggestedActivities,

    /// Recovery protocols to follow
    @Default([]) List<RecoveryProtocol> recoveryProtocols,
  }) = _ActivityRecommendation;

  factory ActivityRecommendation.fromJson(Map<String, dynamic> json) =>
      _$ActivityRecommendationFromJson(json);
}

/// Type of activity recommendation
@JsonEnum()
enum RecommendationType {
  /// Complete rest, no physical activity
  @JsonValue('rest')
  rest,

  /// Light activity: walking, stretching, yoga
  @JsonValue('light')
  light,

  /// Moderate activity: light cardio, technique work
  @JsonValue('moderate')
  moderate,

  /// Intense activity: full training, strength work
  @JsonValue('intense')
  intense,
}

/// Extension for RecommendationType
extension RecommendationTypeExtension on RecommendationType {
  String get label {
    switch (this) {
      case RecommendationType.rest:
        return 'Rest Day';
      case RecommendationType.light:
        return 'Light Activity';
      case RecommendationType.moderate:
        return 'Moderate Activity';
      case RecommendationType.intense:
        return 'Full Training';
    }
  }

  String get labelAr {
    switch (this) {
      case RecommendationType.rest:
        return 'يوم راحة';
      case RecommendationType.light:
        return 'نشاط خفيف';
      case RecommendationType.moderate:
        return 'نشاط متوسط';
      case RecommendationType.intense:
        return 'تمرين كامل';
    }
  }

  String get description {
    switch (this) {
      case RecommendationType.rest:
        return 'Your body needs complete rest. Focus on sleep and nutrition.';
      case RecommendationType.light:
        return 'Light movement to promote recovery without adding strain.';
      case RecommendationType.moderate:
        return 'Moderate activity is appropriate. Listen to your body.';
      case RecommendationType.intense:
        return 'You\'re recovered and ready for high-intensity training.';
    }
  }

  String get descriptionAr {
    switch (this) {
      case RecommendationType.rest:
        return 'جسمك يحتاج راحة تامة. ركز على النوم والتغذية.';
      case RecommendationType.light:
        return 'حركة خفيفة لتعزيز التعافي بدون إضافة ضغط.';
      case RecommendationType.moderate:
        return 'نشاط متوسط مناسب. استمع لجسمك.';
      case RecommendationType.intense:
        return 'أنت متعافي ومستعد لتمرين عالي الشدة.';
    }
  }

  /// Get color hex for this recommendation type
  String get colorHex {
    switch (this) {
      case RecommendationType.rest:
        return '#F44336'; // Red
      case RecommendationType.light:
        return '#FF9800'; // Orange
      case RecommendationType.moderate:
        return '#FFEB3B'; // Yellow
      case RecommendationType.intense:
        return '#4CAF50'; // Green
    }
  }

  /// Get recommended strain range for this type
  StrainRange get strainRange {
    switch (this) {
      case RecommendationType.rest:
        return const StrainRange(min: 0, max: 3);
      case RecommendationType.light:
        return const StrainRange(min: 3, max: 8);
      case RecommendationType.moderate:
        return const StrainRange(min: 8, max: 14);
      case RecommendationType.intense:
        return const StrainRange(min: 14, max: 21);
    }
  }
}

/// Target strain range
@freezed
class StrainRange with _$StrainRange {
  const factory StrainRange({
    required double min,
    required double max,
  }) = _StrainRange;

  factory StrainRange.fromJson(Map<String, dynamic> json) =>
      _$StrainRangeFromJson(json);
}

/// A specific suggested activity
@freezed
class SuggestedActivity with _$SuggestedActivity {
  const factory SuggestedActivity({
    /// Activity name
    required String name,

    /// Activity name in Arabic
    String? nameAr,

    /// Activity type (walking, yoga, strength, etc.)
    required String type,

    /// Suggested duration in minutes
    required int duration,

    /// Suggested intensity (1-10)
    required int intensity,

    /// Brief description
    String? description,

    /// Equipment needed (if any)
    @Default([]) List<String> equipment,

    /// Is this suitable for the current weather/conditions
    @Default(true) bool weatherAppropriate,

    /// Notes for Egyptian context (heat, Ramadan, etc.)
    String? localContextNote,
  }) = _SuggestedActivity;

  factory SuggestedActivity.fromJson(Map<String, dynamic> json) =>
      _$SuggestedActivityFromJson(json);
}

/// Recovery protocol suggestion
@freezed
class RecoveryProtocol with _$RecoveryProtocol {
  const factory RecoveryProtocol({
    /// Protocol name
    required String name,

    /// Protocol name in Arabic
    String? nameAr,

    /// Protocol category
    required RecoveryCategory category,

    /// When to do this
    required String timing,

    /// Duration in minutes
    int? duration,

    /// Brief description
    String? description,

    /// Priority level
    @Default(RecoveryPriority.medium) RecoveryPriority priority,
  }) = _RecoveryProtocol;

  factory RecoveryProtocol.fromJson(Map<String, dynamic> json) =>
      _$RecoveryProtocolFromJson(json);
}

/// Recovery protocol category
@JsonEnum()
enum RecoveryCategory {
  @JsonValue('sleep')
  sleep,
  @JsonValue('nutrition')
  nutrition,
  @JsonValue('hydration')
  hydration,
  @JsonValue('mobility')
  mobility,
  @JsonValue('stress')
  stress,
  @JsonValue('cold_therapy')
  coldTherapy,
  @JsonValue('heat_therapy')
  heatTherapy,
  @JsonValue('compression')
  compression,
}

/// Recovery protocol priority
@JsonEnum()
enum RecoveryPriority {
  @JsonValue('low')
  low,
  @JsonValue('medium')
  medium,
  @JsonValue('high')
  high,
  @JsonValue('critical')
  critical,
}

/// Context for requesting an activity recommendation
@freezed
class ActivityRecommendationContext with _$ActivityRecommendationContext {
  const factory ActivityRecommendationContext({
    /// Current recovery score (0-100)
    required double recoveryScore,

    /// Previous day's strain score (0-21)
    double? strainScore,

    /// Recent workouts (last 7 days)
    @Default([]) List<RecentWorkoutInfo> recentWorkouts,

    /// User's protocol constraints
    @Default([]) List<String> constraints,

    /// User's weekly activity plan
    @Default([]) List<String> weeklyPlan,

    /// Is today a scheduled training day?
    @Default(false) bool isScheduledTrainingDay,

    /// Scheduled workout type (if any)
    String? scheduledWorkoutType,

    /// Current HRV
    int? currentHrv,

    /// Baseline HRV for comparison
    int? baselineHrv,

    /// Current resting heart rate
    int? currentRhr,

    /// Baseline RHR for comparison
    int? baselineRhr,

    /// Sleep hours last night
    double? sleepHours,

    /// Sleep quality (0-100)
    int? sleepQuality,

    /// Current mood/energy (1-5)
    int? moodEnergy,

    /// Current stress level (1-5)
    int? stressLevel,

    /// Is it Ramadan? (affects recommendations)
    @Default(false) bool isRamadan,

    /// Current weather conditions (for outdoor activities)
    String? weatherCondition,

    /// Temperature (affects recommendations in Egypt)
    double? temperatureCelsius,

    /// Language preference
    @Default('ar') String language,
  }) = _ActivityRecommendationContext;

  factory ActivityRecommendationContext.fromJson(Map<String, dynamic> json) =>
      _$ActivityRecommendationContextFromJson(json);
}

/// Recent workout info for context
@freezed
class RecentWorkoutInfo with _$RecentWorkoutInfo {
  const factory RecentWorkoutInfo({
    required DateTime date,
    required String type,
    required int durationMinutes,
    int? intensity,
    double? strainScore,
  }) = _RecentWorkoutInfo;

  factory RecentWorkoutInfo.fromJson(Map<String, dynamic> json) =>
      _$RecentWorkoutInfoFromJson(json);
}

/// Extension for ActivityRecommendation helpers
extension ActivityRecommendationExtension on ActivityRecommendation {
  /// Check if this recommendation includes any warnings
  bool get hasWarnings => warnings.isNotEmpty;

  /// Get the primary suggested activity (if any)
  SuggestedActivity? get primaryActivity =>
      suggestedActivities.isNotEmpty ? suggestedActivities.first : null;

  /// Check if complete rest is recommended
  bool get isRestDay => recommendationType == RecommendationType.rest;

  /// Check if high intensity is safe
  bool get canDoHighIntensity =>
      recommendationType == RecommendationType.intense;

  /// Get recommendation summary for display
  String getSummary(String language) {
    if (language == 'ar') {
      return '${recommendationType.labelAr} - $suggestedDuration دقيقة';
    }
    return '${recommendationType.label} - $suggestedDuration minutes';
  }
}

/// Default activity suggestions for each recommendation type
class DefaultActivitySuggestions {
  DefaultActivitySuggestions._();

  static const List<SuggestedActivity> restActivities = [
    SuggestedActivity(
      name: 'Complete Rest',
      nameAr: 'راحة تامة',
      type: 'rest',
      duration: 0,
      intensity: 0,
      description: 'Focus on sleep and recovery',
    ),
    SuggestedActivity(
      name: 'Gentle Stretching',
      nameAr: 'تمدد خفيف',
      type: 'stretching',
      duration: 10,
      intensity: 1,
      description: 'Light stretching only if it feels good',
    ),
    SuggestedActivity(
      name: 'Meditation',
      nameAr: 'تأمل',
      type: 'meditation',
      duration: 15,
      intensity: 1,
      description: 'Guided meditation for recovery',
    ),
  ];

  static const List<SuggestedActivity> lightActivities = [
    SuggestedActivity(
      name: 'Walking',
      nameAr: 'مشي',
      type: 'walking',
      duration: 30,
      intensity: 3,
      description: 'Easy pace walk',
      localContextNote: 'Best done early morning or after sunset in summer',
    ),
    SuggestedActivity(
      name: 'Yoga',
      nameAr: 'يوجا',
      type: 'yoga',
      duration: 30,
      intensity: 3,
      description: 'Restorative yoga session',
    ),
    SuggestedActivity(
      name: 'Swimming (Light)',
      nameAr: 'سباحة خفيفة',
      type: 'swimming',
      duration: 20,
      intensity: 3,
      description: 'Easy laps, focus on movement',
    ),
    SuggestedActivity(
      name: 'Foam Rolling',
      nameAr: 'تدليك بالرول',
      type: 'mobility',
      duration: 15,
      intensity: 2,
      description: 'Self-myofascial release',
      equipment: ['foam roller'],
    ),
  ];

  static const List<SuggestedActivity> moderateActivities = [
    SuggestedActivity(
      name: 'Light Jog',
      nameAr: 'جري خفيف',
      type: 'running',
      duration: 30,
      intensity: 5,
      description: 'Easy conversational pace',
      localContextNote: 'Avoid midday heat in summer',
    ),
    SuggestedActivity(
      name: 'Technique Work',
      nameAr: 'تمرين تقنية',
      type: 'skill',
      duration: 45,
      intensity: 5,
      description: 'Focus on form, not intensity',
    ),
    SuggestedActivity(
      name: 'Light Strength',
      nameAr: 'تقوية خفيفة',
      type: 'strength',
      duration: 40,
      intensity: 5,
      description: 'Lower weights, focus on movement',
      equipment: ['gym access'],
    ),
    SuggestedActivity(
      name: 'Cycling',
      nameAr: 'دراجة',
      type: 'cycling',
      duration: 40,
      intensity: 5,
      description: 'Zone 2 heart rate',
    ),
  ];

  static const List<SuggestedActivity> intenseActivities = [
    SuggestedActivity(
      name: 'Full Strength Training',
      nameAr: 'تمرين قوة كامل',
      type: 'strength',
      duration: 60,
      intensity: 8,
      description: 'Regular training intensity',
      equipment: ['gym access'],
    ),
    SuggestedActivity(
      name: 'HIIT Session',
      nameAr: 'تمرين متقطع عالي الشدة',
      type: 'hiit',
      duration: 30,
      intensity: 9,
      description: 'High intensity intervals',
    ),
    SuggestedActivity(
      name: 'Sport Match',
      nameAr: 'مباراة رياضية',
      type: 'sport',
      duration: 90,
      intensity: 8,
      description: 'Futsal, football, etc.',
      localContextNote: 'Stay hydrated, especially in hot weather',
    ),
    SuggestedActivity(
      name: 'Running (Tempo)',
      nameAr: 'جري سريع',
      type: 'running',
      duration: 45,
      intensity: 8,
      description: 'Tempo or interval running',
    ),
  ];

  /// Get default activities for a recommendation type
  static List<SuggestedActivity> getActivities(RecommendationType type) {
    switch (type) {
      case RecommendationType.rest:
        return restActivities;
      case RecommendationType.light:
        return lightActivities;
      case RecommendationType.moderate:
        return moderateActivities;
      case RecommendationType.intense:
        return intenseActivities;
    }
  }
}

/// Default recovery protocols
class DefaultRecoveryProtocols {
  DefaultRecoveryProtocols._();

  static const List<RecoveryProtocol> lowRecoveryProtocols = [
    RecoveryProtocol(
      name: 'Prioritize Sleep',
      nameAr: 'أولوية للنوم',
      category: RecoveryCategory.sleep,
      timing: 'Tonight',
      description: 'Aim for 8+ hours, go to bed early',
      priority: RecoveryPriority.critical,
    ),
    RecoveryProtocol(
      name: 'Extra Hydration',
      nameAr: 'ترطيب إضافي',
      category: RecoveryCategory.hydration,
      timing: 'Throughout the day',
      description: 'Drink 3+ liters of water',
      priority: RecoveryPriority.high,
    ),
    RecoveryProtocol(
      name: 'Protein Focus',
      nameAr: 'تركيز على البروتين',
      category: RecoveryCategory.nutrition,
      timing: 'Every meal',
      description: 'Ensure adequate protein intake',
      priority: RecoveryPriority.high,
    ),
    RecoveryProtocol(
      name: 'Stress Reduction',
      nameAr: 'تقليل التوتر',
      category: RecoveryCategory.stress,
      timing: 'Evening',
      duration: 15,
      description: 'Meditation or breathing exercises',
      priority: RecoveryPriority.medium,
    ),
  ];

  static const List<RecoveryProtocol> moderateRecoveryProtocols = [
    RecoveryProtocol(
      name: 'Quality Sleep',
      nameAr: 'نوم جيد',
      category: RecoveryCategory.sleep,
      timing: 'Tonight',
      description: 'Maintain regular sleep schedule',
      priority: RecoveryPriority.high,
    ),
    RecoveryProtocol(
      name: 'Stay Hydrated',
      nameAr: 'حافظ على الترطيب',
      category: RecoveryCategory.hydration,
      timing: 'Throughout the day',
      description: 'Drink 2.5+ liters of water',
      priority: RecoveryPriority.medium,
    ),
    RecoveryProtocol(
      name: 'Mobility Work',
      nameAr: 'تمارين مرونة',
      category: RecoveryCategory.mobility,
      timing: 'Morning or evening',
      duration: 15,
      description: 'Dynamic stretching or foam rolling',
      priority: RecoveryPriority.medium,
    ),
  ];

  static const List<RecoveryProtocol> highRecoveryProtocols = [
    RecoveryProtocol(
      name: 'Maintain Sleep',
      nameAr: 'حافظ على النوم',
      category: RecoveryCategory.sleep,
      timing: 'Tonight',
      description: 'Continue good sleep habits',
      priority: RecoveryPriority.medium,
    ),
    RecoveryProtocol(
      name: 'Pre-Workout Nutrition',
      nameAr: 'تغذية قبل التمرين',
      category: RecoveryCategory.nutrition,
      timing: '2 hours before workout',
      description: 'Balanced meal with carbs and protein',
      priority: RecoveryPriority.high,
    ),
    RecoveryProtocol(
      name: 'Post-Workout Protein',
      nameAr: 'بروتين بعد التمرين',
      category: RecoveryCategory.nutrition,
      timing: 'Within 1 hour of training',
      description: '20-40g protein',
      priority: RecoveryPriority.high,
    ),
  ];

  /// Get protocols based on recovery level
  static List<RecoveryProtocol> getProtocols(double recoveryScore) {
    if (recoveryScore < 40) {
      return lowRecoveryProtocols;
    } else if (recoveryScore < 70) {
      return moderateRecoveryProtocols;
    } else {
      return highRecoveryProtocols;
    }
  }
}

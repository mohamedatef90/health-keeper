import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_brain_context.freezed.dart';
part 'ai_brain_context.g.dart';

/// Unified context for AI Brain decision-making
/// Aggregates all relevant health, plan, and user data
@freezed
class AiBrainContext with _$AiBrainContext {
  const AiBrainContext._();

  const factory AiBrainContext({
    /// Context generation timestamp
    required DateTime generatedAt,

    /// User profile data
    AiBrainUserContext? userContext,

    /// Today's health metrics
    AiBrainHealthContext? healthContext,

    /// 7-day trends for key metrics
    AiBrainTrendsContext? trendsContext,

    /// Today's nutrition status
    AiBrainNutritionContext? nutritionContext,

    /// Active plans (meal + workout)
    AiBrainPlansContext? plansContext,

    /// Recent chat messages for conversation continuity
    @Default([]) List<AiBrainChatMessage> recentMessages,

    /// Active alerts and nudges
    @Default([]) List<AiBrainAlert> activeAlerts,

    /// Sync timestamps
    required AiBrainSyncStatus syncStatus,
  }) = _AiBrainContext;

  factory AiBrainContext.fromJson(Map<String, dynamic> json) =>
      _$AiBrainContextFromJson(json);

  /// Check if context is stale (older than 4 hours)
  bool get isStale =>
      DateTime.now().difference(generatedAt).inHours >= 4;

  /// Check if context has health data
  bool get hasHealthData => healthContext != null;

  /// Check if context has active plans
  bool get hasActivePlans =>
      plansContext?.mealPlan != null || plansContext?.workoutPlan != null;

  /// Get recovery state description
  String get recoveryDescription {
    final recovery = healthContext?.recoveryScore ?? 0;
    if (recovery >= 80) return 'peak';
    if (recovery >= 60) return 'good';
    if (recovery >= 40) return 'moderate';
    if (recovery >= 20) return 'low';
    return 'rest';
  }
}

/// User context for AI Brain
@freezed
class AiBrainUserContext with _$AiBrainUserContext {
  const factory AiBrainUserContext({
    required String id,
    int? age,
    double? height,
    String? gender,
    String? timezone,

    /// User goals
    double? targetWeight,
    double? targetWaist,
    int? targetSteps,
    int? targetCalories,
    int? targetProtein,
    double? targetSleepHours,

    /// AI preferences
    @Default('supportive') String coachingTone,
    @Default('ar') String language,
    @Default(true) bool enableAiCoaching,

    /// Protocol summary
    int? eatingWindowStartHour,
    int? eatingWindowStartMinute,
    int? eatingWindowEndHour,
    int? eatingWindowEndMinute,
    @Default([]) List<String> activeConstraints,
  }) = _AiBrainUserContext;

  factory AiBrainUserContext.fromJson(Map<String, dynamic> json) =>
      _$AiBrainUserContextFromJson(json);
}

/// Health context for AI Brain
@freezed
class AiBrainHealthContext with _$AiBrainHealthContext {
  const factory AiBrainHealthContext({
    /// Recovery score (0-100)
    @Default(50) int recoveryScore,
    @Default('moderate') String recoveryState,

    /// Strain score (0-21)
    @Default(0.0) double strainScore,

    /// Sleep data
    double? sleepDuration,
    int? sleepQuality,

    /// Heart rate data
    int? hrv,
    int? restingHR,
    int? hrvBaseline,
    int? rhrBaseline,

    /// Activity data
    @Default(0) int steps,
    @Default(0) int activeEnergy,

    /// Subjective data
    int? moodEnergy,
    int? stress,
    int? hunger,

    /// Current weight
    double? weight,

    /// Data freshness
    DateTime? lastHealthKitSync,
  }) = _AiBrainHealthContext;

  factory AiBrainHealthContext.fromJson(Map<String, dynamic> json) =>
      _$AiBrainHealthContextFromJson(json);
}

/// 7-day trends context for AI Brain
@freezed
class AiBrainTrendsContext with _$AiBrainTrendsContext {
  const factory AiBrainTrendsContext({
    /// Recovery scores for last 7 days
    @Default([]) List<int> recoveryScores,

    /// Strain scores for last 7 days
    @Default([]) List<double> strainScores,

    /// Sleep durations for last 7 days (hours)
    @Default([]) List<double> sleepDurations,

    /// HRV values for last 7 days
    @Default([]) List<int> hrvValues,

    /// RHR values for last 7 days
    @Default([]) List<int> rhrValues,

    /// Steps for last 7 days
    @Default([]) List<int> stepsValues,

    /// Weights for last 7 days (may have gaps)
    @Default([]) List<double?> weights,

    /// Calculated averages
    double? avgRecovery,
    double? avgStrain,
    double? avgSleep,
    double? avgHrv,
    double? avgRhr,

    /// Trend directions
    @Default('stable') String recoveryTrend,
    @Default('stable') String strainTrend,
    @Default('stable') String sleepTrend,
  }) = _AiBrainTrendsContext;

  factory AiBrainTrendsContext.fromJson(Map<String, dynamic> json) =>
      _$AiBrainTrendsContextFromJson(json);
}

/// Nutrition context for AI Brain
@freezed
class AiBrainNutritionContext with _$AiBrainNutritionContext {
  const AiBrainNutritionContext._();

  const factory AiBrainNutritionContext({
    /// Today's consumed nutrition
    @Default(0) int caloriesConsumed,
    @Default(0) int proteinConsumed,
    @Default(0) int carbsConsumed,
    @Default(0) int fatConsumed,

    /// Today's targets
    @Default(2000) int caloriesTarget,
    @Default(120) int proteinTarget,

    /// Meals logged today
    @Default(0) int mealsLoggedToday,

    /// Is within eating window?
    @Default(true) bool isInEatingWindow,

    /// Time until eating window opens/closes
    int? minutesUntilWindowChange,

    /// Last meal time
    DateTime? lastMealTime,
  }) = _AiBrainNutritionContext;

  factory AiBrainNutritionContext.fromJson(Map<String, dynamic> json) =>
      _$AiBrainNutritionContextFromJson(json);

  /// Progress towards calorie target (0.0 to 1.0+)
  double get calorieProgress =>
      caloriesTarget > 0 ? caloriesConsumed / caloriesTarget : 0;

  /// Progress towards protein target (0.0 to 1.0+)
  double get proteinProgress =>
      proteinTarget > 0 ? proteinConsumed / proteinTarget : 0;
}

/// Plans context for AI Brain
@freezed
class AiBrainPlansContext with _$AiBrainPlansContext {
  const factory AiBrainPlansContext({
    /// Active meal plan summary
    AiBrainMealPlanSummary? mealPlan,

    /// Active workout plan summary
    AiBrainWorkoutPlanSummary? workoutPlan,

    /// Pending changes awaiting approval
    @Default([]) List<AiBrainPendingChange> pendingChanges,

    /// Master plan status
    String? masterPlanStatus,
    String? masterPlanId,
  }) = _AiBrainPlansContext;

  factory AiBrainPlansContext.fromJson(Map<String, dynamic> json) =>
      _$AiBrainPlansContextFromJson(json);
}

/// Meal plan summary for context
@freezed
class AiBrainMealPlanSummary with _$AiBrainMealPlanSummary {
  const factory AiBrainMealPlanSummary({
    required String planId,
    required DateTime weekStartDate,

    /// Today's plan
    @Default(0) int todayCaloriesPlanned,
    @Default(0) int todayProteinPlanned,
    @Default([]) List<String> todayMeals,

    /// Weekly totals
    @Default(0) int weeklyCaloriesTotal,
    @Default(0) int weeklyProteinTotal,

    /// Plan status
    @Default('pending') String approvalStatus,
  }) = _AiBrainMealPlanSummary;

  factory AiBrainMealPlanSummary.fromJson(Map<String, dynamic> json) =>
      _$AiBrainMealPlanSummaryFromJson(json);
}

/// Workout plan summary for context
@freezed
class AiBrainWorkoutPlanSummary with _$AiBrainWorkoutPlanSummary {
  const factory AiBrainWorkoutPlanSummary({
    required String planId,
    required DateTime weekStartDate,

    /// Today's workout
    String? todayWorkoutType,
    int? todayWorkoutDuration,
    int? todayWorkoutIntensity,
    @Default([]) List<String> todayExercises,
    @Default(false) bool isTodayRestDay,

    /// Weekly summary
    @Default(0) int workoutDaysCount,
    @Default(0) int totalWorkoutMinutes,
    @Default(0) int estimatedCaloriesBurn,

    /// Plan status
    @Default('pending') String approvalStatus,
  }) = _AiBrainWorkoutPlanSummary;

  factory AiBrainWorkoutPlanSummary.fromJson(Map<String, dynamic> json) =>
      _$AiBrainWorkoutPlanSummaryFromJson(json);
}

/// Pending change summary for context
@freezed
class AiBrainPendingChange with _$AiBrainPendingChange {
  const factory AiBrainPendingChange({
    required String id,
    required String type,
    required String description,
    String? descriptionAr,
    required String source,
    required DateTime createdAt,
    @Default(50) int impactScore,
  }) = _AiBrainPendingChange;

  factory AiBrainPendingChange.fromJson(Map<String, dynamic> json) =>
      _$AiBrainPendingChangeFromJson(json);
}

/// Chat message summary for context
@freezed
class AiBrainChatMessage with _$AiBrainChatMessage {
  const factory AiBrainChatMessage({
    required String role,
    required String content,
    required DateTime createdAt,
    String? contextTag,
  }) = _AiBrainChatMessage;

  factory AiBrainChatMessage.fromJson(Map<String, dynamic> json) =>
      _$AiBrainChatMessageFromJson(json);
}

/// Active alert for context
@freezed
class AiBrainAlert with _$AiBrainAlert {
  const factory AiBrainAlert({
    required String id,
    required String type,
    required String title,
    required String message,
    String? titleAr,
    String? messageAr,
    required String priority,
    required DateTime createdAt,
    @Default(false) bool isDismissed,
  }) = _AiBrainAlert;

  factory AiBrainAlert.fromJson(Map<String, dynamic> json) =>
      _$AiBrainAlertFromJson(json);
}

/// Sync status for context freshness tracking
@freezed
class AiBrainSyncStatus with _$AiBrainSyncStatus {
  const factory AiBrainSyncStatus({
    DateTime? lastHealthKitSync,
    DateTime? lastMealSync,
    DateTime? lastWorkoutSync,
    DateTime? lastPlanSync,
    DateTime? lastChatSync,
  }) = _AiBrainSyncStatus;

  factory AiBrainSyncStatus.fromJson(Map<String, dynamic> json) =>
      _$AiBrainSyncStatusFromJson(json);
}

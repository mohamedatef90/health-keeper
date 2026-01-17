import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_suggestion.freezed.dart';
part 'meal_suggestion.g.dart';

/// A suggested meal based on user's nutritional goals
@freezed
class MealSuggestion with _$MealSuggestion {
  const factory MealSuggestion({
    required String id,

    /// Meal name in Arabic
    required String name,

    /// Meal name in English
    required String nameEn,

    /// Estimated calories
    required int calories,

    /// Protein in grams
    required int protein,

    /// Carbohydrates in grams
    required int carbs,

    /// Fat in grams
    required int fat,

    /// Meal category: breakfast, lunch, dinner, snack
    required String category,

    /// Serving size description
    String? servingSize,

    /// Why this meal is suggested
    String? reasoning,

    /// How well it fits user's goals (0-100)
    @Default(0) int fitScore,

    /// Tags for filtering
    @Default([]) List<String> tags,

    /// Is this a high protein meal?
    @Default(false) bool isHighProtein,

    /// Is this vegetarian?
    @Default(false) bool isVegetarian,

    /// Is this low carb?
    @Default(false) bool isLowCarb,

    /// Was this AI-generated or from database?
    @Default(false) bool isAiGenerated,

    /// AI confidence in this suggestion (0-100)
    int? confidence,
  }) = _MealSuggestion;

  factory MealSuggestion.fromJson(Map<String, dynamic> json) =>
      _$MealSuggestionFromJson(json);
}

/// A complete daily meal plan with multiple meals
@freezed
class DailyMealPlan with _$DailyMealPlan {
  const factory DailyMealPlan({
    required String id,
    required DateTime date,
    required DateTime generatedAt,

    /// Target calories for the day
    required int targetCalories,

    /// Target protein in grams
    required int targetProtein,

    /// Breakfast suggestion
    MealSuggestion? breakfast,

    /// Lunch suggestion
    MealSuggestion? lunch,

    /// Dinner suggestion
    MealSuggestion? dinner,

    /// Snacks suggestions (up to 2)
    @Default([]) List<MealSuggestion> snacks,

    /// Total planned calories
    @Default(0) int totalCalories,

    /// Total planned protein
    @Default(0) int totalProtein,

    /// Total planned carbs
    @Default(0) int totalCarbs,

    /// Total planned fat
    @Default(0) int totalFat,

    /// How well the plan matches targets (0-100)
    @Default(0) int overallFitScore,

    /// AI-generated coaching note about the plan
    String? coachingNote,

    /// Is this an AI-generated plan?
    @Default(false) bool isAiGenerated,

    /// AI confidence in this plan (0-100)
    int? confidence,

    /// Dietary restrictions considered
    @Default([]) List<String> dietaryRestrictions,
  }) = _DailyMealPlan;

  factory DailyMealPlan.fromJson(Map<String, dynamic> json) =>
      _$DailyMealPlanFromJson(json);
}

/// Extension for DailyMealPlan helpers
extension DailyMealPlanExtension on DailyMealPlan {
  /// Get all meals in the plan as a list
  List<MealSuggestion> get allMeals {
    final meals = <MealSuggestion>[];
    if (breakfast != null) meals.add(breakfast!);
    if (lunch != null) meals.add(lunch!);
    if (dinner != null) meals.add(dinner!);
    meals.addAll(snacks);
    return meals;
  }

  /// Calculate calorie deficit/surplus
  int get calorieBalance => totalCalories - targetCalories;

  /// Calculate protein deficit/surplus
  int get proteinBalance => totalProtein - targetProtein;

  /// Is this plan meeting calorie targets (within 10%)?
  bool get meetsCalorieTarget {
    final tolerance = targetCalories * 0.1;
    return calorieBalance.abs() <= tolerance;
  }

  /// Is this plan meeting protein targets (within 10%)?
  bool get meetsProteinTarget {
    final tolerance = targetProtein * 0.1;
    return proteinBalance.abs() <= tolerance;
  }
}

/// Context for requesting meal suggestions
@freezed
class MealSuggestionContext with _$MealSuggestionContext {
  const factory MealSuggestionContext({
    /// Target calories for the meal
    required int targetCalories,

    /// Target protein for the meal
    required int targetProtein,

    /// Meal type: breakfast, lunch, dinner, snack
    required String mealType,

    /// User's dietary restrictions
    @Default([]) List<String> dietaryRestrictions,

    /// Prefer Egyptian/local cuisine
    @Default(true) bool preferEgyptian,

    /// Remaining calories for the day (if any)
    int? remainingCalories,

    /// Remaining protein for the day (if any)
    int? remainingProtein,

    /// Meals already consumed today
    @Default([]) List<String> mealsConsumedToday,

    /// Time of day (for appropriate suggestions)
    String? timeOfDay,

    /// User's preference for high protein
    @Default(false) bool preferHighProtein,

    /// User's preference for vegetarian
    @Default(false) bool preferVegetarian,

    /// User's preference for low carb
    @Default(false) bool preferLowCarb,

    /// Current Ramadan mode (affects meal timing)
    @Default(false) bool isRamadan,

    /// Language preference: 'ar' or 'en'
    @Default('ar') String language,
  }) = _MealSuggestionContext;

  factory MealSuggestionContext.fromJson(Map<String, dynamic> json) =>
      _$MealSuggestionContextFromJson(json);
}

/// Context for requesting a full daily meal plan
@freezed
class DailyMealPlanContext with _$DailyMealPlanContext {
  const factory DailyMealPlanContext({
    /// Target calories for the day
    required int targetCalories,

    /// Target protein for the day
    required int targetProtein,

    /// User's dietary restrictions
    @Default([]) List<String> dietaryRestrictions,

    /// Prefer Egyptian/local cuisine
    @Default(true) bool preferEgyptian,

    /// Eating window start time (for intermittent fasting)
    String? eatingWindowStart,

    /// Eating window end time (for intermittent fasting)
    String? eatingWindowEnd,

    /// Number of meals per day
    @Default(3) int mealsPerDay,

    /// Include snacks in the plan
    @Default(true) bool includeSnacks,

    /// User's preference for high protein
    @Default(false) bool preferHighProtein,

    /// User's preference for vegetarian
    @Default(false) bool preferVegetarian,

    /// User's preference for low carb
    @Default(false) bool preferLowCarb,

    /// Recovery score (affects suggestions)
    int? recoveryScore,

    /// Workout planned today
    @Default(false) bool hasWorkoutToday,

    /// Workout type if any
    String? workoutType,

    /// Current Ramadan mode
    @Default(false) bool isRamadan,

    /// Language preference: 'ar' or 'en'
    @Default('ar') String language,
  }) = _DailyMealPlanContext;

  factory DailyMealPlanContext.fromJson(Map<String, dynamic> json) =>
      _$DailyMealPlanContextFromJson(json);
}

/// User's nutritional goals
@freezed
class UserGoals with _$UserGoals {
  const factory UserGoals({
    /// Daily calorie target
    required int dailyCalories,

    /// Daily protein target in grams
    required int dailyProtein,

    /// Target weight in kg (optional)
    double? targetWeight,

    /// Goal type: lose, maintain, gain
    @Default('maintain') String goalType,

    /// Dietary restrictions
    @Default([]) List<String> dietaryRestrictions,

    /// Food allergies
    @Default([]) List<String> allergies,

    /// Preferred cuisine types
    @Default(['egyptian']) List<String> preferredCuisines,
  }) = _UserGoals;

  factory UserGoals.fromJson(Map<String, dynamic> json) =>
      _$UserGoalsFromJson(json);
}

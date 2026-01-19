/// AI-generated workout recommendation based on diet, recovery, and health data
class AiWorkoutRecommendation {
  final String recommendedWorkout;
  final String? recommendedWorkoutId;
  final int intensity; // 1-5
  final int estimatedCaloriesBurn;
  final String reasoning;
  final List<String> warnings;
  final String? alternativeIfTired;
  final NutritionSummary nutritionSummary;
  final HealthDataSummary healthDataSummary;
  final bool isAiGenerated;
  final int? confidence;
  final DateTime generatedAt;

  const AiWorkoutRecommendation({
    required this.recommendedWorkout,
    this.recommendedWorkoutId,
    required this.intensity,
    required this.estimatedCaloriesBurn,
    required this.reasoning,
    this.warnings = const [],
    this.alternativeIfTired,
    required this.nutritionSummary,
    required this.healthDataSummary,
    this.isAiGenerated = true,
    this.confidence,
    required this.generatedAt,
  });

  factory AiWorkoutRecommendation.fromJson(
    Map<String, dynamic> json,
    NutritionSummary nutrition,
    HealthDataSummary health,
  ) {
    return AiWorkoutRecommendation(
      recommendedWorkout: json['recommendedWorkout'] as String? ?? 'Light Activity',
      recommendedWorkoutId: json['recommendedWorkoutId'] as String?,
      intensity: json['intensity'] as int? ?? 3,
      estimatedCaloriesBurn: json['estimatedCaloriesBurn'] as int? ?? 200,
      reasoning: json['reasoning'] as String? ?? 'Based on your current data.',
      warnings: (json['warnings'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      alternativeIfTired: json['alternativeIfTired'] as String?,
      nutritionSummary: nutrition,
      healthDataSummary: health,
      isAiGenerated: true,
      confidence: json['confidence'] as int?,
      generatedAt: DateTime.now(),
    );
  }

  /// Fallback recommendation when AI is unavailable
  factory AiWorkoutRecommendation.fallback({
    required NutritionSummary nutrition,
    required HealthDataSummary health,
  }) {
    String workout;
    int intensity;
    String reasoning;
    List<String> warnings = [];

    // Check if nutrition data is available
    final hasNutritionData = nutrition.isDataAvailable && nutrition.mealsLogged > 0;

    // Rule-based fallback logic
    if (health.recoveryScore != null && health.recoveryScore! < 40) {
      // Low recovery - always suggest rest regardless of nutrition
      workout = 'Rest Day / Light Stretch';
      intensity = 1;
      reasoning = 'Your recovery score is low. Focus on rest and recovery today.';
      warnings.add('Low recovery - prioritize rest');
    } else if (health.hadPoorSleep) {
      // Poor sleep - suggest light activity
      workout = 'Light Walk (20 min)';
      intensity = 2;
      reasoning = 'You didn\'t get enough sleep. Keep activity light today.';
      warnings.add('Poor sleep - avoid intense exercise');
    } else if (health.hasHighStrain) {
      // High strain already - suggest recovery
      workout = 'Active Recovery / Yoga';
      intensity = 2;
      reasoning = 'Your strain is already high. Focus on recovery activities.';
      warnings.add('High strain - avoid adding more intensity');
    } else if (!hasNutritionData) {
      // No nutrition data - use health data only
      if (health.hasGoodRecovery) {
        workout = 'Strength Training';
        intensity = 4;
        reasoning = 'Your recovery is excellent. Great day for strength training!';
      } else if (health.recoveryScore != null && health.recoveryScore! >= 50) {
        workout = 'Moderate Cardio (30 min)';
        intensity = 3;
        reasoning = 'Good recovery today. A moderate workout would be beneficial.';
      } else {
        workout = 'Light Activity (20 min)';
        intensity = 2;
        reasoning = 'Based on your recovery, keep activity moderate today.';
      }
    } else if (nutrition.caloriesConsumed < nutrition.targetCalories * 0.4) {
      // Low fuel - nutrition data available
      workout = 'Light Walk (20 min)';
      intensity = 2;
      reasoning = 'You haven\'t eaten much today. Keep activity light to preserve energy.';
      warnings.add('Low fuel - eat before intense exercise');
    } else if (nutrition.proteinConsumed >= nutrition.targetProtein * 0.7 &&
        health.recoveryScore != null &&
        health.recoveryScore! >= 60) {
      // Good protein + good recovery
      workout = 'Strength Training';
      intensity = 4;
      reasoning = 'Good protein intake and decent recovery - great for building muscle!';
    } else {
      // Default moderate activity
      workout = 'Moderate Cardio (30 min)';
      intensity = 3;
      reasoning = 'Balanced activity for today based on your current state.';
    }

    return AiWorkoutRecommendation(
      recommendedWorkout: workout,
      intensity: intensity,
      estimatedCaloriesBurn: intensity * 80,
      reasoning: reasoning,
      warnings: warnings,
      alternativeIfTired: '10-minute stretch routine',
      nutritionSummary: nutrition,
      healthDataSummary: health,
      isAiGenerated: false,
      generatedAt: DateTime.now(),
    );
  }

  /// Fallback when only health data is available (no meals logged)
  factory AiWorkoutRecommendation.healthOnlyFallback({
    required HealthDataSummary health,
  }) {
    return AiWorkoutRecommendation.fallback(
      nutrition: NutritionSummary.unavailable(),
      health: health,
    );
  }
}

/// Summary of today's nutrition intake
class NutritionSummary {
  final int caloriesConsumed;
  final int proteinConsumed;
  final int carbsConsumed;
  final int fatConsumed;
  final int targetCalories;
  final int targetProtein;
  final int mealsLogged;
  final bool isDataAvailable; // True if user has logged meals today

  const NutritionSummary({
    required this.caloriesConsumed,
    required this.proteinConsumed,
    required this.carbsConsumed,
    required this.fatConsumed,
    required this.targetCalories,
    required this.targetProtein,
    required this.mealsLogged,
    this.isDataAvailable = true,
  });

  int get calorieBalance => caloriesConsumed - targetCalories;
  int get proteinBalance => proteinConsumed - targetProtein;

  double get caloriePercentage =>
      targetCalories > 0 ? (caloriesConsumed / targetCalories * 100) : 0;
  double get proteinPercentage =>
      targetProtein > 0 ? (proteinConsumed / targetProtein * 100) : 0;

  bool get isUnderfueled => caloriePercentage < 40;
  bool get hasGoodProtein => proteinPercentage >= 70;

  factory NutritionSummary.empty() {
    return const NutritionSummary(
      caloriesConsumed: 0,
      proteinConsumed: 0,
      carbsConsumed: 0,
      fatConsumed: 0,
      targetCalories: 2000,
      targetProtein: 120,
      mealsLogged: 0,
      isDataAvailable: true,
    );
  }

  /// Factory for when no nutrition data is available (no meals logged)
  /// Workout recommendations will use health data only
  factory NutritionSummary.unavailable() {
    return const NutritionSummary(
      caloriesConsumed: 0,
      proteinConsumed: 0,
      carbsConsumed: 0,
      fatConsumed: 0,
      targetCalories: 2000,
      targetProtein: 120,
      mealsLogged: 0,
      isDataAvailable: false,
    );
  }
}

/// Summary of health data from HealthKit/Whoop
class HealthDataSummary {
  final int? recoveryScore; // 0-100
  final double? strainScore; // 0-21
  final double? sleepHours;
  final int? sleepQuality; // 0-100
  final int? hrv;
  final int? restingHR;
  final int? steps;
  final int? activeEnergy;
  final int workoutsToday;
  final int workoutsThisWeek;

  const HealthDataSummary({
    this.recoveryScore,
    this.strainScore,
    this.sleepHours,
    this.sleepQuality,
    this.hrv,
    this.restingHR,
    this.steps,
    this.activeEnergy,
    this.workoutsToday = 0,
    this.workoutsThisWeek = 0,
  });

  bool get hasLowRecovery => recoveryScore != null && recoveryScore! < 50;
  bool get hasHighStrain => strainScore != null && strainScore! > 15;
  bool get hasGoodRecovery => recoveryScore != null && recoveryScore! >= 70;
  bool get hadPoorSleep => sleepHours != null && sleepHours! < 6;

  String get recoveryStateLabel {
    if (recoveryScore == null) return 'Unknown';
    if (recoveryScore! >= 67) return 'Green';
    if (recoveryScore! >= 34) return 'Yellow';
    return 'Red';
  }

  factory HealthDataSummary.empty() {
    return const HealthDataSummary();
  }
}

/// Context for generating diet-aware workout recommendation
class DietAwareWorkoutContext {
  final NutritionSummary nutrition;
  final HealthDataSummary health;
  final List<String> constraints;
  final String language;

  const DietAwareWorkoutContext({
    required this.nutrition,
    required this.health,
    this.constraints = const [],
    this.language = 'en',
  });
}

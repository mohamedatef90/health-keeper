import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/providers.dart';
import '../../../core/providers/nutrition_totals_provider.dart';
import '../domain/entities/ai_workout_recommendation.dart';

/// Provider for AI-powered workout recommendation based on diet and health data
/// Works with or without nutrition data - uses health data as primary source
final aiWorkoutRecommendationProvider =
    FutureProvider.autoDispose<AiWorkoutRecommendation>((ref) async {
  // Get today's nutrition data (may have no meals logged)
  NutritionSummary nutritionSummary;
  try {
    nutritionSummary = await ref.watch(todayNutritionTotalsProvider.future);
    // Mark as unavailable if no meals logged
    if (nutritionSummary.mealsLogged == 0) {
      nutritionSummary = NutritionSummary.unavailable();
    }
  } catch (e) {
    // If nutrition fetch fails, use unavailable
    nutritionSummary = NutritionSummary.unavailable();
  }

  // Get today's recovery score
  final recoveryScore = await ref.watch(todayRecoveryScoreProvider.future);

  // Get today's strain score
  final strainScore = await ref.watch(todayStrainScoreProvider.future);

  // Get HealthKit data for additional context
  final healthKitService = ref.watch(healthKitServiceProvider);
  final healthData = await healthKitService.fetchRecoveryData(DateTime.now());

  // Get workouts this week
  final today = DateTime.now();
  final weekStart = today.subtract(Duration(days: today.weekday - 1));
  final workouts = await healthKitService.fetchWorkouts(weekStart, today);

  // Build health data summary
  final healthSummary = HealthDataSummary(
    recoveryScore: recoveryScore?.score,
    strainScore: strainScore?.score,
    sleepHours: healthData?.sleepDuration,
    sleepQuality: healthData?.sleepQuality,
    hrv: healthData?.hrv,
    restingHR: healthData?.restingHR,
    steps: healthData?.steps,
    activeEnergy: healthData?.activeEnergy,
    workoutsToday: healthData?.workoutsCount ?? 0,
    workoutsThisWeek: workouts.length,
  );

  // Get Gemini service for AI recommendation
  final geminiService = ref.watch(geminiCoachServiceProvider);

  try {
    // Check if we have nutrition data
    final hasNutritionData = nutritionSummary.isDataAvailable;

    if (hasNutritionData) {
      // Call Gemini for diet-aware recommendation (nutrition + health data)
      final result = await geminiService.getDietAwareWorkoutRecommendation(
        caloriesConsumed: nutritionSummary.caloriesConsumed,
        proteinConsumed: nutritionSummary.proteinConsumed,
        targetCalories: nutritionSummary.targetCalories,
        targetProtein: nutritionSummary.targetProtein,
        recoveryScore: recoveryScore?.score,
        strainScore: strainScore?.score,
        sleepHours: healthData?.sleepDuration,
        hrv: healthData?.hrv,
        restingHR: healthData?.restingHR,
        workoutsThisWeek: workouts.length,
        constraints: [], // TODO: Get from user protocol
        language: 'en', // TODO: Get from user preferences
      );

      // Combine AI result with data summaries
      return AiWorkoutRecommendation(
        recommendedWorkout: result.recommendedWorkout,
        recommendedWorkoutId: result.recommendedWorkoutId,
        intensity: result.intensity,
        estimatedCaloriesBurn: result.estimatedCaloriesBurn,
        reasoning: result.reasoning,
        warnings: result.warnings,
        alternativeIfTired: result.alternativeIfTired,
        nutritionSummary: nutritionSummary,
        healthDataSummary: healthSummary,
        isAiGenerated: result.isAiGenerated,
        confidence: result.confidence,
        generatedAt: DateTime.now(),
      );
    } else {
      // Call Gemini for health-only recommendation (no nutrition data)
      final result = await geminiService.getHealthOnlyWorkoutRecommendation(
        recoveryScore: recoveryScore?.score,
        strainScore: strainScore?.score,
        sleepHours: healthData?.sleepDuration,
        sleepQuality: healthData?.sleepQuality,
        hrv: healthData?.hrv,
        restingHR: healthData?.restingHR,
        workoutsThisWeek: workouts.length,
        constraints: [], // TODO: Get from user protocol
        language: 'en', // TODO: Get from user preferences
      );

      return AiWorkoutRecommendation(
        recommendedWorkout: result.recommendedWorkout,
        recommendedWorkoutId: result.recommendedWorkoutId,
        intensity: result.intensity,
        estimatedCaloriesBurn: result.estimatedCaloriesBurn,
        reasoning: result.reasoning,
        warnings: result.warnings,
        alternativeIfTired: result.alternativeIfTired,
        nutritionSummary: nutritionSummary, // Shows unavailable
        healthDataSummary: healthSummary,
        isAiGenerated: result.isAiGenerated,
        confidence: result.confidence,
        generatedAt: DateTime.now(),
      );
    }
  } catch (e) {
    // Fallback to rule-based recommendation
    return AiWorkoutRecommendation.fallback(
      nutrition: nutritionSummary,
      health: healthSummary,
    );
  }
});

/// Provider for health data summary (lighter weight than full recommendation)
final healthDataSummaryProvider =
    FutureProvider.autoDispose<HealthDataSummary>((ref) async {
  final recoveryScore = await ref.watch(todayRecoveryScoreProvider.future);
  final strainScore = await ref.watch(todayStrainScoreProvider.future);
  final healthKitService = ref.watch(healthKitServiceProvider);
  final healthData = await healthKitService.fetchRecoveryData(DateTime.now());

  final today = DateTime.now();
  final weekStart = today.subtract(Duration(days: today.weekday - 1));
  final workouts = await healthKitService.fetchWorkouts(weekStart, today);

  return HealthDataSummary(
    recoveryScore: recoveryScore?.score,
    strainScore: strainScore?.score,
    sleepHours: healthData?.sleepDuration,
    sleepQuality: healthData?.sleepQuality,
    hrv: healthData?.hrv,
    restingHR: healthData?.restingHR,
    steps: healthData?.steps,
    activeEnergy: healthData?.activeEnergy,
    workoutsToday: healthData?.workoutsCount ?? 0,
    workoutsThisWeek: workouts.length,
  );
});

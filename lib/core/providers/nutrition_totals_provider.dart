import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/database/database.dart';
import '../../features/coach/domain/entities/ai_workout_recommendation.dart';
import 'providers.dart';

/// Provider for today's nutrition totals aggregated from all meals
final todayNutritionTotalsProvider = FutureProvider<NutritionSummary>((ref) async {
  final database = ref.watch(databaseProvider);
  final today = DateTime.now();
  final startOfDay = DateTime(today.year, today.month, today.day);

  // Get or create today's daily log
  final dailyLog = await database.getDailyLog(startOfDay);

  if (dailyLog == null) {
    // No meals logged today
    return _getTargetsWithZeroConsumption(database);
  }

  // Get all meals for today
  final mealLogs = await database.getMealLogsForDay(dailyLog.id);

  int totalCalories = 0;
  int totalProtein = 0;
  int totalCarbs = 0;
  int totalFat = 0;

  // Aggregate nutrition from all meal items
  for (final meal in mealLogs) {
    final items = await database.getMealItems(meal.id);
    for (final item in items) {
      totalCalories += item.caloriesEstimate ?? 0;
      totalProtein += item.proteinEstimate ?? 0;
      totalCarbs += item.carbsEstimate ?? 0;
      totalFat += item.fatEstimate ?? 0;
    }
  }

  // Get user's targets from profile
  final userProfile = await database.getUserProfile();
  final targets = _parseGoals(userProfile?.goalsJson);

  return NutritionSummary(
    caloriesConsumed: totalCalories,
    proteinConsumed: totalProtein,
    carbsConsumed: totalCarbs,
    fatConsumed: totalFat,
    targetCalories: targets.calories,
    targetProtein: targets.protein,
    mealsLogged: mealLogs.length,
  );
});

/// Provider for this week's average nutrition
final weeklyNutritionAverageProvider = FutureProvider<NutritionSummary>((ref) async {
  final database = ref.watch(databaseProvider);
  final today = DateTime.now();

  int totalDays = 0;
  int totalCalories = 0;
  int totalProtein = 0;
  int totalCarbs = 0;
  int totalFat = 0;

  // Get data for last 7 days
  for (int i = 0; i < 7; i++) {
    final date = today.subtract(Duration(days: i));
    final startOfDay = DateTime(date.year, date.month, date.day);
    final dailyLog = await database.getDailyLog(startOfDay);

    if (dailyLog != null) {
      final mealLogs = await database.getMealLogsForDay(dailyLog.id);

      int dayCalories = 0;
      int dayProtein = 0;
      int dayCarbs = 0;
      int dayFat = 0;

      for (final meal in mealLogs) {
        final items = await database.getMealItems(meal.id);
        for (final item in items) {
          dayCalories += item.caloriesEstimate ?? 0;
          dayProtein += item.proteinEstimate ?? 0;
          dayCarbs += item.carbsEstimate ?? 0;
          dayFat += item.fatEstimate ?? 0;
        }
      }

      if (dayCalories > 0) {
        totalCalories += dayCalories;
        totalProtein += dayProtein;
        totalCarbs += dayCarbs;
        totalFat += dayFat;
        totalDays++;
      }
    }
  }

  final userProfile = await database.getUserProfile();
  final targets = _parseGoals(userProfile?.goalsJson);

  if (totalDays == 0) {
    return NutritionSummary(
      caloriesConsumed: 0,
      proteinConsumed: 0,
      carbsConsumed: 0,
      fatConsumed: 0,
      targetCalories: targets.calories,
      targetProtein: targets.protein,
      mealsLogged: 0,
    );
  }

  return NutritionSummary(
    caloriesConsumed: totalCalories ~/ totalDays,
    proteinConsumed: totalProtein ~/ totalDays,
    carbsConsumed: totalCarbs ~/ totalDays,
    fatConsumed: totalFat ~/ totalDays,
    targetCalories: targets.calories,
    targetProtein: targets.protein,
    mealsLogged: totalDays,
  );
});

/// Helper to get targets with zero consumption
Future<NutritionSummary> _getTargetsWithZeroConsumption(AppDatabase database) async {
  final userProfile = await database.getUserProfile();
  final targets = _parseGoals(userProfile?.goalsJson);

  return NutritionSummary(
    caloriesConsumed: 0,
    proteinConsumed: 0,
    carbsConsumed: 0,
    fatConsumed: 0,
    targetCalories: targets.calories,
    targetProtein: targets.protein,
    mealsLogged: 0,
  );
}

/// Parse user goals from JSON string
_NutritionTargets _parseGoals(String? goalsJson) {
  if (goalsJson == null || goalsJson.isEmpty) {
    return const _NutritionTargets(calories: 2000, protein: 120);
  }

  try {
    // Goals are stored as JSON with targetCalories, targetProtein, etc.
    // For now, use defaults - this would parse the actual JSON in production
    return const _NutritionTargets(calories: 2000, protein: 120);
  } catch (e) {
    return const _NutritionTargets(calories: 2000, protein: 120);
  }
}

class _NutritionTargets {
  final int calories;
  final int protein;

  const _NutritionTargets({
    required this.calories,
    required this.protein,
  });
}

import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../core/data/database/database.dart';
import '../../../core/providers/providers.dart';
import '../../../core/services/gemini_coach_service.dart';
import '../domain/entities/meal_suggestion.dart';
import '../domain/entities/weekly_meal_plan.dart';

/// Provider for generating a new weekly meal plan
final generateWeeklyMealPlanProvider = FutureProvider.autoDispose
    .family<WeeklyMealPlan, WeeklyMealPlanContext>((ref, context) async {
  final geminiService = ref.watch(geminiCoachServiceProvider);
  final db = ref.watch(databaseProvider);

  // Generate the plan from AI
  final result = await geminiService.generateWeeklyMealPlan(
    dailyCalorieTarget: context.dailyCalorieTarget,
    dailyProteinTarget: context.dailyProteinTarget,
    dietaryRestrictions: context.dietaryRestrictions,
    eatingWindowStart: context.eatingWindowStart,
    eatingWindowEnd: context.eatingWindowEnd,
    workoutDays: context.workoutDays,
    strengthDays: context.workoutPlan?.strengthDays ?? [],
    recoveryScore: context.recoveryScore,
    strainScore: context.strainScore,
    preferHighProtein: context.preferHighProtein,
    preferVegetarian: context.preferVegetarian,
    preferLowCarb: context.preferLowCarb,
    workoutDayCalorieBonus: context.workoutDayCalorieBonus,
    strengthDayProteinBonus: context.strengthDayProteinBonus,
    language: context.language,
  );

  // Convert AI result to WeeklyMealPlan entity
  final weeklyPlan = _convertToWeeklyMealPlan(
    result: result,
    context: context,
  );

  // Save to database
  await _saveWeeklyMealPlan(db, weeklyPlan);

  return weeklyPlan;
});

/// Provider for the current week's meal plan
final currentWeekMealPlanProvider =
    FutureProvider.autoDispose<WeeklyMealPlan?>((ref) async {
  final db = ref.watch(databaseProvider);
  final data = await db.getCurrentWeekMealPlan();

  if (data == null) return null;

  return _convertFromDbData(data);
});

/// Provider for a specific weekly meal plan by ID
final weeklyMealPlanByIdProvider = FutureProvider.autoDispose
    .family<WeeklyMealPlan?, String>((ref, id) async {
  final db = ref.watch(databaseProvider);
  final data = await db.getWeeklyMealPlan(id);

  if (data == null) return null;

  return _convertFromDbData(data);
});

/// Provider for recent weekly meal plans
final recentWeeklyMealPlansProvider =
    FutureProvider.autoDispose<List<WeeklyMealPlan>>((ref) async {
  final db = ref.watch(databaseProvider);
  final dataList = await db.getWeeklyMealPlans(limit: 5);

  return dataList.map((data) => _convertFromDbData(data)).toList();
});

/// State notifier for managing weekly meal plan approval
class WeeklyMealPlanNotifier extends StateNotifier<AsyncValue<WeeklyMealPlan?>> {
  final AppDatabase _db;
  bool _hasLoaded = false;

  WeeklyMealPlanNotifier(this._db) : super(const AsyncValue.data(null));

  /// Load the current plan - call this from the UI
  Future<void> loadCurrentPlan() async {
    if (_hasLoaded && state.hasValue) return; // Already loaded

    state = const AsyncValue.loading();
    try {
      final data = await _db.getCurrentWeekMealPlan();
      if (data != null) {
        state = AsyncValue.data(_convertFromDbData(data));
      } else {
        state = const AsyncValue.data(null);
      }
      _hasLoaded = true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> approvePlan(String planId) async {
    try {
      await _db.updateWeeklyMealPlanApprovalStatus(
          planId, PlanApprovalStatus.approved.value);
      await loadCurrentPlan();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> rejectPlan(String planId) async {
    try {
      await _db.updateWeeklyMealPlanApprovalStatus(
          planId, PlanApprovalStatus.rejected.value);
      await loadCurrentPlan();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refresh() async {
    _hasLoaded = false;
    state = const AsyncValue.loading();
    await loadCurrentPlan();
  }
}

final weeklyMealPlanNotifierProvider =
    StateNotifierProvider<WeeklyMealPlanNotifier, AsyncValue<WeeklyMealPlan?>>(
        (ref) {
  final db = ref.watch(databaseProvider);
  return WeeklyMealPlanNotifier(db);
});

// ============================================================================
// Helper Functions
// ============================================================================

WeeklyMealPlan _convertToWeeklyMealPlan({
  required AiWeeklyMealPlanResult result,
  required WeeklyMealPlanContext context,
}) {
  final id = const Uuid().v4();
  final now = DateTime.now();

  // Convert each day's AI result to DailyMealPlan
  DailyMealPlan? convertDay(AiDayMealPlan? aiDay, int dayIndex) {
    if (aiDay == null) return null;

    return DailyMealPlan(
      id: '${id}_day_$dayIndex',
      date: context.weekStartDate.add(Duration(days: dayIndex)),
      generatedAt: now,
      targetCalories: aiDay.targetCalories,
      targetProtein: aiDay.targetProtein,
      breakfast: aiDay.breakfast != null
          ? MealSuggestion(
              id: '${id}_breakfast_$dayIndex',
              name: aiDay.breakfast!.name,
              nameEn: aiDay.breakfast!.nameEn,
              category: 'breakfast',
              calories: aiDay.breakfast!.calories,
              protein: aiDay.breakfast!.protein,
              carbs: aiDay.breakfast!.carbs,
              fat: aiDay.breakfast!.fat,
              servingSize: aiDay.breakfast!.servingSize,
              fitScore: 80,
              tags: const [],
              isAiGenerated: true,
            )
          : null,
      lunch: aiDay.lunch != null
          ? MealSuggestion(
              id: '${id}_lunch_$dayIndex',
              name: aiDay.lunch!.name,
              nameEn: aiDay.lunch!.nameEn,
              category: 'lunch',
              calories: aiDay.lunch!.calories,
              protein: aiDay.lunch!.protein,
              carbs: aiDay.lunch!.carbs,
              fat: aiDay.lunch!.fat,
              servingSize: aiDay.lunch!.servingSize,
              fitScore: 80,
              tags: const [],
              isAiGenerated: true,
            )
          : null,
      dinner: aiDay.dinner != null
          ? MealSuggestion(
              id: '${id}_dinner_$dayIndex',
              name: aiDay.dinner!.name,
              nameEn: aiDay.dinner!.nameEn,
              category: 'dinner',
              calories: aiDay.dinner!.calories,
              protein: aiDay.dinner!.protein,
              carbs: aiDay.dinner!.carbs,
              fat: aiDay.dinner!.fat,
              servingSize: aiDay.dinner!.servingSize,
              fitScore: 80,
              tags: const [],
              isAiGenerated: true,
            )
          : null,
      snacks: aiDay.snacks
          .asMap()
          .entries
          .map((e) => MealSuggestion(
                id: '${id}_snack_${dayIndex}_${e.key}',
                name: e.value.name,
                nameEn: e.value.nameEn,
                category: 'snack',
                calories: e.value.calories,
                protein: e.value.protein,
                carbs: e.value.carbs,
                fat: e.value.fat,
                servingSize: e.value.servingSize,
                fitScore: 80,
                tags: const [],
                isAiGenerated: true,
              ))
          .toList(),
      totalCalories: aiDay.totalCalories,
      totalProtein: aiDay.totalProtein,
      totalCarbs: aiDay.totalCarbs,
      totalFat: aiDay.totalFat,
      overallFitScore: 80,
      isAiGenerated: true,
    );
  }

  return WeeklyMealPlan(
    id: id,
    weekStartDate: context.weekStartDate,
    generatedAt: now,
    monday: convertDay(result.monday, 0),
    tuesday: convertDay(result.tuesday, 1),
    wednesday: convertDay(result.wednesday, 2),
    thursday: convertDay(result.thursday, 3),
    friday: convertDay(result.friday, 4),
    saturday: convertDay(result.saturday, 5),
    sunday: convertDay(result.sunday, 6),
    weeklyCalorieTarget: context.dailyCalorieTarget * 7,
    weeklyProteinTarget: context.dailyProteinTarget * 7,
    totalCalories: result.totalCalories,
    totalProtein: result.totalProtein,
    totalCarbs: result.totalCarbs,
    totalFat: result.totalFat,
    recoveryScoreAtGeneration: context.recoveryScore,
    strainScoreAtGeneration: context.strainScore,
    isAiGenerated: result.isAiGenerated,
    coachingNote: result.coachingNote,
    coachingNoteAr: result.coachingNote,
    approvalStatus: PlanApprovalStatus.pending,
    workoutDays: context.workoutDays,
    cuisinePreferences: context.preferEgyptian ? ['egyptian'] : [],
    dietaryRestrictions: context.dietaryRestrictions,
  );
}

Future<void> _saveWeeklyMealPlan(
    AppDatabase db, WeeklyMealPlan plan) async {
  // Serialize daily plans to JSON
  final plansMap = {
    'monday': plan.monday?.toJson(),
    'tuesday': plan.tuesday?.toJson(),
    'wednesday': plan.wednesday?.toJson(),
    'thursday': plan.thursday?.toJson(),
    'friday': plan.friday?.toJson(),
    'saturday': plan.saturday?.toJson(),
    'sunday': plan.sunday?.toJson(),
  };

  await db.insertWeeklyMealPlan(
    WeeklyMealPlansTableCompanion.insert(
      id: plan.id,
      weekStartDate: plan.weekStartDate,
      generatedAt: plan.generatedAt,
      plansJson: jsonEncode(plansMap),
      weeklyCalorieTarget: Value(plan.weeklyCalorieTarget),
      weeklyProteinTarget: Value(plan.weeklyProteinTarget),
      totalCalories: Value(plan.totalCalories),
      totalProtein: Value(plan.totalProtein),
      totalCarbs: Value(plan.totalCarbs),
      totalFat: Value(plan.totalFat),
      recoveryScoreAtGeneration: Value(plan.recoveryScoreAtGeneration),
      strainScoreAtGeneration: Value(plan.strainScoreAtGeneration),
      isAiGenerated: Value(plan.isAiGenerated),
      coachingNote: Value(plan.coachingNote),
      coachingNoteAr: Value(plan.coachingNoteAr),
      approvalStatus: Value(plan.approvalStatus.value),
      workoutDaysJson: Value(jsonEncode(plan.workoutDays)),
      dietaryRestrictionsJson: Value(jsonEncode(plan.dietaryRestrictions)),
      cuisinePreferencesJson: Value(jsonEncode(plan.cuisinePreferences)),
    ),
  );
}

WeeklyMealPlan _convertFromDbData(WeeklyMealPlansTableData data) {
  // Parse daily plans from JSON
  final plansMap = jsonDecode(data.plansJson) as Map<String, dynamic>;

  DailyMealPlan? parseDay(String key) {
    final dayData = plansMap[key] as Map<String, dynamic>?;
    if (dayData == null) return null;
    return DailyMealPlan.fromJson(dayData);
  }

  return WeeklyMealPlan(
    id: data.id,
    weekStartDate: data.weekStartDate,
    generatedAt: data.generatedAt,
    monday: parseDay('monday'),
    tuesday: parseDay('tuesday'),
    wednesday: parseDay('wednesday'),
    thursday: parseDay('thursday'),
    friday: parseDay('friday'),
    saturday: parseDay('saturday'),
    sunday: parseDay('sunday'),
    weeklyCalorieTarget: data.weeklyCalorieTarget,
    weeklyProteinTarget: data.weeklyProteinTarget,
    totalCalories: data.totalCalories,
    totalProtein: data.totalProtein,
    totalCarbs: data.totalCarbs,
    totalFat: data.totalFat,
    recoveryScoreAtGeneration: data.recoveryScoreAtGeneration,
    strainScoreAtGeneration: data.strainScoreAtGeneration,
    isAiGenerated: data.isAiGenerated,
    coachingNote: data.coachingNote,
    coachingNoteAr: data.coachingNoteAr,
    approvalStatus: PlanApprovalStatus.fromString(data.approvalStatus),
    linkedWorkoutPlanId: data.linkedWorkoutPlanId,
    adjustedForWorkouts: data.adjustedForWorkouts,
    workoutDays: data.workoutDaysJson != null
        ? List<int>.from(jsonDecode(data.workoutDaysJson!))
        : [],
    dietaryRestrictions: data.dietaryRestrictionsJson != null
        ? List<String>.from(jsonDecode(data.dietaryRestrictionsJson!))
        : [],
    cuisinePreferences: data.cuisinePreferencesJson != null
        ? List<String>.from(jsonDecode(data.cuisinePreferencesJson!))
        : [],
  );
}

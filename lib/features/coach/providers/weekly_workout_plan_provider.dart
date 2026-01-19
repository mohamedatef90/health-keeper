import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../core/data/database/database.dart';
import '../../../core/providers/providers.dart';
import '../../../core/services/gemini_coach_service.dart';
import '../../nutrition/domain/entities/weekly_meal_plan.dart' show PlanApprovalStatus;
import '../domain/entities/weekly_workout_plan.dart';

/// Context for generating a new weekly workout plan
class GenerateWorkoutPlanContext {
  final DateTime weekStartDate;
  final int targetWorkoutDays;
  final List<String> fitnessGoals;
  final List<String> availableEquipment;
  final int? recoveryScore;
  final double? strainScore;
  final List<String> constraints;
  final List<String> preferredWorkoutTypes;
  final int? mealPlanCalories;
  final String language;

  const GenerateWorkoutPlanContext({
    required this.weekStartDate,
    this.targetWorkoutDays = 4,
    this.fitnessGoals = const ['strength', 'fitness'],
    this.availableEquipment = const ['full_gym'],
    this.recoveryScore,
    this.strainScore,
    this.constraints = const [],
    this.preferredWorkoutTypes = const [],
    this.mealPlanCalories,
    this.language = 'ar',
  });
}

/// Provider for generating a new weekly workout plan
final generateWeeklyWorkoutPlanProvider = FutureProvider.autoDispose
    .family<WeeklyWorkoutPlan, GenerateWorkoutPlanContext>((ref, context) async {
  final geminiService = ref.watch(geminiCoachServiceProvider);
  final db = ref.watch(databaseProvider);

  // Generate the plan from AI
  final result = await geminiService.generateWeeklyWorkoutPlan(
    targetWorkoutDays: context.targetWorkoutDays,
    fitnessGoals: context.fitnessGoals,
    availableEquipment: context.availableEquipment,
    recoveryScore: context.recoveryScore,
    strainScore: context.strainScore,
    constraints: context.constraints,
    preferredWorkoutTypes: context.preferredWorkoutTypes,
    mealPlanCalories: context.mealPlanCalories,
    language: context.language,
  );

  // Convert AI result to WeeklyWorkoutPlan entity
  final weeklyPlan = _convertToWeeklyWorkoutPlan(
    result: result,
    context: context,
  );

  // Save to database
  await _saveWeeklyWorkoutPlan(db, weeklyPlan);

  return weeklyPlan;
});

/// Provider for the current week's workout plan
final currentWeekWorkoutPlanProvider =
    FutureProvider.autoDispose<WeeklyWorkoutPlan?>((ref) async {
  final db = ref.watch(databaseProvider);
  final data = await db.getCurrentWeekWorkoutPlan();

  if (data == null) return null;

  return _convertFromDbData(data);
});

/// Provider for a specific weekly workout plan by ID
final weeklyWorkoutPlanByIdProvider = FutureProvider.autoDispose
    .family<WeeklyWorkoutPlan?, String>((ref, id) async {
  final db = ref.watch(databaseProvider);
  final data = await db.getWeeklyWorkoutPlan(id);

  if (data == null) return null;

  return _convertFromDbData(data);
});

/// Provider for recent weekly workout plans
final recentWeeklyWorkoutPlansProvider =
    FutureProvider.autoDispose<List<WeeklyWorkoutPlan>>((ref) async {
  final db = ref.watch(databaseProvider);
  final dataList = await db.getWeeklyWorkoutPlans(limit: 5);

  return dataList.map((data) => _convertFromDbData(data)).toList();
});

/// State notifier for managing weekly workout plan approval
class WeeklyWorkoutPlanNotifier
    extends StateNotifier<AsyncValue<WeeklyWorkoutPlan?>> {
  final AppDatabase _db;
  bool _hasLoaded = false;

  WeeklyWorkoutPlanNotifier(this._db) : super(const AsyncValue.data(null));

  /// Load the current plan - call this from the UI
  Future<void> loadCurrentPlan() async {
    if (_hasLoaded && state.hasValue) return; // Already loaded

    state = const AsyncValue.loading();
    try {
      final data = await _db.getCurrentWeekWorkoutPlan();
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
      await _db.updateWeeklyWorkoutPlanApprovalStatus(
          planId, PlanApprovalStatus.approved.value);
      await loadCurrentPlan();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> rejectPlan(String planId) async {
    try {
      await _db.updateWeeklyWorkoutPlanApprovalStatus(
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

final weeklyWorkoutPlanNotifierProvider = StateNotifierProvider<
    WeeklyWorkoutPlanNotifier, AsyncValue<WeeklyWorkoutPlan?>>((ref) {
  final db = ref.watch(databaseProvider);
  return WeeklyWorkoutPlanNotifier(db);
});

// ============================================================================
// Helper Functions
// ============================================================================

WeeklyWorkoutPlan _convertToWeeklyWorkoutPlan({
  required AiWeeklyWorkoutPlanResult result,
  required GenerateWorkoutPlanContext context,
}) {
  final id = const Uuid().v4();
  final now = DateTime.now();

  // Convert each day's AI result to AiDailyWorkout
  AiDailyWorkout? convertDay(AiDayWorkoutPlan? aiDay, int dayIndex) {
    if (aiDay == null) return null;

    return AiDailyWorkout(
      workoutName: aiDay.workoutName,
      workoutNameAr: aiDay.workoutNameAr,
      category: aiDay.category,
      estimatedMinutes: aiDay.estimatedMinutes,
      estimatedCaloriesBurn: aiDay.estimatedCaloriesBurn,
      suggestedIntensity: aiDay.suggestedIntensity,
      isRestDay: aiDay.isRestDay,
      targetMuscleGroups: aiDay.targetMuscleGroups,
      equipment: aiDay.equipment,
      description: aiDay.description,
      descriptionAr: aiDay.descriptionAr,
      timeOfDay: aiDay.timeOfDay,
      timeOfDayAr: aiDay.timeOfDayAr,
      notes: aiDay.notes,
      warmup: aiDay.warmup
          .map((e) => AiWorkoutExercise(
                exerciseId: e.exerciseId,
                name: e.name,
                nameAr: e.nameAr,
                muscleGroup: e.muscleGroup,
                sets: e.sets,
                reps: e.reps,
                durationSeconds: e.durationSeconds,
                restSeconds: e.restSeconds,
                suggestedWeight: e.suggestedWeight,
                suggestedWeightAr: e.suggestedWeightAr,
                instruction: e.instruction,
                instructionAr: e.instructionAr,
                order: e.order,
                isSupersetWithNext: e.isSupersetWithNext,
                equipment: e.equipment,
              ))
          .toList(),
      exercises: aiDay.exercises
          .map((e) => AiWorkoutExercise(
                exerciseId: e.exerciseId,
                name: e.name,
                nameAr: e.nameAr,
                muscleGroup: e.muscleGroup,
                sets: e.sets,
                reps: e.reps,
                durationSeconds: e.durationSeconds,
                restSeconds: e.restSeconds,
                suggestedWeight: e.suggestedWeight,
                suggestedWeightAr: e.suggestedWeightAr,
                instruction: e.instruction,
                instructionAr: e.instructionAr,
                order: e.order,
                isSupersetWithNext: e.isSupersetWithNext,
                equipment: e.equipment,
              ))
          .toList(),
      cooldown: aiDay.cooldown
          .map((e) => AiWorkoutExercise(
                exerciseId: e.exerciseId,
                name: e.name,
                nameAr: e.nameAr,
                muscleGroup: e.muscleGroup,
                sets: e.sets,
                reps: e.reps,
                durationSeconds: e.durationSeconds,
                restSeconds: e.restSeconds,
                suggestedWeight: e.suggestedWeight,
                suggestedWeightAr: e.suggestedWeightAr,
                instruction: e.instruction,
                instructionAr: e.instructionAr,
                order: e.order,
                isSupersetWithNext: e.isSupersetWithNext,
                equipment: e.equipment,
              ))
          .toList(),
    );
  }

  return WeeklyWorkoutPlan(
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
    totalEstimatedCaloriesBurn: result.totalCaloriesBurn,
    totalWorkoutMinutes: result.totalWorkoutMinutes,
    workoutDaysCount: result.workoutDaysCount,
    recoveryScoreAtGeneration: context.recoveryScore,
    strainScoreAtGeneration: context.strainScore,
    isAiGenerated: result.isAiGenerated,
    coachingNote: result.coachingNote,
    coachingNoteAr: result.coachingNoteAr,
    approvalStatus: PlanApprovalStatus.pending,
    fitnessGoals: result.fitnessGoals,
    equipmentRequired: result.equipmentRequired,
  );
}

Future<void> _saveWeeklyWorkoutPlan(
    AppDatabase db, WeeklyWorkoutPlan plan) async {
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

  await db.insertWeeklyWorkoutPlan(
    WeeklyWorkoutPlansTableCompanion.insert(
      id: plan.id,
      weekStartDate: plan.weekStartDate,
      generatedAt: plan.generatedAt,
      plansJson: jsonEncode(plansMap),
      totalEstimatedCaloriesBurn: Value(plan.totalEstimatedCaloriesBurn),
      totalWorkoutMinutes: Value(plan.totalWorkoutMinutes),
      workoutDaysCount: Value(plan.workoutDaysCount),
      recoveryScoreAtGeneration: Value(plan.recoveryScoreAtGeneration),
      strainScoreAtGeneration: Value(plan.strainScoreAtGeneration),
      isAiGenerated: Value(plan.isAiGenerated),
      coachingNote: Value(plan.coachingNote),
      coachingNoteAr: Value(plan.coachingNoteAr),
      approvalStatus: Value(plan.approvalStatus.value),
    ),
  );
}

WeeklyWorkoutPlan _convertFromDbData(WeeklyWorkoutPlansTableData data) {
  // Parse daily plans from JSON
  final plansMap = jsonDecode(data.plansJson) as Map<String, dynamic>;

  AiDailyWorkout? parseDay(String key) {
    final dayData = plansMap[key] as Map<String, dynamic>?;
    if (dayData == null) return null;
    return AiDailyWorkout.fromJson(dayData);
  }

  return WeeklyWorkoutPlan(
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
    totalEstimatedCaloriesBurn: data.totalEstimatedCaloriesBurn,
    totalWorkoutMinutes: data.totalWorkoutMinutes,
    workoutDaysCount: data.workoutDaysCount,
    recoveryScoreAtGeneration: data.recoveryScoreAtGeneration,
    strainScoreAtGeneration: data.strainScoreAtGeneration,
    isAiGenerated: data.isAiGenerated,
    coachingNote: data.coachingNote,
    coachingNoteAr: data.coachingNoteAr,
    approvalStatus: PlanApprovalStatus.fromString(data.approvalStatus),
    linkedMealPlanId: data.linkedMealPlanId,
  );
}

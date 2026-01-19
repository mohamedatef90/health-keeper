import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../data/database/database.dart';
import '../domain/entities/master_plan.dart';
import '../services/master_plan_service.dart';
import '../../features/coach/domain/entities/weekly_workout_plan.dart';
import '../../features/nutrition/domain/entities/meal_suggestion.dart';
import '../../features/nutrition/domain/entities/weekly_meal_plan.dart';
import 'providers.dart';

/// Provider for the MasterPlanService
final masterPlanServiceProvider = Provider<MasterPlanService>((ref) {
  final talker = ref.watch(talkerProvider);
  return MasterPlanServiceImpl(talker: talker);
});

/// State class for MasterPlan management
class MasterPlanState {
  final MasterPlan? masterPlan;
  final WeeklyMealPlan? mealPlan;
  final WeeklyWorkoutPlan? workoutPlan;
  final bool isLoading;
  final String? error;
  final List<PendingPlanChange> pendingChanges;

  const MasterPlanState({
    this.masterPlan,
    this.mealPlan,
    this.workoutPlan,
    this.isLoading = false,
    this.error,
    this.pendingChanges = const [],
  });

  MasterPlanState copyWith({
    MasterPlan? masterPlan,
    WeeklyMealPlan? mealPlan,
    WeeklyWorkoutPlan? workoutPlan,
    bool? isLoading,
    String? error,
    List<PendingPlanChange>? pendingChanges,
  }) {
    return MasterPlanState(
      masterPlan: masterPlan ?? this.masterPlan,
      mealPlan: mealPlan ?? this.mealPlan,
      workoutPlan: workoutPlan ?? this.workoutPlan,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      pendingChanges: pendingChanges ?? this.pendingChanges,
    );
  }

  /// Check if plans are coordinated
  bool get isCoordinated =>
      masterPlan != null && mealPlan != null && workoutPlan != null;

  /// Total planned calories for the week
  int get totalPlannedCalories => mealPlan?.totalCalories ?? 0;

  /// Total estimated calorie burn for the week
  int get totalEstimatedBurn => workoutPlan?.totalEstimatedCaloriesBurn ?? 0;

  /// Net calorie balance
  int get netCalorieBalance => totalPlannedCalories - totalEstimatedBurn;

  /// Count of pending changes
  int get pendingChangesCount =>
      pendingChanges.where((c) => c.isPending).length;
}

/// StateNotifier for managing MasterPlan
class MasterPlanNotifier extends StateNotifier<MasterPlanState> {
  final MasterPlanService _service;
  final Ref _ref;

  MasterPlanNotifier(this._service, this._ref) : super(const MasterPlanState());

  /// Load the current week's master plan
  Future<void> loadCurrentWeekPlan() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final db = _ref.read(databaseProvider);

      // Load master plan from database
      final masterPlanData = await db.getCurrentWeekMasterPlan();

      // Load associated meal and workout plans
      WeeklyMealPlan? mealPlan;
      WeeklyWorkoutPlan? workoutPlan;
      MasterPlan? masterPlan;
      List<PendingPlanChange> pendingChanges = [];

      if (masterPlanData != null) {
        masterPlan = _convertMasterPlanFromData(masterPlanData);
        pendingChanges = masterPlan.pendingChanges
            .where((c) => c.isPending)
            .toList();

        if (masterPlanData.weeklyMealPlanId != null) {
          final mealPlanData =
              await db.getWeeklyMealPlan(masterPlanData.weeklyMealPlanId!);
          if (mealPlanData != null) {
            mealPlan = _convertMealPlanFromData(mealPlanData);
          }
        }
        if (masterPlanData.weeklyWorkoutPlanId != null) {
          final workoutPlanData =
              await db.getWeeklyWorkoutPlan(masterPlanData.weeklyWorkoutPlanId!);
          if (workoutPlanData != null) {
            workoutPlan = _convertWorkoutPlanFromData(workoutPlanData);
          }
        }
      }

      state = state.copyWith(
        masterPlan: masterPlan,
        mealPlan: mealPlan,
        workoutPlan: workoutPlan,
        pendingChanges: pendingChanges,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to load master plan: $e',
      );
    }
  }

  /// Create or update the master plan with a new meal plan
  Future<void> setMealPlan(WeeklyMealPlan mealPlan) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final db = _ref.read(databaseProvider);

      // Analyze impact on workout plan if one exists
      List<PendingPlanChange> newChanges = [];
      if (state.workoutPlan != null) {
        newChanges = await _service.analyzeMealPlanImpact(
          newMealPlan: mealPlan,
          currentWorkoutPlan: state.workoutPlan,
        );
      }

      // Create or update master plan
      final now = DateTime.now();
      final monday = now.subtract(Duration(days: now.weekday - 1));
      final weekStart = DateTime(monday.year, monday.month, monday.day);

      var masterPlan = state.masterPlan;
      if (masterPlan == null) {
        masterPlan = MasterPlan(
          id: const Uuid().v4(),
          weekStartDate: weekStart,
          createdAt: now,
          updatedAt: now,
          weeklyMealPlanId: mealPlan.id,
          weeklyWorkoutPlanId: state.workoutPlan?.id,
          status: newChanges.isEmpty
              ? MasterPlanStatus.active
              : MasterPlanStatus.pendingChanges,
          pendingChanges: [...state.pendingChanges, ...newChanges],
          plannedCalorieIntake: mealPlan.totalCalories,
          plannedCalorieBurn: state.workoutPlan?.totalEstimatedCaloriesBurn,
          isActive: true,
        );
      } else {
        masterPlan = masterPlan.copyWith(
          weeklyMealPlanId: mealPlan.id,
          updatedAt: now,
          status: newChanges.isEmpty
              ? masterPlan.status
              : MasterPlanStatus.pendingChanges,
          pendingChanges: [...masterPlan.pendingChanges, ...newChanges],
          plannedCalorieIntake: mealPlan.totalCalories,
        );
      }

      // Save to database
      await _saveMasterPlan(db, masterPlan);
      await _saveMealPlan(db, mealPlan);

      state = state.copyWith(
        masterPlan: masterPlan,
        mealPlan: mealPlan,
        pendingChanges:
            masterPlan.pendingChanges.where((c) => c.isPending).toList(),
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to set meal plan: $e',
      );
    }
  }

  /// Create or update the master plan with a new workout plan
  Future<void> setWorkoutPlan(WeeklyWorkoutPlan workoutPlan) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final db = _ref.read(databaseProvider);
      // Default targets (can be fetched from user profile goals JSON if needed)
      const dailyCalorieTarget = 2000;
      const dailyProteinTarget = 120;

      // Analyze impact on meal plan if one exists
      List<PendingPlanChange> newChanges = [];
      if (state.mealPlan != null) {
        newChanges = await _service.analyzeWorkoutPlanImpact(
          newWorkoutPlan: workoutPlan,
          currentMealPlan: state.mealPlan,
          dailyCalorieTarget: dailyCalorieTarget,
          dailyProteinTarget: dailyProteinTarget,
        );
      }

      // Create or update master plan
      final now = DateTime.now();
      final monday = now.subtract(Duration(days: now.weekday - 1));
      final weekStart = DateTime(monday.year, monday.month, monday.day);

      var masterPlan = state.masterPlan;
      if (masterPlan == null) {
        masterPlan = MasterPlan(
          id: const Uuid().v4(),
          weekStartDate: weekStart,
          createdAt: now,
          updatedAt: now,
          weeklyMealPlanId: state.mealPlan?.id,
          weeklyWorkoutPlanId: workoutPlan.id,
          status: newChanges.isEmpty
              ? MasterPlanStatus.active
              : MasterPlanStatus.pendingChanges,
          pendingChanges: [...state.pendingChanges, ...newChanges],
          plannedCalorieIntake: state.mealPlan?.totalCalories,
          plannedCalorieBurn: workoutPlan.totalEstimatedCaloriesBurn,
          isActive: true,
        );
      } else {
        masterPlan = masterPlan.copyWith(
          weeklyWorkoutPlanId: workoutPlan.id,
          updatedAt: now,
          status: newChanges.isEmpty
              ? masterPlan.status
              : MasterPlanStatus.pendingChanges,
          pendingChanges: [...masterPlan.pendingChanges, ...newChanges],
          plannedCalorieBurn: workoutPlan.totalEstimatedCaloriesBurn,
        );
      }

      // Save to database
      await _saveMasterPlan(db, masterPlan);
      await _saveWorkoutPlan(db, workoutPlan);

      state = state.copyWith(
        masterPlan: masterPlan,
        workoutPlan: workoutPlan,
        pendingChanges:
            masterPlan.pendingChanges.where((c) => c.isPending).toList(),
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to set workout plan: $e',
      );
    }
  }

  /// Approve a pending change
  Future<void> approveChange(String changeId) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final db = _ref.read(databaseProvider);
      final changeIndex =
          state.pendingChanges.indexWhere((c) => c.id == changeId);

      if (changeIndex == -1) {
        throw Exception('Change not found');
      }

      final change = state.pendingChanges[changeIndex];
      final approvedChange = change.copyWith(
        status: ChangeApprovalStatus.approved,
        resolvedAt: DateTime.now(),
      );

      // Apply the change based on type
      if (change.source == PlanChangeSource.workout && state.mealPlan != null) {
        // Workout triggered this change, apply to meal plan
        final updatedMealPlan = await _service.applyMealPlanChanges(
          mealPlan: state.mealPlan!,
          approvedChanges: [approvedChange],
        );
        await _saveMealPlan(db, updatedMealPlan);
        state = state.copyWith(mealPlan: updatedMealPlan);
      } else if (change.source == PlanChangeSource.meal &&
          state.workoutPlan != null) {
        // Meal plan triggered this change, apply to workout plan
        final updatedWorkoutPlan = await _service.applyWorkoutPlanChanges(
          workoutPlan: state.workoutPlan!,
          approvedChanges: [approvedChange],
        );
        await _saveWorkoutPlan(db, updatedWorkoutPlan);
        state = state.copyWith(workoutPlan: updatedWorkoutPlan);
      }

      // Update the master plan with approved change
      if (state.masterPlan != null) {
        final updatedChanges =
            List<PendingPlanChange>.from(state.masterPlan!.pendingChanges);
        final masterChangeIndex =
            updatedChanges.indexWhere((c) => c.id == changeId);
        if (masterChangeIndex != -1) {
          updatedChanges[masterChangeIndex] = approvedChange;
        }

        final updatedMasterPlan = state.masterPlan!.copyWith(
          pendingChanges: updatedChanges,
          updatedAt: DateTime.now(),
          status: updatedChanges.any((c) => c.isPending)
              ? MasterPlanStatus.pendingChanges
              : MasterPlanStatus.active,
        );

        await _saveMasterPlan(db, updatedMasterPlan);
        state = state.copyWith(
          masterPlan: updatedMasterPlan,
          pendingChanges: updatedChanges.where((c) => c.isPending).toList(),
        );
      }

      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to approve change: $e',
      );
    }
  }

  /// Reject a pending change
  Future<void> rejectChange(String changeId) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final db = _ref.read(databaseProvider);
      final changeIndex =
          state.pendingChanges.indexWhere((c) => c.id == changeId);

      if (changeIndex == -1) {
        throw Exception('Change not found');
      }

      final change = state.pendingChanges[changeIndex];
      final rejectedChange = change.copyWith(
        status: ChangeApprovalStatus.rejected,
        resolvedAt: DateTime.now(),
      );

      // Update the master plan with rejected change
      if (state.masterPlan != null) {
        final updatedChanges =
            List<PendingPlanChange>.from(state.masterPlan!.pendingChanges);
        final masterChangeIndex =
            updatedChanges.indexWhere((c) => c.id == changeId);
        if (masterChangeIndex != -1) {
          updatedChanges[masterChangeIndex] = rejectedChange;
        }

        final updatedMasterPlan = state.masterPlan!.copyWith(
          pendingChanges: updatedChanges,
          updatedAt: DateTime.now(),
          status: updatedChanges.any((c) => c.isPending)
              ? MasterPlanStatus.pendingChanges
              : MasterPlanStatus.active,
        );

        await _saveMasterPlan(db, updatedMasterPlan);
        state = state.copyWith(
          masterPlan: updatedMasterPlan,
          pendingChanges: updatedChanges.where((c) => c.isPending).toList(),
          isLoading: false,
        );
      } else {
        state = state.copyWith(isLoading: false);
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to reject change: $e',
      );
    }
  }

  /// Approve all pending changes
  Future<void> approveAllChanges() async {
    final pendingIds = state.pendingChanges
        .where((c) => c.isPending)
        .map((c) => c.id)
        .toList();

    for (final id in pendingIds) {
      await approveChange(id);
    }
  }

  /// Refresh coordination analysis
  Future<void> refreshCoordination() async {
    if (state.mealPlan == null || state.workoutPlan == null) return;

    state = state.copyWith(isLoading: true, error: null);

    try {
      final db = _ref.read(databaseProvider);

      // Get recovery and strain scores
      final recoveryScore = await _ref.read(todayRecoveryScoreProvider.future);
      final strainScore = await _ref.read(todayStrainScoreProvider.future);

      final newRecommendations = await _service.getCoordinationRecommendations(
        mealPlan: state.mealPlan!,
        workoutPlan: state.workoutPlan!,
        recoveryScore: recoveryScore?.score,
        strainScore: strainScore?.score,
      );

      if (newRecommendations.isNotEmpty && state.masterPlan != null) {
        final updatedMasterPlan = state.masterPlan!.copyWith(
          pendingChanges: [
            ...state.masterPlan!.pendingChanges,
            ...newRecommendations
          ],
          status: MasterPlanStatus.pendingChanges,
          updatedAt: DateTime.now(),
        );

        await _saveMasterPlan(db, updatedMasterPlan);
        state = state.copyWith(
          masterPlan: updatedMasterPlan,
          pendingChanges: updatedMasterPlan.pendingChanges
              .where((c) => c.isPending)
              .toList(),
        );
      }

      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to refresh coordination: $e',
      );
    }
  }

  // ============================================================================
  // Database Helper Methods
  // ============================================================================

  Future<void> _saveMasterPlan(AppDatabase db, MasterPlan plan) async {
    final pendingChangesJson = jsonEncode(
      plan.pendingChanges.map((c) => c.toJson()).toList(),
    );

    final existing = await db.getMasterPlan(plan.id);
    final companion = MasterPlansTableCompanion(
      id: Value(plan.id),
      weekStartDate: Value(plan.weekStartDate),
      createdAt: Value(plan.createdAt),
      updatedAt: Value(plan.updatedAt),
      weeklyMealPlanId: Value(plan.weeklyMealPlanId),
      weeklyWorkoutPlanId: Value(plan.weeklyWorkoutPlanId),
      status: Value(plan.status.value),
      pendingChangesJson: Value(pendingChangesJson),
      plannedCalorieBurn: Value(plan.plannedCalorieBurn),
      plannedCalorieIntake: Value(plan.plannedCalorieIntake),
    );

    if (existing == null) {
      await db.insertMasterPlan(companion);
    } else {
      await db.updateMasterPlan(companion);
    }
  }

  Future<void> _saveMealPlan(AppDatabase db, WeeklyMealPlan plan) async {
    final plansJson = jsonEncode({
      'monday': plan.monday?.toJson(),
      'tuesday': plan.tuesday?.toJson(),
      'wednesday': plan.wednesday?.toJson(),
      'thursday': plan.thursday?.toJson(),
      'friday': plan.friday?.toJson(),
      'saturday': plan.saturday?.toJson(),
      'sunday': plan.sunday?.toJson(),
    });

    final existing = await db.getWeeklyMealPlan(plan.id);
    final companion = WeeklyMealPlansTableCompanion(
      id: Value(plan.id),
      weekStartDate: Value(plan.weekStartDate),
      generatedAt: Value(plan.generatedAt),
      plansJson: Value(plansJson),
      weeklyCalorieTarget: Value(plan.weeklyCalorieTarget),
      weeklyProteinTarget: Value(plan.weeklyProteinTarget),
      totalCalories: Value(plan.totalCalories),
      totalProtein: Value(plan.totalProtein),
      recoveryScoreAtGeneration: Value(plan.recoveryScoreAtGeneration),
      strainScoreAtGeneration: Value(plan.strainScoreAtGeneration),
      isAiGenerated: Value(plan.isAiGenerated),
      coachingNote: Value(plan.coachingNote),
      coachingNoteAr: Value(plan.coachingNoteAr),
      approvalStatus: Value(plan.approvalStatus.value),
      linkedWorkoutPlanId: Value(plan.linkedWorkoutPlanId),
    );

    if (existing == null) {
      await db.insertWeeklyMealPlan(companion);
    } else {
      await db.updateWeeklyMealPlan(companion);
    }
  }

  Future<void> _saveWorkoutPlan(AppDatabase db, WeeklyWorkoutPlan plan) async {
    final plansJson = jsonEncode({
      'monday': plan.monday?.toJson(),
      'tuesday': plan.tuesday?.toJson(),
      'wednesday': plan.wednesday?.toJson(),
      'thursday': plan.thursday?.toJson(),
      'friday': plan.friday?.toJson(),
      'saturday': plan.saturday?.toJson(),
      'sunday': plan.sunday?.toJson(),
    });

    final existing = await db.getWeeklyWorkoutPlan(plan.id);
    final companion = WeeklyWorkoutPlansTableCompanion(
      id: Value(plan.id),
      weekStartDate: Value(plan.weekStartDate),
      generatedAt: Value(plan.generatedAt),
      plansJson: Value(plansJson),
      totalEstimatedCaloriesBurn: Value(plan.totalEstimatedCaloriesBurn),
      totalWorkoutMinutes: Value(plan.totalWorkoutMinutes),
      workoutDaysCount: Value(plan.workoutDaysCount),
      recoveryScoreAtGeneration: Value(plan.recoveryScoreAtGeneration),
      strainScoreAtGeneration: Value(plan.strainScoreAtGeneration),
      isAiGenerated: Value(plan.isAiGenerated),
      coachingNote: Value(plan.coachingNote),
      coachingNoteAr: Value(plan.coachingNoteAr),
      approvalStatus: Value(plan.approvalStatus.value),
      linkedMealPlanId: Value(plan.linkedMealPlanId),
    );

    if (existing == null) {
      await db.insertWeeklyWorkoutPlan(companion);
    } else {
      await db.updateWeeklyWorkoutPlan(companion);
    }
  }

  // ============================================================================
  // Conversion Methods
  // ============================================================================

  MasterPlan _convertMasterPlanFromData(MasterPlansTableData data) {
    List<PendingPlanChange> pendingChanges = [];
    if (data.pendingChangesJson != null) {
      try {
        final list = jsonDecode(data.pendingChangesJson!) as List;
        pendingChanges = list
            .map((e) => PendingPlanChange.fromJson(e as Map<String, dynamic>))
            .toList();
      } catch (_) {
        // Ignore parsing errors
      }
    }

    return MasterPlan(
      id: data.id,
      weekStartDate: data.weekStartDate,
      createdAt: data.createdAt,
      updatedAt: data.updatedAt,
      weeklyMealPlanId: data.weeklyMealPlanId,
      weeklyWorkoutPlanId: data.weeklyWorkoutPlanId,
      status: MasterPlanStatus.fromString(data.status),
      pendingChanges: pendingChanges,
      plannedCalorieBurn: data.plannedCalorieBurn,
      plannedCalorieIntake: data.plannedCalorieIntake,
      isActive: data.status == 'active',
    );
  }

  WeeklyMealPlan _convertMealPlanFromData(WeeklyMealPlansTableData data) {
    DailyMealPlan? monday, tuesday, wednesday, thursday, friday, saturday, sunday;

    try {
      final plans = jsonDecode(data.plansJson) as Map<String, dynamic>;
      if (plans['monday'] != null) {
        monday = DailyMealPlan.fromJson(plans['monday'] as Map<String, dynamic>);
      }
      if (plans['tuesday'] != null) {
        tuesday = DailyMealPlan.fromJson(plans['tuesday'] as Map<String, dynamic>);
      }
      if (plans['wednesday'] != null) {
        wednesday =
            DailyMealPlan.fromJson(plans['wednesday'] as Map<String, dynamic>);
      }
      if (plans['thursday'] != null) {
        thursday =
            DailyMealPlan.fromJson(plans['thursday'] as Map<String, dynamic>);
      }
      if (plans['friday'] != null) {
        friday = DailyMealPlan.fromJson(plans['friday'] as Map<String, dynamic>);
      }
      if (plans['saturday'] != null) {
        saturday =
            DailyMealPlan.fromJson(plans['saturday'] as Map<String, dynamic>);
      }
      if (plans['sunday'] != null) {
        sunday = DailyMealPlan.fromJson(plans['sunday'] as Map<String, dynamic>);
      }
    } catch (_) {
      // Ignore parsing errors
    }

    return WeeklyMealPlan(
      id: data.id,
      weekStartDate: data.weekStartDate,
      generatedAt: data.generatedAt,
      monday: monday,
      tuesday: tuesday,
      wednesday: wednesday,
      thursday: thursday,
      friday: friday,
      saturday: saturday,
      sunday: sunday,
      weeklyCalorieTarget: data.weeklyCalorieTarget,
      weeklyProteinTarget: data.weeklyProteinTarget,
      totalCalories: data.totalCalories,
      totalProtein: data.totalProtein,
      recoveryScoreAtGeneration: data.recoveryScoreAtGeneration,
      strainScoreAtGeneration: data.strainScoreAtGeneration,
      isAiGenerated: data.isAiGenerated,
      coachingNote: data.coachingNote,
      coachingNoteAr: data.coachingNoteAr,
      approvalStatus: PlanApprovalStatus.fromString(data.approvalStatus),
      linkedWorkoutPlanId: data.linkedWorkoutPlanId,
    );
  }

  WeeklyWorkoutPlan _convertWorkoutPlanFromData(
      WeeklyWorkoutPlansTableData data) {
    AiDailyWorkout? monday,
        tuesday,
        wednesday,
        thursday,
        friday,
        saturday,
        sunday;

    try {
      final plans = jsonDecode(data.plansJson) as Map<String, dynamic>;
      if (plans['monday'] != null) {
        monday =
            AiDailyWorkout.fromJson(plans['monday'] as Map<String, dynamic>);
      }
      if (plans['tuesday'] != null) {
        tuesday =
            AiDailyWorkout.fromJson(plans['tuesday'] as Map<String, dynamic>);
      }
      if (plans['wednesday'] != null) {
        wednesday =
            AiDailyWorkout.fromJson(plans['wednesday'] as Map<String, dynamic>);
      }
      if (plans['thursday'] != null) {
        thursday =
            AiDailyWorkout.fromJson(plans['thursday'] as Map<String, dynamic>);
      }
      if (plans['friday'] != null) {
        friday =
            AiDailyWorkout.fromJson(plans['friday'] as Map<String, dynamic>);
      }
      if (plans['saturday'] != null) {
        saturday =
            AiDailyWorkout.fromJson(plans['saturday'] as Map<String, dynamic>);
      }
      if (plans['sunday'] != null) {
        sunday =
            AiDailyWorkout.fromJson(plans['sunday'] as Map<String, dynamic>);
      }
    } catch (_) {
      // Ignore parsing errors
    }

    return WeeklyWorkoutPlan(
      id: data.id,
      weekStartDate: data.weekStartDate,
      generatedAt: data.generatedAt,
      monday: monday,
      tuesday: tuesday,
      wednesday: wednesday,
      thursday: thursday,
      friday: friday,
      saturday: saturday,
      sunday: sunday,
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
}

/// Main provider for MasterPlan management
final masterPlanNotifierProvider =
    StateNotifierProvider<MasterPlanNotifier, MasterPlanState>((ref) {
  final service = ref.watch(masterPlanServiceProvider);
  return MasterPlanNotifier(service, ref);
});

/// Provider for the current week's master plan (convenience accessor)
final currentMasterPlanProvider = Provider<MasterPlan?>((ref) {
  return ref.watch(masterPlanNotifierProvider).masterPlan;
});

/// Provider for pending changes count
final pendingChangesCountProvider = Provider<int>((ref) {
  return ref.watch(masterPlanNotifierProvider).pendingChangesCount;
});

/// Provider for checking if plans are coordinated
final isPlansCoordinatedProvider = Provider<bool>((ref) {
  return ref.watch(masterPlanNotifierProvider).isCoordinated;
});

/// Provider for net calorie balance
final netCalorieBalanceProvider = Provider<int>((ref) {
  return ref.watch(masterPlanNotifierProvider).netCalorieBalance;
});

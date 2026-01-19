import 'package:freezed_annotation/freezed_annotation.dart';

part 'master_plan.freezed.dart';
part 'master_plan.g.dart';

/// Status of the master plan
enum MasterPlanStatus {
  draft('draft'),
  active('active'),
  pendingChanges('pending_changes');

  final String value;
  const MasterPlanStatus(this.value);

  static MasterPlanStatus fromString(String value) {
    return MasterPlanStatus.values.firstWhere(
      (e) => e.value == value,
      orElse: () => MasterPlanStatus.draft,
    );
  }
}

/// Status of a pending change
enum ChangeApprovalStatus {
  pending('pending'),
  approved('approved'),
  rejected('rejected');

  final String value;
  const ChangeApprovalStatus(this.value);

  static ChangeApprovalStatus fromString(String value) {
    return ChangeApprovalStatus.values.firstWhere(
      (e) => e.value == value,
      orElse: () => ChangeApprovalStatus.pending,
    );
  }
}

/// Source of a plan change
enum PlanChangeSource {
  workout('workout'),
  meal('meal'),
  recovery('recovery'),
  manual('manual');

  final String value;
  const PlanChangeSource(this.value);

  static PlanChangeSource fromString(String value) {
    return PlanChangeSource.values.firstWhere(
      (e) => e.value == value,
      orElse: () => PlanChangeSource.manual,
    );
  }
}

/// Type of plan change
enum PlanChangeType {
  calorieAdjustment('calorie_adjustment', 'تعديل السعرات', 'Calorie Adjustment'),
  proteinAdjustment('protein_adjustment', 'تعديل البروتين', 'Protein Adjustment'),
  intensityAdjustment('intensity_adjustment', 'تعديل الشدة', 'Intensity Adjustment'),
  restDayAdded('rest_day_added', 'إضافة يوم راحة', 'Rest Day Added'),
  restDayRemoved('rest_day_removed', 'إزالة يوم راحة', 'Rest Day Removed'),
  workoutMoved('workout_moved', 'نقل التمرين', 'Workout Moved'),
  mealTimingAdjusted('meal_timing_adjusted', 'تعديل توقيت الوجبات', 'Meal Timing Adjusted');

  final String value;
  final String arabicName;
  final String englishName;

  const PlanChangeType(this.value, this.arabicName, this.englishName);

  static PlanChangeType fromString(String value) {
    return PlanChangeType.values.firstWhere(
      (e) => e.value == value,
      orElse: () => PlanChangeType.calorieAdjustment,
    );
  }
}

/// Coordinates weekly workout and meal plans
@freezed
class MasterPlan with _$MasterPlan {
  const MasterPlan._();

  const factory MasterPlan({
    required String id,

    /// Start date of the week (Monday)
    required DateTime weekStartDate,

    /// When this master plan was created
    required DateTime createdAt,

    /// When this master plan was last updated
    required DateTime updatedAt,

    /// ID of linked weekly meal plan
    String? weeklyMealPlanId,

    /// ID of linked weekly workout plan
    String? weeklyWorkoutPlanId,

    /// Current status of the master plan
    @Default(MasterPlanStatus.draft) MasterPlanStatus status,

    /// Pending changes awaiting approval
    @Default([]) List<PendingPlanChange> pendingChanges,

    /// Total planned calorie burn from workouts
    int? plannedCalorieBurn,

    /// Total planned calorie intake from meals
    int? plannedCalorieIntake,

    /// Net calorie balance (intake - burn)
    int? netCalorieBalance,

    /// Is this the active plan for the week?
    @Default(false) bool isActive,

    /// Notes for the master plan
    String? notes,
  }) = _MasterPlan;

  factory MasterPlan.fromJson(Map<String, dynamic> json) =>
      _$MasterPlanFromJson(json);

  /// Check if the plan has both meal and workout plans linked
  bool get isComplete =>
      weeklyMealPlanId != null && weeklyWorkoutPlanId != null;

  /// Check if there are any pending changes
  bool get hasPendingChanges => pendingChanges
      .where((c) => c.status == ChangeApprovalStatus.pending)
      .isNotEmpty;

  /// Count of pending changes
  int get pendingChangesCount => pendingChanges
      .where((c) => c.status == ChangeApprovalStatus.pending)
      .length;

  /// Get all pending changes for a specific source
  List<PendingPlanChange> getPendingChangesForSource(PlanChangeSource source) =>
      pendingChanges
          .where((c) =>
              c.source == source && c.status == ChangeApprovalStatus.pending)
          .toList();
}

/// A pending change to one of the coordinated plans
@freezed
class PendingPlanChange with _$PendingPlanChange {
  const PendingPlanChange._();

  const factory PendingPlanChange({
    required String id,

    /// Source that triggered this change
    required PlanChangeSource source,

    /// Type of change
    required PlanChangeType type,

    /// Description of the change (English)
    required String description,

    /// Description of the change (Arabic)
    required String descriptionAr,

    /// What triggered this change
    required String trigger,

    /// Arabic trigger description
    String? triggerAr,

    /// Day index affected (0 = Monday, null = whole week)
    int? affectedDayIndex,

    /// Proposed changes as key-value pairs
    @Default({}) Map<String, dynamic> proposedChanges,

    /// Current approval status
    @Default(ChangeApprovalStatus.pending) ChangeApprovalStatus status,

    /// When this change was created
    required DateTime createdAt,

    /// When this change was approved/rejected
    DateTime? resolvedAt,

    /// Priority of the change (higher = more urgent)
    @Default(1) int priority,

    /// Impact score (0-100, how much this affects the overall plan)
    @Default(50) int impactScore,
  }) = _PendingPlanChange;

  factory PendingPlanChange.fromJson(Map<String, dynamic> json) =>
      _$PendingPlanChangeFromJson(json);

  /// Is this change still pending?
  bool get isPending => status == ChangeApprovalStatus.pending;

  /// Is this change approved?
  bool get isApproved => status == ChangeApprovalStatus.approved;

  /// Is this change rejected?
  bool get isRejected => status == ChangeApprovalStatus.rejected;

  /// Get day name for affected day
  String? get affectedDayName {
    if (affectedDayIndex == null) return null;
    const arabicDays = [
      'الإثنين',
      'الثلاثاء',
      'الأربعاء',
      'الخميس',
      'الجمعة',
      'السبت',
      'الأحد'
    ];
    if (affectedDayIndex! >= 0 && affectedDayIndex! < 7) {
      return arabicDays[affectedDayIndex!];
    }
    return null;
  }
}

/// Context for analyzing plan coordination impacts
@freezed
class PlanCoordinationContext with _$PlanCoordinationContext {
  const factory PlanCoordinationContext({
    /// Current week's meal plan summary
    required MealPlanSummary? mealPlan,

    /// Current week's workout plan summary
    required WorkoutPlanSummary? workoutPlan,

    /// User's recovery score
    int? recoveryScore,

    /// User's strain score
    double? strainScore,

    /// User's calorie target
    required int dailyCalorieTarget,

    /// User's protein target
    required int dailyProteinTarget,

    /// Preferred language for AI responses
    @Default('ar') String language,
  }) = _PlanCoordinationContext;

  factory PlanCoordinationContext.fromJson(Map<String, dynamic> json) =>
      _$PlanCoordinationContextFromJson(json);
}

/// Summary of meal plan for coordination analysis
@freezed
class MealPlanSummary with _$MealPlanSummary {
  const factory MealPlanSummary({
    required String planId,

    /// Daily calories for each day (index 0 = Monday)
    @Default([]) List<int> dailyCalories,

    /// Daily protein for each day
    @Default([]) List<int> dailyProtein,

    /// Total weekly calories
    required int totalCalories,

    /// Total weekly protein
    required int totalProtein,

    /// Average daily calories
    required int averageDailyCalories,

    /// Average daily protein
    required int averageDailyProtein,
  }) = _MealPlanSummary;

  factory MealPlanSummary.fromJson(Map<String, dynamic> json) =>
      _$MealPlanSummaryFromJson(json);
}

/// Summary of workout plan for coordination analysis
@freezed
class WorkoutPlanSummary with _$WorkoutPlanSummary {
  const factory WorkoutPlanSummary({
    required String planId,

    /// Workout days (0 = Monday)
    @Default([]) List<int> workoutDays,

    /// Strength training days
    @Default([]) List<int> strengthDays,

    /// Cardio days
    @Default([]) List<int> cardioDays,

    /// Rest days
    @Default([]) List<int> restDays,

    /// Estimated calorie burn per day
    @Default({}) Map<int, int> dailyCalorieBurn,

    /// Total estimated weekly calorie burn
    required int totalCalorieBurn,

    /// Total workout minutes for the week
    required int totalWorkoutMinutes,

    /// Number of workout days
    required int workoutDaysCount,
  }) = _WorkoutPlanSummary;

  factory WorkoutPlanSummary.fromJson(Map<String, dynamic> json) =>
      _$WorkoutPlanSummaryFromJson(json);
}

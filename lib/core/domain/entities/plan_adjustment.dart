import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan_adjustment.freezed.dart';
part 'plan_adjustment.g.dart';

/// Type of plan adjustment
@JsonEnum()
enum AdjustmentType {
  /// Calorie target adjustment
  @JsonValue('calorie_adjustment')
  calorieAdjustment,

  /// Protein target adjustment
  @JsonValue('protein_adjustment')
  proteinAdjustment,

  /// Workout intensity adjustment
  @JsonValue('intensity_adjustment')
  intensityAdjustment,

  /// Adding a rest day
  @JsonValue('rest_day_added')
  restDayAdded,

  /// Removing a rest day (converting to workout)
  @JsonValue('rest_day_removed')
  restDayRemoved,

  /// Moving a workout to different day
  @JsonValue('workout_moved')
  workoutMoved,

  /// Swapping workout type
  @JsonValue('workout_swapped')
  workoutSwapped,

  /// Meal timing adjustment
  @JsonValue('meal_timing')
  mealTiming,

  /// Adding extra calories (post-workout)
  @JsonValue('extra_calories')
  extraCalories,

  /// Deload week recommendation
  @JsonValue('deload_week')
  deloadWeek,
}

/// Domain of the adjustment
@JsonEnum()
enum AdjustmentDomain {
  @JsonValue('workout')
  workout,

  @JsonValue('meal')
  meal,

  @JsonValue('recovery')
  recovery,

  @JsonValue('both')
  both,
}

/// Status of the adjustment
@JsonEnum()
enum AdjustmentStatus {
  /// Proposed but not yet reviewed
  @JsonValue('proposed')
  proposed,

  /// Auto-applied based on autonomy settings
  @JsonValue('auto_applied')
  autoApplied,

  /// Approved by user
  @JsonValue('approved')
  approved,

  /// Rejected by user
  @JsonValue('rejected')
  rejected,

  /// Applied to the plan
  @JsonValue('applied')
  applied,

  /// Reverted after being applied
  @JsonValue('reverted')
  reverted,
}

/// Plan adjustment entity
@freezed
class PlanAdjustment with _$PlanAdjustment {
  const PlanAdjustment._();

  const factory PlanAdjustment({
    required String id,
    required AdjustmentType type,
    required AdjustmentDomain domain,

    /// Reason for the adjustment (English)
    required String reason,
    String? reasonAr,

    /// Detailed explanation
    String? explanation,
    String? explanationAr,

    /// What triggered this adjustment
    required String trigger,
    String? triggerAr,

    /// Original value (JSON-serializable)
    required Map<String, dynamic> originalValue,

    /// Proposed new value (JSON-serializable)
    required Map<String, dynamic> proposedValue,

    /// Day index affected (0 = Monday, null = whole week)
    int? affectedDayIndex,

    /// Impact score (0-100)
    @Default(50) int impactScore,

    /// Confidence in this adjustment (0-100)
    @Default(80) int confidence,

    /// Current status
    @Default(AdjustmentStatus.proposed) AdjustmentStatus status,

    /// Related plan IDs
    String? mealPlanId,
    String? workoutPlanId,
    String? masterPlanId,

    /// Timestamps
    required DateTime createdAt,
    DateTime? appliedAt,
    DateTime? revertedAt,

    /// User feedback
    String? userFeedback,
  }) = _PlanAdjustment;

  factory PlanAdjustment.fromJson(Map<String, dynamic> json) =>
      _$PlanAdjustmentFromJson(json);

  /// Get localized reason
  String getReason(String language) =>
      language == 'ar' && reasonAr != null ? reasonAr! : reason;

  /// Get localized trigger
  String getTrigger(String language) =>
      language == 'ar' && triggerAr != null ? triggerAr! : trigger;

  /// Check if adjustment is pending review
  bool get isPending => status == AdjustmentStatus.proposed;

  /// Check if adjustment was applied
  bool get isApplied =>
      status == AdjustmentStatus.applied ||
      status == AdjustmentStatus.autoApplied;

  /// Check if adjustment can be reverted
  bool get canRevert =>
      isApplied &&
      DateTime.now().difference(appliedAt ?? createdAt).inHours < 24;

  /// Get affected day name (Arabic)
  String? get affectedDayNameAr {
    if (affectedDayIndex == null) return null;
    const days = [
      'الإثنين',
      'الثلاثاء',
      'الأربعاء',
      'الخميس',
      'الجمعة',
      'السبت',
      'الأحد'
    ];
    if (affectedDayIndex! >= 0 && affectedDayIndex! < 7) {
      return days[affectedDayIndex!];
    }
    return null;
  }

  /// Get affected day name (English)
  String? get affectedDayNameEn {
    if (affectedDayIndex == null) return null;
    const days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    if (affectedDayIndex! >= 0 && affectedDayIndex! < 7) {
      return days[affectedDayIndex!];
    }
    return null;
  }
}

/// Adjustment rule definition for the adjustment engine
class AdjustmentRule {
  final String id;
  final String name;
  final AdjustmentType type;
  final AdjustmentDomain domain;
  final bool Function(AdjustmentRuleContext) condition;
  final Map<String, dynamic> Function(AdjustmentRuleContext) calculateChange;
  final int defaultImpactScore;
  final bool requiresApprovalByDefault;

  const AdjustmentRule({
    required this.id,
    required this.name,
    required this.type,
    required this.domain,
    required this.condition,
    required this.calculateChange,
    this.defaultImpactScore = 50,
    this.requiresApprovalByDefault = true,
  });
}

/// Context for evaluating adjustment rules
class AdjustmentRuleContext {
  final int recoveryScore;
  final double strainScore;
  final double? sleepHours;
  final int consecutiveLowRecoveryDays;
  final int consecutiveHighStrainDays;
  final int caloriesConsumed;
  final int caloriesTarget;
  final int caloriesBurnedToday;
  final int plannedCaloriesBurn;
  final bool isWorkoutDay;
  final String? workoutType;
  final int? workoutIntensity;
  final double? sleepDebtHours;
  final List<int> recoveryHistory;
  final List<double> strainHistory;

  AdjustmentRuleContext({
    required this.recoveryScore,
    required this.strainScore,
    this.sleepHours,
    this.consecutiveLowRecoveryDays = 0,
    this.consecutiveHighStrainDays = 0,
    required this.caloriesConsumed,
    required this.caloriesTarget,
    this.caloriesBurnedToday = 0,
    this.plannedCaloriesBurn = 0,
    this.isWorkoutDay = false,
    this.workoutType,
    this.workoutIntensity,
    this.sleepDebtHours,
    this.recoveryHistory = const [],
    this.strainHistory = const [],
  });

  /// Check if recovery is low
  bool get isLowRecovery => recoveryScore < 40;

  /// Check if recovery is high
  bool get isHighRecovery => recoveryScore >= 80;

  /// Check if strain is high
  bool get isHighStrain => strainScore > 14;

  /// Check if there's calorie surplus from workout
  int get extraCaloriesBurned => caloriesBurnedToday - plannedCaloriesBurn;

  /// Check if behind on calories
  bool get isBehindOnCalories {
    final now = DateTime.now();
    final hourProgress = now.hour / 24;
    final expectedCalories = caloriesTarget * hourProgress;
    return caloriesConsumed < expectedCalories * 0.6;
  }
}

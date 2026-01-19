// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MasterPlanImpl _$$MasterPlanImplFromJson(Map<String, dynamic> json) =>
    _$MasterPlanImpl(
      id: json['id'] as String,
      weekStartDate: DateTime.parse(json['weekStartDate'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      weeklyMealPlanId: json['weeklyMealPlanId'] as String?,
      weeklyWorkoutPlanId: json['weeklyWorkoutPlanId'] as String?,
      status:
          $enumDecodeNullable(_$MasterPlanStatusEnumMap, json['status']) ??
          MasterPlanStatus.draft,
      pendingChanges:
          (json['pendingChanges'] as List<dynamic>?)
              ?.map(
                (e) => PendingPlanChange.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      plannedCalorieBurn: (json['plannedCalorieBurn'] as num?)?.toInt(),
      plannedCalorieIntake: (json['plannedCalorieIntake'] as num?)?.toInt(),
      netCalorieBalance: (json['netCalorieBalance'] as num?)?.toInt(),
      isActive: json['isActive'] as bool? ?? false,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$MasterPlanImplToJson(_$MasterPlanImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'weekStartDate': instance.weekStartDate.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'weeklyMealPlanId': instance.weeklyMealPlanId,
      'weeklyWorkoutPlanId': instance.weeklyWorkoutPlanId,
      'status': _$MasterPlanStatusEnumMap[instance.status]!,
      'pendingChanges': instance.pendingChanges,
      'plannedCalorieBurn': instance.plannedCalorieBurn,
      'plannedCalorieIntake': instance.plannedCalorieIntake,
      'netCalorieBalance': instance.netCalorieBalance,
      'isActive': instance.isActive,
      'notes': instance.notes,
    };

const _$MasterPlanStatusEnumMap = {
  MasterPlanStatus.draft: 'draft',
  MasterPlanStatus.active: 'active',
  MasterPlanStatus.pendingChanges: 'pendingChanges',
};

_$PendingPlanChangeImpl _$$PendingPlanChangeImplFromJson(
  Map<String, dynamic> json,
) => _$PendingPlanChangeImpl(
  id: json['id'] as String,
  source: $enumDecode(_$PlanChangeSourceEnumMap, json['source']),
  type: $enumDecode(_$PlanChangeTypeEnumMap, json['type']),
  description: json['description'] as String,
  descriptionAr: json['descriptionAr'] as String,
  trigger: json['trigger'] as String,
  triggerAr: json['triggerAr'] as String?,
  affectedDayIndex: (json['affectedDayIndex'] as num?)?.toInt(),
  proposedChanges: json['proposedChanges'] as Map<String, dynamic>? ?? const {},
  status:
      $enumDecodeNullable(_$ChangeApprovalStatusEnumMap, json['status']) ??
      ChangeApprovalStatus.pending,
  createdAt: DateTime.parse(json['createdAt'] as String),
  resolvedAt: json['resolvedAt'] == null
      ? null
      : DateTime.parse(json['resolvedAt'] as String),
  priority: (json['priority'] as num?)?.toInt() ?? 1,
  impactScore: (json['impactScore'] as num?)?.toInt() ?? 50,
);

Map<String, dynamic> _$$PendingPlanChangeImplToJson(
  _$PendingPlanChangeImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'source': _$PlanChangeSourceEnumMap[instance.source]!,
  'type': _$PlanChangeTypeEnumMap[instance.type]!,
  'description': instance.description,
  'descriptionAr': instance.descriptionAr,
  'trigger': instance.trigger,
  'triggerAr': instance.triggerAr,
  'affectedDayIndex': instance.affectedDayIndex,
  'proposedChanges': instance.proposedChanges,
  'status': _$ChangeApprovalStatusEnumMap[instance.status]!,
  'createdAt': instance.createdAt.toIso8601String(),
  'resolvedAt': instance.resolvedAt?.toIso8601String(),
  'priority': instance.priority,
  'impactScore': instance.impactScore,
};

const _$PlanChangeSourceEnumMap = {
  PlanChangeSource.workout: 'workout',
  PlanChangeSource.meal: 'meal',
  PlanChangeSource.recovery: 'recovery',
  PlanChangeSource.manual: 'manual',
};

const _$PlanChangeTypeEnumMap = {
  PlanChangeType.calorieAdjustment: 'calorieAdjustment',
  PlanChangeType.proteinAdjustment: 'proteinAdjustment',
  PlanChangeType.intensityAdjustment: 'intensityAdjustment',
  PlanChangeType.restDayAdded: 'restDayAdded',
  PlanChangeType.restDayRemoved: 'restDayRemoved',
  PlanChangeType.workoutMoved: 'workoutMoved',
  PlanChangeType.mealTimingAdjusted: 'mealTimingAdjusted',
};

const _$ChangeApprovalStatusEnumMap = {
  ChangeApprovalStatus.pending: 'pending',
  ChangeApprovalStatus.approved: 'approved',
  ChangeApprovalStatus.rejected: 'rejected',
};

_$PlanCoordinationContextImpl _$$PlanCoordinationContextImplFromJson(
  Map<String, dynamic> json,
) => _$PlanCoordinationContextImpl(
  mealPlan: json['mealPlan'] == null
      ? null
      : MealPlanSummary.fromJson(json['mealPlan'] as Map<String, dynamic>),
  workoutPlan: json['workoutPlan'] == null
      ? null
      : WorkoutPlanSummary.fromJson(
          json['workoutPlan'] as Map<String, dynamic>,
        ),
  recoveryScore: (json['recoveryScore'] as num?)?.toInt(),
  strainScore: (json['strainScore'] as num?)?.toDouble(),
  dailyCalorieTarget: (json['dailyCalorieTarget'] as num).toInt(),
  dailyProteinTarget: (json['dailyProteinTarget'] as num).toInt(),
  language: json['language'] as String? ?? 'ar',
);

Map<String, dynamic> _$$PlanCoordinationContextImplToJson(
  _$PlanCoordinationContextImpl instance,
) => <String, dynamic>{
  'mealPlan': instance.mealPlan,
  'workoutPlan': instance.workoutPlan,
  'recoveryScore': instance.recoveryScore,
  'strainScore': instance.strainScore,
  'dailyCalorieTarget': instance.dailyCalorieTarget,
  'dailyProteinTarget': instance.dailyProteinTarget,
  'language': instance.language,
};

_$MealPlanSummaryImpl _$$MealPlanSummaryImplFromJson(
  Map<String, dynamic> json,
) => _$MealPlanSummaryImpl(
  planId: json['planId'] as String,
  dailyCalories:
      (json['dailyCalories'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const [],
  dailyProtein:
      (json['dailyProtein'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const [],
  totalCalories: (json['totalCalories'] as num).toInt(),
  totalProtein: (json['totalProtein'] as num).toInt(),
  averageDailyCalories: (json['averageDailyCalories'] as num).toInt(),
  averageDailyProtein: (json['averageDailyProtein'] as num).toInt(),
);

Map<String, dynamic> _$$MealPlanSummaryImplToJson(
  _$MealPlanSummaryImpl instance,
) => <String, dynamic>{
  'planId': instance.planId,
  'dailyCalories': instance.dailyCalories,
  'dailyProtein': instance.dailyProtein,
  'totalCalories': instance.totalCalories,
  'totalProtein': instance.totalProtein,
  'averageDailyCalories': instance.averageDailyCalories,
  'averageDailyProtein': instance.averageDailyProtein,
};

_$WorkoutPlanSummaryImpl _$$WorkoutPlanSummaryImplFromJson(
  Map<String, dynamic> json,
) => _$WorkoutPlanSummaryImpl(
  planId: json['planId'] as String,
  workoutDays:
      (json['workoutDays'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const [],
  strengthDays:
      (json['strengthDays'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const [],
  cardioDays:
      (json['cardioDays'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const [],
  restDays:
      (json['restDays'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const [],
  dailyCalorieBurn:
      (json['dailyCalorieBurn'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(int.parse(k), (e as num).toInt()),
      ) ??
      const {},
  totalCalorieBurn: (json['totalCalorieBurn'] as num).toInt(),
  totalWorkoutMinutes: (json['totalWorkoutMinutes'] as num).toInt(),
  workoutDaysCount: (json['workoutDaysCount'] as num).toInt(),
);

Map<String, dynamic> _$$WorkoutPlanSummaryImplToJson(
  _$WorkoutPlanSummaryImpl instance,
) => <String, dynamic>{
  'planId': instance.planId,
  'workoutDays': instance.workoutDays,
  'strengthDays': instance.strengthDays,
  'cardioDays': instance.cardioDays,
  'restDays': instance.restDays,
  'dailyCalorieBurn': instance.dailyCalorieBurn.map(
    (k, e) => MapEntry(k.toString(), e),
  ),
  'totalCalorieBurn': instance.totalCalorieBurn,
  'totalWorkoutMinutes': instance.totalWorkoutMinutes,
  'workoutDaysCount': instance.workoutDaysCount,
};

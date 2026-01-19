// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_meal_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeeklyMealPlanImpl _$$WeeklyMealPlanImplFromJson(
  Map<String, dynamic> json,
) => _$WeeklyMealPlanImpl(
  id: json['id'] as String,
  weekStartDate: DateTime.parse(json['weekStartDate'] as String),
  generatedAt: DateTime.parse(json['generatedAt'] as String),
  monday: json['monday'] == null
      ? null
      : DailyMealPlan.fromJson(json['monday'] as Map<String, dynamic>),
  tuesday: json['tuesday'] == null
      ? null
      : DailyMealPlan.fromJson(json['tuesday'] as Map<String, dynamic>),
  wednesday: json['wednesday'] == null
      ? null
      : DailyMealPlan.fromJson(json['wednesday'] as Map<String, dynamic>),
  thursday: json['thursday'] == null
      ? null
      : DailyMealPlan.fromJson(json['thursday'] as Map<String, dynamic>),
  friday: json['friday'] == null
      ? null
      : DailyMealPlan.fromJson(json['friday'] as Map<String, dynamic>),
  saturday: json['saturday'] == null
      ? null
      : DailyMealPlan.fromJson(json['saturday'] as Map<String, dynamic>),
  sunday: json['sunday'] == null
      ? null
      : DailyMealPlan.fromJson(json['sunday'] as Map<String, dynamic>),
  weeklyCalorieTarget: (json['weeklyCalorieTarget'] as num?)?.toInt() ?? 14000,
  weeklyProteinTarget: (json['weeklyProteinTarget'] as num?)?.toInt() ?? 840,
  totalCalories: (json['totalCalories'] as num?)?.toInt() ?? 0,
  totalProtein: (json['totalProtein'] as num?)?.toInt() ?? 0,
  totalCarbs: (json['totalCarbs'] as num?)?.toInt() ?? 0,
  totalFat: (json['totalFat'] as num?)?.toInt() ?? 0,
  recoveryScoreAtGeneration: (json['recoveryScoreAtGeneration'] as num?)
      ?.toInt(),
  strainScoreAtGeneration: (json['strainScoreAtGeneration'] as num?)
      ?.toDouble(),
  isAiGenerated: json['isAiGenerated'] as bool? ?? true,
  coachingNote: json['coachingNote'] as String?,
  coachingNoteAr: json['coachingNoteAr'] as String?,
  approvalStatus:
      $enumDecodeNullable(
        _$PlanApprovalStatusEnumMap,
        json['approvalStatus'],
      ) ??
      PlanApprovalStatus.pending,
  linkedWorkoutPlanId: json['linkedWorkoutPlanId'] as String?,
  adjustedForWorkouts: json['adjustedForWorkouts'] as bool? ?? false,
  workoutDays:
      (json['workoutDays'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const [],
  dietaryRestrictions:
      (json['dietaryRestrictions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  cuisinePreferences:
      (json['cuisinePreferences'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const ['egyptian'],
);

Map<String, dynamic> _$$WeeklyMealPlanImplToJson(
  _$WeeklyMealPlanImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'weekStartDate': instance.weekStartDate.toIso8601String(),
  'generatedAt': instance.generatedAt.toIso8601String(),
  'monday': instance.monday,
  'tuesday': instance.tuesday,
  'wednesday': instance.wednesday,
  'thursday': instance.thursday,
  'friday': instance.friday,
  'saturday': instance.saturday,
  'sunday': instance.sunday,
  'weeklyCalorieTarget': instance.weeklyCalorieTarget,
  'weeklyProteinTarget': instance.weeklyProteinTarget,
  'totalCalories': instance.totalCalories,
  'totalProtein': instance.totalProtein,
  'totalCarbs': instance.totalCarbs,
  'totalFat': instance.totalFat,
  'recoveryScoreAtGeneration': instance.recoveryScoreAtGeneration,
  'strainScoreAtGeneration': instance.strainScoreAtGeneration,
  'isAiGenerated': instance.isAiGenerated,
  'coachingNote': instance.coachingNote,
  'coachingNoteAr': instance.coachingNoteAr,
  'approvalStatus': _$PlanApprovalStatusEnumMap[instance.approvalStatus]!,
  'linkedWorkoutPlanId': instance.linkedWorkoutPlanId,
  'adjustedForWorkouts': instance.adjustedForWorkouts,
  'workoutDays': instance.workoutDays,
  'dietaryRestrictions': instance.dietaryRestrictions,
  'cuisinePreferences': instance.cuisinePreferences,
};

const _$PlanApprovalStatusEnumMap = {
  PlanApprovalStatus.pending: 'pending',
  PlanApprovalStatus.approved: 'approved',
  PlanApprovalStatus.rejected: 'rejected',
  PlanApprovalStatus.modified: 'modified',
};

_$WeeklyMealPlanContextImpl _$$WeeklyMealPlanContextImplFromJson(
  Map<String, dynamic> json,
) => _$WeeklyMealPlanContextImpl(
  weekStartDate: DateTime.parse(json['weekStartDate'] as String),
  dailyCalorieTarget: (json['dailyCalorieTarget'] as num).toInt(),
  dailyProteinTarget: (json['dailyProteinTarget'] as num).toInt(),
  dietaryRestrictions:
      (json['dietaryRestrictions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  preferEgyptian: json['preferEgyptian'] as bool? ?? true,
  eatingWindowStart: json['eatingWindowStart'] as String?,
  eatingWindowEnd: json['eatingWindowEnd'] as String?,
  recoveryScore: (json['recoveryScore'] as num?)?.toInt(),
  strainScore: (json['strainScore'] as num?)?.toDouble(),
  workoutPlan: json['workoutPlan'] == null
      ? null
      : WeeklyWorkoutSummary.fromJson(
          json['workoutPlan'] as Map<String, dynamic>,
        ),
  workoutDays:
      (json['workoutDays'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const [],
  workoutDayCalorieBonus:
      (json['workoutDayCalorieBonus'] as num?)?.toInt() ?? 250,
  strengthDayProteinBonus:
      (json['strengthDayProteinBonus'] as num?)?.toInt() ?? 20,
  preferHighProtein: json['preferHighProtein'] as bool? ?? false,
  preferVegetarian: json['preferVegetarian'] as bool? ?? false,
  preferLowCarb: json['preferLowCarb'] as bool? ?? false,
  language: json['language'] as String? ?? 'ar',
);

Map<String, dynamic> _$$WeeklyMealPlanContextImplToJson(
  _$WeeklyMealPlanContextImpl instance,
) => <String, dynamic>{
  'weekStartDate': instance.weekStartDate.toIso8601String(),
  'dailyCalorieTarget': instance.dailyCalorieTarget,
  'dailyProteinTarget': instance.dailyProteinTarget,
  'dietaryRestrictions': instance.dietaryRestrictions,
  'preferEgyptian': instance.preferEgyptian,
  'eatingWindowStart': instance.eatingWindowStart,
  'eatingWindowEnd': instance.eatingWindowEnd,
  'recoveryScore': instance.recoveryScore,
  'strainScore': instance.strainScore,
  'workoutPlan': instance.workoutPlan,
  'workoutDays': instance.workoutDays,
  'workoutDayCalorieBonus': instance.workoutDayCalorieBonus,
  'strengthDayProteinBonus': instance.strengthDayProteinBonus,
  'preferHighProtein': instance.preferHighProtein,
  'preferVegetarian': instance.preferVegetarian,
  'preferLowCarb': instance.preferLowCarb,
  'language': instance.language,
};

_$WeeklyWorkoutSummaryImpl _$$WeeklyWorkoutSummaryImplFromJson(
  Map<String, dynamic> json,
) => _$WeeklyWorkoutSummaryImpl(
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
  estimatedWeeklyCalorieBurn:
      (json['estimatedWeeklyCalorieBurn'] as num?)?.toInt() ?? 0,
  workoutDescriptions:
      (json['workoutDescriptions'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(int.parse(k), e as String),
      ) ??
      const {},
);

Map<String, dynamic> _$$WeeklyWorkoutSummaryImplToJson(
  _$WeeklyWorkoutSummaryImpl instance,
) => <String, dynamic>{
  'planId': instance.planId,
  'workoutDays': instance.workoutDays,
  'strengthDays': instance.strengthDays,
  'cardioDays': instance.cardioDays,
  'estimatedWeeklyCalorieBurn': instance.estimatedWeeklyCalorieBurn,
  'workoutDescriptions': instance.workoutDescriptions.map(
    (k, e) => MapEntry(k.toString(), e),
  ),
};

_$MealPlanChangeImpl _$$MealPlanChangeImplFromJson(Map<String, dynamic> json) =>
    _$MealPlanChangeImpl(
      id: json['id'] as String,
      dayIndex: (json['dayIndex'] as num).toInt(),
      changeType: $enumDecode(_$MealPlanChangeTypeEnumMap, json['changeType']),
      description: json['description'] as String,
      descriptionAr: json['descriptionAr'] as String,
      trigger: json['trigger'] as String,
      proposedCalories: (json['proposedCalories'] as num?)?.toInt(),
      proposedProtein: (json['proposedProtein'] as num?)?.toInt(),
      originalCalories: (json['originalCalories'] as num?)?.toInt(),
      originalProtein: (json['originalProtein'] as num?)?.toInt(),
      isApproved: json['isApproved'] as bool? ?? false,
      isRejected: json['isRejected'] as bool? ?? false,
    );

Map<String, dynamic> _$$MealPlanChangeImplToJson(
  _$MealPlanChangeImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'dayIndex': instance.dayIndex,
  'changeType': _$MealPlanChangeTypeEnumMap[instance.changeType]!,
  'description': instance.description,
  'descriptionAr': instance.descriptionAr,
  'trigger': instance.trigger,
  'proposedCalories': instance.proposedCalories,
  'proposedProtein': instance.proposedProtein,
  'originalCalories': instance.originalCalories,
  'originalProtein': instance.originalProtein,
  'isApproved': instance.isApproved,
  'isRejected': instance.isRejected,
};

const _$MealPlanChangeTypeEnumMap = {
  MealPlanChangeType.calorieIncrease: 'calorieIncrease',
  MealPlanChangeType.calorieDecrease: 'calorieDecrease',
  MealPlanChangeType.proteinIncrease: 'proteinIncrease',
  MealPlanChangeType.proteinDecrease: 'proteinDecrease',
  MealPlanChangeType.mealTiming: 'mealTiming',
  MealPlanChangeType.restDayAdjustment: 'restDayAdjustment',
};

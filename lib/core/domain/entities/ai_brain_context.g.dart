// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_brain_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AiBrainContextImpl _$$AiBrainContextImplFromJson(Map<String, dynamic> json) =>
    _$AiBrainContextImpl(
      generatedAt: DateTime.parse(json['generatedAt'] as String),
      userContext: json['userContext'] == null
          ? null
          : AiBrainUserContext.fromJson(
              json['userContext'] as Map<String, dynamic>,
            ),
      healthContext: json['healthContext'] == null
          ? null
          : AiBrainHealthContext.fromJson(
              json['healthContext'] as Map<String, dynamic>,
            ),
      trendsContext: json['trendsContext'] == null
          ? null
          : AiBrainTrendsContext.fromJson(
              json['trendsContext'] as Map<String, dynamic>,
            ),
      nutritionContext: json['nutritionContext'] == null
          ? null
          : AiBrainNutritionContext.fromJson(
              json['nutritionContext'] as Map<String, dynamic>,
            ),
      plansContext: json['plansContext'] == null
          ? null
          : AiBrainPlansContext.fromJson(
              json['plansContext'] as Map<String, dynamic>,
            ),
      recentMessages:
          (json['recentMessages'] as List<dynamic>?)
              ?.map(
                (e) => AiBrainChatMessage.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      activeAlerts:
          (json['activeAlerts'] as List<dynamic>?)
              ?.map((e) => AiBrainAlert.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      syncStatus: AiBrainSyncStatus.fromJson(
        json['syncStatus'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$$AiBrainContextImplToJson(
  _$AiBrainContextImpl instance,
) => <String, dynamic>{
  'generatedAt': instance.generatedAt.toIso8601String(),
  'userContext': instance.userContext,
  'healthContext': instance.healthContext,
  'trendsContext': instance.trendsContext,
  'nutritionContext': instance.nutritionContext,
  'plansContext': instance.plansContext,
  'recentMessages': instance.recentMessages,
  'activeAlerts': instance.activeAlerts,
  'syncStatus': instance.syncStatus,
};

_$AiBrainUserContextImpl _$$AiBrainUserContextImplFromJson(
  Map<String, dynamic> json,
) => _$AiBrainUserContextImpl(
  id: json['id'] as String,
  age: (json['age'] as num?)?.toInt(),
  height: (json['height'] as num?)?.toDouble(),
  gender: json['gender'] as String?,
  timezone: json['timezone'] as String?,
  targetWeight: (json['targetWeight'] as num?)?.toDouble(),
  targetWaist: (json['targetWaist'] as num?)?.toDouble(),
  targetSteps: (json['targetSteps'] as num?)?.toInt(),
  targetCalories: (json['targetCalories'] as num?)?.toInt(),
  targetProtein: (json['targetProtein'] as num?)?.toInt(),
  targetSleepHours: (json['targetSleepHours'] as num?)?.toDouble(),
  coachingTone: json['coachingTone'] as String? ?? 'supportive',
  language: json['language'] as String? ?? 'ar',
  enableAiCoaching: json['enableAiCoaching'] as bool? ?? true,
  eatingWindowStartHour: (json['eatingWindowStartHour'] as num?)?.toInt(),
  eatingWindowStartMinute: (json['eatingWindowStartMinute'] as num?)?.toInt(),
  eatingWindowEndHour: (json['eatingWindowEndHour'] as num?)?.toInt(),
  eatingWindowEndMinute: (json['eatingWindowEndMinute'] as num?)?.toInt(),
  activeConstraints:
      (json['activeConstraints'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$$AiBrainUserContextImplToJson(
  _$AiBrainUserContextImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'age': instance.age,
  'height': instance.height,
  'gender': instance.gender,
  'timezone': instance.timezone,
  'targetWeight': instance.targetWeight,
  'targetWaist': instance.targetWaist,
  'targetSteps': instance.targetSteps,
  'targetCalories': instance.targetCalories,
  'targetProtein': instance.targetProtein,
  'targetSleepHours': instance.targetSleepHours,
  'coachingTone': instance.coachingTone,
  'language': instance.language,
  'enableAiCoaching': instance.enableAiCoaching,
  'eatingWindowStartHour': instance.eatingWindowStartHour,
  'eatingWindowStartMinute': instance.eatingWindowStartMinute,
  'eatingWindowEndHour': instance.eatingWindowEndHour,
  'eatingWindowEndMinute': instance.eatingWindowEndMinute,
  'activeConstraints': instance.activeConstraints,
};

_$AiBrainHealthContextImpl _$$AiBrainHealthContextImplFromJson(
  Map<String, dynamic> json,
) => _$AiBrainHealthContextImpl(
  recoveryScore: (json['recoveryScore'] as num?)?.toInt() ?? 50,
  recoveryState: json['recoveryState'] as String? ?? 'moderate',
  strainScore: (json['strainScore'] as num?)?.toDouble() ?? 0.0,
  sleepDuration: (json['sleepDuration'] as num?)?.toDouble(),
  sleepQuality: (json['sleepQuality'] as num?)?.toInt(),
  hrv: (json['hrv'] as num?)?.toInt(),
  restingHR: (json['restingHR'] as num?)?.toInt(),
  hrvBaseline: (json['hrvBaseline'] as num?)?.toInt(),
  rhrBaseline: (json['rhrBaseline'] as num?)?.toInt(),
  steps: (json['steps'] as num?)?.toInt() ?? 0,
  activeEnergy: (json['activeEnergy'] as num?)?.toInt() ?? 0,
  moodEnergy: (json['moodEnergy'] as num?)?.toInt(),
  stress: (json['stress'] as num?)?.toInt(),
  hunger: (json['hunger'] as num?)?.toInt(),
  weight: (json['weight'] as num?)?.toDouble(),
  lastHealthKitSync: json['lastHealthKitSync'] == null
      ? null
      : DateTime.parse(json['lastHealthKitSync'] as String),
);

Map<String, dynamic> _$$AiBrainHealthContextImplToJson(
  _$AiBrainHealthContextImpl instance,
) => <String, dynamic>{
  'recoveryScore': instance.recoveryScore,
  'recoveryState': instance.recoveryState,
  'strainScore': instance.strainScore,
  'sleepDuration': instance.sleepDuration,
  'sleepQuality': instance.sleepQuality,
  'hrv': instance.hrv,
  'restingHR': instance.restingHR,
  'hrvBaseline': instance.hrvBaseline,
  'rhrBaseline': instance.rhrBaseline,
  'steps': instance.steps,
  'activeEnergy': instance.activeEnergy,
  'moodEnergy': instance.moodEnergy,
  'stress': instance.stress,
  'hunger': instance.hunger,
  'weight': instance.weight,
  'lastHealthKitSync': instance.lastHealthKitSync?.toIso8601String(),
};

_$AiBrainTrendsContextImpl _$$AiBrainTrendsContextImplFromJson(
  Map<String, dynamic> json,
) => _$AiBrainTrendsContextImpl(
  recoveryScores:
      (json['recoveryScores'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const [],
  strainScores:
      (json['strainScores'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList() ??
      const [],
  sleepDurations:
      (json['sleepDurations'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList() ??
      const [],
  hrvValues:
      (json['hrvValues'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const [],
  rhrValues:
      (json['rhrValues'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const [],
  stepsValues:
      (json['stepsValues'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const [],
  weights:
      (json['weights'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList() ??
      const [],
  avgRecovery: (json['avgRecovery'] as num?)?.toDouble(),
  avgStrain: (json['avgStrain'] as num?)?.toDouble(),
  avgSleep: (json['avgSleep'] as num?)?.toDouble(),
  avgHrv: (json['avgHrv'] as num?)?.toDouble(),
  avgRhr: (json['avgRhr'] as num?)?.toDouble(),
  recoveryTrend: json['recoveryTrend'] as String? ?? 'stable',
  strainTrend: json['strainTrend'] as String? ?? 'stable',
  sleepTrend: json['sleepTrend'] as String? ?? 'stable',
);

Map<String, dynamic> _$$AiBrainTrendsContextImplToJson(
  _$AiBrainTrendsContextImpl instance,
) => <String, dynamic>{
  'recoveryScores': instance.recoveryScores,
  'strainScores': instance.strainScores,
  'sleepDurations': instance.sleepDurations,
  'hrvValues': instance.hrvValues,
  'rhrValues': instance.rhrValues,
  'stepsValues': instance.stepsValues,
  'weights': instance.weights,
  'avgRecovery': instance.avgRecovery,
  'avgStrain': instance.avgStrain,
  'avgSleep': instance.avgSleep,
  'avgHrv': instance.avgHrv,
  'avgRhr': instance.avgRhr,
  'recoveryTrend': instance.recoveryTrend,
  'strainTrend': instance.strainTrend,
  'sleepTrend': instance.sleepTrend,
};

_$AiBrainNutritionContextImpl _$$AiBrainNutritionContextImplFromJson(
  Map<String, dynamic> json,
) => _$AiBrainNutritionContextImpl(
  caloriesConsumed: (json['caloriesConsumed'] as num?)?.toInt() ?? 0,
  proteinConsumed: (json['proteinConsumed'] as num?)?.toInt() ?? 0,
  carbsConsumed: (json['carbsConsumed'] as num?)?.toInt() ?? 0,
  fatConsumed: (json['fatConsumed'] as num?)?.toInt() ?? 0,
  caloriesTarget: (json['caloriesTarget'] as num?)?.toInt() ?? 2000,
  proteinTarget: (json['proteinTarget'] as num?)?.toInt() ?? 120,
  mealsLoggedToday: (json['mealsLoggedToday'] as num?)?.toInt() ?? 0,
  isInEatingWindow: json['isInEatingWindow'] as bool? ?? true,
  minutesUntilWindowChange: (json['minutesUntilWindowChange'] as num?)?.toInt(),
  lastMealTime: json['lastMealTime'] == null
      ? null
      : DateTime.parse(json['lastMealTime'] as String),
);

Map<String, dynamic> _$$AiBrainNutritionContextImplToJson(
  _$AiBrainNutritionContextImpl instance,
) => <String, dynamic>{
  'caloriesConsumed': instance.caloriesConsumed,
  'proteinConsumed': instance.proteinConsumed,
  'carbsConsumed': instance.carbsConsumed,
  'fatConsumed': instance.fatConsumed,
  'caloriesTarget': instance.caloriesTarget,
  'proteinTarget': instance.proteinTarget,
  'mealsLoggedToday': instance.mealsLoggedToday,
  'isInEatingWindow': instance.isInEatingWindow,
  'minutesUntilWindowChange': instance.minutesUntilWindowChange,
  'lastMealTime': instance.lastMealTime?.toIso8601String(),
};

_$AiBrainPlansContextImpl _$$AiBrainPlansContextImplFromJson(
  Map<String, dynamic> json,
) => _$AiBrainPlansContextImpl(
  mealPlan: json['mealPlan'] == null
      ? null
      : AiBrainMealPlanSummary.fromJson(
          json['mealPlan'] as Map<String, dynamic>,
        ),
  workoutPlan: json['workoutPlan'] == null
      ? null
      : AiBrainWorkoutPlanSummary.fromJson(
          json['workoutPlan'] as Map<String, dynamic>,
        ),
  pendingChanges:
      (json['pendingChanges'] as List<dynamic>?)
          ?.map((e) => AiBrainPendingChange.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  masterPlanStatus: json['masterPlanStatus'] as String?,
  masterPlanId: json['masterPlanId'] as String?,
);

Map<String, dynamic> _$$AiBrainPlansContextImplToJson(
  _$AiBrainPlansContextImpl instance,
) => <String, dynamic>{
  'mealPlan': instance.mealPlan,
  'workoutPlan': instance.workoutPlan,
  'pendingChanges': instance.pendingChanges,
  'masterPlanStatus': instance.masterPlanStatus,
  'masterPlanId': instance.masterPlanId,
};

_$AiBrainMealPlanSummaryImpl _$$AiBrainMealPlanSummaryImplFromJson(
  Map<String, dynamic> json,
) => _$AiBrainMealPlanSummaryImpl(
  planId: json['planId'] as String,
  weekStartDate: DateTime.parse(json['weekStartDate'] as String),
  todayCaloriesPlanned: (json['todayCaloriesPlanned'] as num?)?.toInt() ?? 0,
  todayProteinPlanned: (json['todayProteinPlanned'] as num?)?.toInt() ?? 0,
  todayMeals:
      (json['todayMeals'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  weeklyCaloriesTotal: (json['weeklyCaloriesTotal'] as num?)?.toInt() ?? 0,
  weeklyProteinTotal: (json['weeklyProteinTotal'] as num?)?.toInt() ?? 0,
  approvalStatus: json['approvalStatus'] as String? ?? 'pending',
);

Map<String, dynamic> _$$AiBrainMealPlanSummaryImplToJson(
  _$AiBrainMealPlanSummaryImpl instance,
) => <String, dynamic>{
  'planId': instance.planId,
  'weekStartDate': instance.weekStartDate.toIso8601String(),
  'todayCaloriesPlanned': instance.todayCaloriesPlanned,
  'todayProteinPlanned': instance.todayProteinPlanned,
  'todayMeals': instance.todayMeals,
  'weeklyCaloriesTotal': instance.weeklyCaloriesTotal,
  'weeklyProteinTotal': instance.weeklyProteinTotal,
  'approvalStatus': instance.approvalStatus,
};

_$AiBrainWorkoutPlanSummaryImpl _$$AiBrainWorkoutPlanSummaryImplFromJson(
  Map<String, dynamic> json,
) => _$AiBrainWorkoutPlanSummaryImpl(
  planId: json['planId'] as String,
  weekStartDate: DateTime.parse(json['weekStartDate'] as String),
  todayWorkoutType: json['todayWorkoutType'] as String?,
  todayWorkoutDuration: (json['todayWorkoutDuration'] as num?)?.toInt(),
  todayWorkoutIntensity: (json['todayWorkoutIntensity'] as num?)?.toInt(),
  todayExercises:
      (json['todayExercises'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  isTodayRestDay: json['isTodayRestDay'] as bool? ?? false,
  workoutDaysCount: (json['workoutDaysCount'] as num?)?.toInt() ?? 0,
  totalWorkoutMinutes: (json['totalWorkoutMinutes'] as num?)?.toInt() ?? 0,
  estimatedCaloriesBurn: (json['estimatedCaloriesBurn'] as num?)?.toInt() ?? 0,
  approvalStatus: json['approvalStatus'] as String? ?? 'pending',
);

Map<String, dynamic> _$$AiBrainWorkoutPlanSummaryImplToJson(
  _$AiBrainWorkoutPlanSummaryImpl instance,
) => <String, dynamic>{
  'planId': instance.planId,
  'weekStartDate': instance.weekStartDate.toIso8601String(),
  'todayWorkoutType': instance.todayWorkoutType,
  'todayWorkoutDuration': instance.todayWorkoutDuration,
  'todayWorkoutIntensity': instance.todayWorkoutIntensity,
  'todayExercises': instance.todayExercises,
  'isTodayRestDay': instance.isTodayRestDay,
  'workoutDaysCount': instance.workoutDaysCount,
  'totalWorkoutMinutes': instance.totalWorkoutMinutes,
  'estimatedCaloriesBurn': instance.estimatedCaloriesBurn,
  'approvalStatus': instance.approvalStatus,
};

_$AiBrainPendingChangeImpl _$$AiBrainPendingChangeImplFromJson(
  Map<String, dynamic> json,
) => _$AiBrainPendingChangeImpl(
  id: json['id'] as String,
  type: json['type'] as String,
  description: json['description'] as String,
  descriptionAr: json['descriptionAr'] as String?,
  source: json['source'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  impactScore: (json['impactScore'] as num?)?.toInt() ?? 50,
);

Map<String, dynamic> _$$AiBrainPendingChangeImplToJson(
  _$AiBrainPendingChangeImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'description': instance.description,
  'descriptionAr': instance.descriptionAr,
  'source': instance.source,
  'createdAt': instance.createdAt.toIso8601String(),
  'impactScore': instance.impactScore,
};

_$AiBrainChatMessageImpl _$$AiBrainChatMessageImplFromJson(
  Map<String, dynamic> json,
) => _$AiBrainChatMessageImpl(
  role: json['role'] as String,
  content: json['content'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  contextTag: json['contextTag'] as String?,
);

Map<String, dynamic> _$$AiBrainChatMessageImplToJson(
  _$AiBrainChatMessageImpl instance,
) => <String, dynamic>{
  'role': instance.role,
  'content': instance.content,
  'createdAt': instance.createdAt.toIso8601String(),
  'contextTag': instance.contextTag,
};

_$AiBrainAlertImpl _$$AiBrainAlertImplFromJson(Map<String, dynamic> json) =>
    _$AiBrainAlertImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      titleAr: json['titleAr'] as String?,
      messageAr: json['messageAr'] as String?,
      priority: json['priority'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      isDismissed: json['isDismissed'] as bool? ?? false,
    );

Map<String, dynamic> _$$AiBrainAlertImplToJson(_$AiBrainAlertImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'message': instance.message,
      'titleAr': instance.titleAr,
      'messageAr': instance.messageAr,
      'priority': instance.priority,
      'createdAt': instance.createdAt.toIso8601String(),
      'isDismissed': instance.isDismissed,
    };

_$AiBrainSyncStatusImpl _$$AiBrainSyncStatusImplFromJson(
  Map<String, dynamic> json,
) => _$AiBrainSyncStatusImpl(
  lastHealthKitSync: json['lastHealthKitSync'] == null
      ? null
      : DateTime.parse(json['lastHealthKitSync'] as String),
  lastMealSync: json['lastMealSync'] == null
      ? null
      : DateTime.parse(json['lastMealSync'] as String),
  lastWorkoutSync: json['lastWorkoutSync'] == null
      ? null
      : DateTime.parse(json['lastWorkoutSync'] as String),
  lastPlanSync: json['lastPlanSync'] == null
      ? null
      : DateTime.parse(json['lastPlanSync'] as String),
  lastChatSync: json['lastChatSync'] == null
      ? null
      : DateTime.parse(json['lastChatSync'] as String),
);

Map<String, dynamic> _$$AiBrainSyncStatusImplToJson(
  _$AiBrainSyncStatusImpl instance,
) => <String, dynamic>{
  'lastHealthKitSync': instance.lastHealthKitSync?.toIso8601String(),
  'lastMealSync': instance.lastMealSync?.toIso8601String(),
  'lastWorkoutSync': instance.lastWorkoutSync?.toIso8601String(),
  'lastPlanSync': instance.lastPlanSync?.toIso8601String(),
  'lastChatSync': instance.lastChatSync?.toIso8601String(),
};

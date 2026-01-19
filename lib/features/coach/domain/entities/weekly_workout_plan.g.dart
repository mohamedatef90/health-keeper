// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_workout_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeeklyWorkoutPlanImpl _$$WeeklyWorkoutPlanImplFromJson(
  Map<String, dynamic> json,
) => _$WeeklyWorkoutPlanImpl(
  id: json['id'] as String,
  weekStartDate: DateTime.parse(json['weekStartDate'] as String),
  generatedAt: DateTime.parse(json['generatedAt'] as String),
  monday: json['monday'] == null
      ? null
      : AiDailyWorkout.fromJson(json['monday'] as Map<String, dynamic>),
  tuesday: json['tuesday'] == null
      ? null
      : AiDailyWorkout.fromJson(json['tuesday'] as Map<String, dynamic>),
  wednesday: json['wednesday'] == null
      ? null
      : AiDailyWorkout.fromJson(json['wednesday'] as Map<String, dynamic>),
  thursday: json['thursday'] == null
      ? null
      : AiDailyWorkout.fromJson(json['thursday'] as Map<String, dynamic>),
  friday: json['friday'] == null
      ? null
      : AiDailyWorkout.fromJson(json['friday'] as Map<String, dynamic>),
  saturday: json['saturday'] == null
      ? null
      : AiDailyWorkout.fromJson(json['saturday'] as Map<String, dynamic>),
  sunday: json['sunday'] == null
      ? null
      : AiDailyWorkout.fromJson(json['sunday'] as Map<String, dynamic>),
  totalEstimatedCaloriesBurn:
      (json['totalEstimatedCaloriesBurn'] as num?)?.toInt() ?? 0,
  totalWorkoutMinutes: (json['totalWorkoutMinutes'] as num?)?.toInt() ?? 0,
  workoutDaysCount: (json['workoutDaysCount'] as num?)?.toInt() ?? 0,
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
  linkedMealPlanId: json['linkedMealPlanId'] as String?,
  fitnessGoals:
      (json['fitnessGoals'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  equipmentRequired:
      (json['equipmentRequired'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$$WeeklyWorkoutPlanImplToJson(
  _$WeeklyWorkoutPlanImpl instance,
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
  'totalEstimatedCaloriesBurn': instance.totalEstimatedCaloriesBurn,
  'totalWorkoutMinutes': instance.totalWorkoutMinutes,
  'workoutDaysCount': instance.workoutDaysCount,
  'recoveryScoreAtGeneration': instance.recoveryScoreAtGeneration,
  'strainScoreAtGeneration': instance.strainScoreAtGeneration,
  'isAiGenerated': instance.isAiGenerated,
  'coachingNote': instance.coachingNote,
  'coachingNoteAr': instance.coachingNoteAr,
  'approvalStatus': _$PlanApprovalStatusEnumMap[instance.approvalStatus]!,
  'linkedMealPlanId': instance.linkedMealPlanId,
  'fitnessGoals': instance.fitnessGoals,
  'equipmentRequired': instance.equipmentRequired,
};

const _$PlanApprovalStatusEnumMap = {
  PlanApprovalStatus.pending: 'pending',
  PlanApprovalStatus.approved: 'approved',
  PlanApprovalStatus.rejected: 'rejected',
  PlanApprovalStatus.modified: 'modified',
};

_$AiDailyWorkoutImpl _$$AiDailyWorkoutImplFromJson(
  Map<String, dynamic> json,
) => _$AiDailyWorkoutImpl(
  workoutTemplateId: json['workoutTemplateId'] as String?,
  workoutName: json['workoutName'] as String,
  workoutNameAr: json['workoutNameAr'] as String?,
  category: json['category'] as String,
  estimatedMinutes: (json['estimatedMinutes'] as num).toInt(),
  estimatedCaloriesBurn: (json['estimatedCaloriesBurn'] as num).toInt(),
  suggestedIntensity: (json['suggestedIntensity'] as num?)?.toInt() ?? 3,
  timeOfDay: json['timeOfDay'] as String?,
  timeOfDayAr: json['timeOfDayAr'] as String?,
  targetMuscleGroups:
      (json['targetMuscleGroups'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  equipment:
      (json['equipment'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  isRestDay: json['isRestDay'] as bool? ?? false,
  description: json['description'] as String?,
  descriptionAr: json['descriptionAr'] as String?,
  notes: json['notes'] as String?,
  exercises:
      (json['exercises'] as List<dynamic>?)
          ?.map((e) => AiWorkoutExercise.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  warmup:
      (json['warmup'] as List<dynamic>?)
          ?.map((e) => AiWorkoutExercise.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  cooldown:
      (json['cooldown'] as List<dynamic>?)
          ?.map((e) => AiWorkoutExercise.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$AiDailyWorkoutImplToJson(
  _$AiDailyWorkoutImpl instance,
) => <String, dynamic>{
  'workoutTemplateId': instance.workoutTemplateId,
  'workoutName': instance.workoutName,
  'workoutNameAr': instance.workoutNameAr,
  'category': instance.category,
  'estimatedMinutes': instance.estimatedMinutes,
  'estimatedCaloriesBurn': instance.estimatedCaloriesBurn,
  'suggestedIntensity': instance.suggestedIntensity,
  'timeOfDay': instance.timeOfDay,
  'timeOfDayAr': instance.timeOfDayAr,
  'targetMuscleGroups': instance.targetMuscleGroups,
  'equipment': instance.equipment,
  'isRestDay': instance.isRestDay,
  'description': instance.description,
  'descriptionAr': instance.descriptionAr,
  'notes': instance.notes,
  'exercises': instance.exercises,
  'warmup': instance.warmup,
  'cooldown': instance.cooldown,
};

_$AiWorkoutExerciseImpl _$$AiWorkoutExerciseImplFromJson(
  Map<String, dynamic> json,
) => _$AiWorkoutExerciseImpl(
  exerciseId: json['exerciseId'] as String?,
  name: json['name'] as String,
  nameAr: json['nameAr'] as String?,
  muscleGroup: json['muscleGroup'] as String?,
  sets: (json['sets'] as num).toInt(),
  reps: (json['reps'] as num?)?.toInt(),
  durationSeconds: (json['durationSeconds'] as num?)?.toInt(),
  restSeconds: (json['restSeconds'] as num?)?.toInt() ?? 60,
  suggestedWeight: json['suggestedWeight'] as String?,
  suggestedWeightAr: json['suggestedWeightAr'] as String?,
  instruction: json['instruction'] as String?,
  instructionAr: json['instructionAr'] as String?,
  order: (json['order'] as num?)?.toInt() ?? 0,
  isSupersetWithNext: json['isSupersetWithNext'] as bool? ?? false,
  equipment: json['equipment'] as String?,
);

Map<String, dynamic> _$$AiWorkoutExerciseImplToJson(
  _$AiWorkoutExerciseImpl instance,
) => <String, dynamic>{
  'exerciseId': instance.exerciseId,
  'name': instance.name,
  'nameAr': instance.nameAr,
  'muscleGroup': instance.muscleGroup,
  'sets': instance.sets,
  'reps': instance.reps,
  'durationSeconds': instance.durationSeconds,
  'restSeconds': instance.restSeconds,
  'suggestedWeight': instance.suggestedWeight,
  'suggestedWeightAr': instance.suggestedWeightAr,
  'instruction': instance.instruction,
  'instructionAr': instance.instructionAr,
  'order': instance.order,
  'isSupersetWithNext': instance.isSupersetWithNext,
  'equipment': instance.equipment,
};

_$WeeklyWorkoutPlanContextImpl _$$WeeklyWorkoutPlanContextImplFromJson(
  Map<String, dynamic> json,
) => _$WeeklyWorkoutPlanContextImpl(
  weekStartDate: DateTime.parse(json['weekStartDate'] as String),
  recoveryScore: (json['recoveryScore'] as num?)?.toInt(),
  strainScore: (json['strainScore'] as num?)?.toDouble(),
  targetWorkoutDays: (json['targetWorkoutDays'] as num?)?.toInt() ?? 4,
  fitnessGoals:
      (json['fitnessGoals'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const ['strength', 'fitness'],
  availableEquipment:
      (json['availableEquipment'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const ['full_gym'],
  constraints:
      (json['constraints'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  preferredWorkoutTypes:
      (json['preferredWorkoutTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  mealPlan: json['mealPlan'] == null
      ? null
      : MealPlanSummary.fromJson(json['mealPlan'] as Map<String, dynamic>),
  language: json['language'] as String? ?? 'ar',
);

Map<String, dynamic> _$$WeeklyWorkoutPlanContextImplToJson(
  _$WeeklyWorkoutPlanContextImpl instance,
) => <String, dynamic>{
  'weekStartDate': instance.weekStartDate.toIso8601String(),
  'recoveryScore': instance.recoveryScore,
  'strainScore': instance.strainScore,
  'targetWorkoutDays': instance.targetWorkoutDays,
  'fitnessGoals': instance.fitnessGoals,
  'availableEquipment': instance.availableEquipment,
  'constraints': instance.constraints,
  'preferredWorkoutTypes': instance.preferredWorkoutTypes,
  'mealPlan': instance.mealPlan,
  'language': instance.language,
};

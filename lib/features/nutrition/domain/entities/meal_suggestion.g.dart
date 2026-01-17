// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_suggestion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MealSuggestionImpl _$$MealSuggestionImplFromJson(Map<String, dynamic> json) =>
    _$MealSuggestionImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      nameEn: json['nameEn'] as String,
      calories: (json['calories'] as num).toInt(),
      protein: (json['protein'] as num).toInt(),
      carbs: (json['carbs'] as num).toInt(),
      fat: (json['fat'] as num).toInt(),
      category: json['category'] as String,
      servingSize: json['servingSize'] as String?,
      reasoning: json['reasoning'] as String?,
      fitScore: (json['fitScore'] as num?)?.toInt() ?? 0,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      isHighProtein: json['isHighProtein'] as bool? ?? false,
      isVegetarian: json['isVegetarian'] as bool? ?? false,
      isLowCarb: json['isLowCarb'] as bool? ?? false,
      isAiGenerated: json['isAiGenerated'] as bool? ?? false,
      confidence: (json['confidence'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MealSuggestionImplToJson(
  _$MealSuggestionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'nameEn': instance.nameEn,
  'calories': instance.calories,
  'protein': instance.protein,
  'carbs': instance.carbs,
  'fat': instance.fat,
  'category': instance.category,
  'servingSize': instance.servingSize,
  'reasoning': instance.reasoning,
  'fitScore': instance.fitScore,
  'tags': instance.tags,
  'isHighProtein': instance.isHighProtein,
  'isVegetarian': instance.isVegetarian,
  'isLowCarb': instance.isLowCarb,
  'isAiGenerated': instance.isAiGenerated,
  'confidence': instance.confidence,
};

_$DailyMealPlanImpl _$$DailyMealPlanImplFromJson(Map<String, dynamic> json) =>
    _$DailyMealPlanImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      generatedAt: DateTime.parse(json['generatedAt'] as String),
      targetCalories: (json['targetCalories'] as num).toInt(),
      targetProtein: (json['targetProtein'] as num).toInt(),
      breakfast: json['breakfast'] == null
          ? null
          : MealSuggestion.fromJson(json['breakfast'] as Map<String, dynamic>),
      lunch: json['lunch'] == null
          ? null
          : MealSuggestion.fromJson(json['lunch'] as Map<String, dynamic>),
      dinner: json['dinner'] == null
          ? null
          : MealSuggestion.fromJson(json['dinner'] as Map<String, dynamic>),
      snacks:
          (json['snacks'] as List<dynamic>?)
              ?.map((e) => MealSuggestion.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalCalories: (json['totalCalories'] as num?)?.toInt() ?? 0,
      totalProtein: (json['totalProtein'] as num?)?.toInt() ?? 0,
      totalCarbs: (json['totalCarbs'] as num?)?.toInt() ?? 0,
      totalFat: (json['totalFat'] as num?)?.toInt() ?? 0,
      overallFitScore: (json['overallFitScore'] as num?)?.toInt() ?? 0,
      coachingNote: json['coachingNote'] as String?,
      isAiGenerated: json['isAiGenerated'] as bool? ?? false,
      confidence: (json['confidence'] as num?)?.toInt(),
      dietaryRestrictions:
          (json['dietaryRestrictions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$DailyMealPlanImplToJson(_$DailyMealPlanImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'generatedAt': instance.generatedAt.toIso8601String(),
      'targetCalories': instance.targetCalories,
      'targetProtein': instance.targetProtein,
      'breakfast': instance.breakfast,
      'lunch': instance.lunch,
      'dinner': instance.dinner,
      'snacks': instance.snacks,
      'totalCalories': instance.totalCalories,
      'totalProtein': instance.totalProtein,
      'totalCarbs': instance.totalCarbs,
      'totalFat': instance.totalFat,
      'overallFitScore': instance.overallFitScore,
      'coachingNote': instance.coachingNote,
      'isAiGenerated': instance.isAiGenerated,
      'confidence': instance.confidence,
      'dietaryRestrictions': instance.dietaryRestrictions,
    };

_$MealSuggestionContextImpl _$$MealSuggestionContextImplFromJson(
  Map<String, dynamic> json,
) => _$MealSuggestionContextImpl(
  targetCalories: (json['targetCalories'] as num).toInt(),
  targetProtein: (json['targetProtein'] as num).toInt(),
  mealType: json['mealType'] as String,
  dietaryRestrictions:
      (json['dietaryRestrictions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  preferEgyptian: json['preferEgyptian'] as bool? ?? true,
  remainingCalories: (json['remainingCalories'] as num?)?.toInt(),
  remainingProtein: (json['remainingProtein'] as num?)?.toInt(),
  mealsConsumedToday:
      (json['mealsConsumedToday'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  timeOfDay: json['timeOfDay'] as String?,
  preferHighProtein: json['preferHighProtein'] as bool? ?? false,
  preferVegetarian: json['preferVegetarian'] as bool? ?? false,
  preferLowCarb: json['preferLowCarb'] as bool? ?? false,
  isRamadan: json['isRamadan'] as bool? ?? false,
  language: json['language'] as String? ?? 'ar',
);

Map<String, dynamic> _$$MealSuggestionContextImplToJson(
  _$MealSuggestionContextImpl instance,
) => <String, dynamic>{
  'targetCalories': instance.targetCalories,
  'targetProtein': instance.targetProtein,
  'mealType': instance.mealType,
  'dietaryRestrictions': instance.dietaryRestrictions,
  'preferEgyptian': instance.preferEgyptian,
  'remainingCalories': instance.remainingCalories,
  'remainingProtein': instance.remainingProtein,
  'mealsConsumedToday': instance.mealsConsumedToday,
  'timeOfDay': instance.timeOfDay,
  'preferHighProtein': instance.preferHighProtein,
  'preferVegetarian': instance.preferVegetarian,
  'preferLowCarb': instance.preferLowCarb,
  'isRamadan': instance.isRamadan,
  'language': instance.language,
};

_$DailyMealPlanContextImpl _$$DailyMealPlanContextImplFromJson(
  Map<String, dynamic> json,
) => _$DailyMealPlanContextImpl(
  targetCalories: (json['targetCalories'] as num).toInt(),
  targetProtein: (json['targetProtein'] as num).toInt(),
  dietaryRestrictions:
      (json['dietaryRestrictions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  preferEgyptian: json['preferEgyptian'] as bool? ?? true,
  eatingWindowStart: json['eatingWindowStart'] as String?,
  eatingWindowEnd: json['eatingWindowEnd'] as String?,
  mealsPerDay: (json['mealsPerDay'] as num?)?.toInt() ?? 3,
  includeSnacks: json['includeSnacks'] as bool? ?? true,
  preferHighProtein: json['preferHighProtein'] as bool? ?? false,
  preferVegetarian: json['preferVegetarian'] as bool? ?? false,
  preferLowCarb: json['preferLowCarb'] as bool? ?? false,
  recoveryScore: (json['recoveryScore'] as num?)?.toInt(),
  hasWorkoutToday: json['hasWorkoutToday'] as bool? ?? false,
  workoutType: json['workoutType'] as String?,
  isRamadan: json['isRamadan'] as bool? ?? false,
  language: json['language'] as String? ?? 'ar',
);

Map<String, dynamic> _$$DailyMealPlanContextImplToJson(
  _$DailyMealPlanContextImpl instance,
) => <String, dynamic>{
  'targetCalories': instance.targetCalories,
  'targetProtein': instance.targetProtein,
  'dietaryRestrictions': instance.dietaryRestrictions,
  'preferEgyptian': instance.preferEgyptian,
  'eatingWindowStart': instance.eatingWindowStart,
  'eatingWindowEnd': instance.eatingWindowEnd,
  'mealsPerDay': instance.mealsPerDay,
  'includeSnacks': instance.includeSnacks,
  'preferHighProtein': instance.preferHighProtein,
  'preferVegetarian': instance.preferVegetarian,
  'preferLowCarb': instance.preferLowCarb,
  'recoveryScore': instance.recoveryScore,
  'hasWorkoutToday': instance.hasWorkoutToday,
  'workoutType': instance.workoutType,
  'isRamadan': instance.isRamadan,
  'language': instance.language,
};

_$UserGoalsImpl _$$UserGoalsImplFromJson(Map<String, dynamic> json) =>
    _$UserGoalsImpl(
      dailyCalories: (json['dailyCalories'] as num).toInt(),
      dailyProtein: (json['dailyProtein'] as num).toInt(),
      targetWeight: (json['targetWeight'] as num?)?.toDouble(),
      goalType: json['goalType'] as String? ?? 'maintain',
      dietaryRestrictions:
          (json['dietaryRestrictions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      allergies:
          (json['allergies'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      preferredCuisines:
          (json['preferredCuisines'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const ['egyptian'],
    );

Map<String, dynamic> _$$UserGoalsImplToJson(_$UserGoalsImpl instance) =>
    <String, dynamic>{
      'dailyCalories': instance.dailyCalories,
      'dailyProtein': instance.dailyProtein,
      'targetWeight': instance.targetWeight,
      'goalType': instance.goalType,
      'dietaryRestrictions': instance.dietaryRestrictions,
      'allergies': instance.allergies,
      'preferredCuisines': instance.preferredCuisines,
    };

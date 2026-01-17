import 'package:talker/talker.dart';
import 'package:uuid/uuid.dart';

import '../../features/nutrition/data/egyptian_meals_data.dart';
import '../../features/nutrition/domain/entities/meal_suggestion.dart';
import 'gemini_coach_service.dart';

/// Service for AI-powered diet suggestions
///
/// Combines local Egyptian meal database with Gemini AI for personalized
/// meal recommendations based on user's nutritional goals.
abstract class DietSuggestionService {
  /// Suggest meals based on user's requirements
  ///
  /// [context] contains target calories, protein, meal type, and preferences
  /// Returns a list of [MealSuggestion] ranked by fit score
  Future<List<MealSuggestion>> suggestMeals(MealSuggestionContext context);

  /// Generate a complete daily meal plan
  ///
  /// [context] contains daily targets, preferences, and constraints
  /// Returns a [DailyMealPlan] with breakfast, lunch, dinner, and snacks
  Future<DailyMealPlan> generateDailyPlan(DailyMealPlanContext context);

  /// Get AI-enhanced suggestions for a specific meal
  ///
  /// Uses Gemini to provide personalized recommendations beyond the database
  Future<List<MealSuggestion>> getAiEnhancedSuggestions(
    MealSuggestionContext context,
  );

  /// Get meal suggestions for remaining macros
  ///
  /// Useful for "what should I eat to hit my targets" scenarios
  Future<List<MealSuggestion>> suggestForRemainingMacros({
    required int remainingCalories,
    required int remainingProtein,
    required String mealType,
    List<String> dietaryRestrictions,
  });
}

/// Implementation of DietSuggestionService
class DietSuggestionServiceImpl implements DietSuggestionService {
  final GeminiCoachService _geminiService;
  final Talker _talker;
  final Uuid _uuid = const Uuid();

  DietSuggestionServiceImpl({
    required GeminiCoachService geminiService,
    required Talker talker,
  })  : _geminiService = geminiService,
        _talker = talker;

  @override
  Future<List<MealSuggestion>> suggestMeals(
    MealSuggestionContext context,
  ) async {
    try {
      // Get local database suggestions first
      final localSuggestions = _getLocalSuggestions(context);

      // Score and sort suggestions
      final scoredSuggestions = localSuggestions.map((meal) {
        final score = _calculateFitScore(meal, context);
        return meal.copyWith(fitScore: score);
      }).toList();

      scoredSuggestions.sort((a, b) => b.fitScore.compareTo(a.fitScore));

      // Return top 10 suggestions
      return scoredSuggestions.take(10).toList();
    } catch (e, st) {
      _talker.error('Failed to suggest meals', e, st);
      return [];
    }
  }

  @override
  Future<DailyMealPlan> generateDailyPlan(
    DailyMealPlanContext context,
  ) async {
    try {
      // Calculate per-meal targets
      final mealsCount = context.mealsPerDay;
      final snacksCount = context.includeSnacks ? 2 : 0;
      final totalMealSlots = mealsCount + snacksCount;

      // Distribute calories and protein
      final breakfastCalories = (context.targetCalories * 0.25).round();
      final lunchCalories = (context.targetCalories * 0.35).round();
      final dinnerCalories = (context.targetCalories * 0.25).round();
      final snackCalories =
          (context.targetCalories * 0.15 / (snacksCount > 0 ? snacksCount : 1))
              .round();

      final breakfastProtein = (context.targetProtein * 0.25).round();
      final lunchProtein = (context.targetProtein * 0.35).round();
      final dinnerProtein = (context.targetProtein * 0.25).round();
      final snackProtein =
          (context.targetProtein * 0.15 / (snacksCount > 0 ? snacksCount : 1))
              .round();

      // Get suggestions for each meal
      final breakfast = await _getBestMealForSlot(
        context: MealSuggestionContext(
          targetCalories: breakfastCalories,
          targetProtein: breakfastProtein,
          mealType: 'breakfast',
          dietaryRestrictions: context.dietaryRestrictions,
          preferEgyptian: context.preferEgyptian,
          preferHighProtein: context.preferHighProtein,
          preferVegetarian: context.preferVegetarian,
          preferLowCarb: context.preferLowCarb,
          isRamadan: context.isRamadan,
          language: context.language,
        ),
      );

      final lunch = await _getBestMealForSlot(
        context: MealSuggestionContext(
          targetCalories: lunchCalories,
          targetProtein: lunchProtein,
          mealType: 'lunch',
          dietaryRestrictions: context.dietaryRestrictions,
          preferEgyptian: context.preferEgyptian,
          preferHighProtein: context.preferHighProtein,
          preferVegetarian: context.preferVegetarian,
          preferLowCarb: context.preferLowCarb,
          isRamadan: context.isRamadan,
          language: context.language,
        ),
      );

      final dinner = await _getBestMealForSlot(
        context: MealSuggestionContext(
          targetCalories: dinnerCalories,
          targetProtein: dinnerProtein,
          mealType: 'dinner',
          dietaryRestrictions: context.dietaryRestrictions,
          preferEgyptian: context.preferEgyptian,
          preferHighProtein: context.preferHighProtein,
          preferVegetarian: context.preferVegetarian,
          preferLowCarb: context.preferLowCarb,
          isRamadan: context.isRamadan,
          language: context.language,
        ),
      );

      // Get snacks if needed
      final snacks = <MealSuggestion>[];
      if (context.includeSnacks) {
        for (var i = 0; i < snacksCount; i++) {
          final snack = await _getBestMealForSlot(
            context: MealSuggestionContext(
              targetCalories: snackCalories,
              targetProtein: snackProtein,
              mealType: 'snack',
              dietaryRestrictions: context.dietaryRestrictions,
              preferEgyptian: context.preferEgyptian,
              preferHighProtein: context.preferHighProtein,
              preferVegetarian: context.preferVegetarian,
              preferLowCarb: context.preferLowCarb,
              isRamadan: context.isRamadan,
              language: context.language,
            ),
          );
          if (snack != null) snacks.add(snack);
        }
      }

      // Calculate totals
      var totalCalories = 0;
      var totalProtein = 0;
      var totalCarbs = 0;
      var totalFat = 0;

      if (breakfast != null) {
        totalCalories += breakfast.calories;
        totalProtein += breakfast.protein;
        totalCarbs += breakfast.carbs;
        totalFat += breakfast.fat;
      }
      if (lunch != null) {
        totalCalories += lunch.calories;
        totalProtein += lunch.protein;
        totalCarbs += lunch.carbs;
        totalFat += lunch.fat;
      }
      if (dinner != null) {
        totalCalories += dinner.calories;
        totalProtein += dinner.protein;
        totalCarbs += dinner.carbs;
        totalFat += dinner.fat;
      }
      for (final snack in snacks) {
        totalCalories += snack.calories;
        totalProtein += snack.protein;
        totalCarbs += snack.carbs;
        totalFat += snack.fat;
      }

      // Calculate overall fit score
      final calorieDiff =
          (totalCalories - context.targetCalories).abs() / context.targetCalories;
      final proteinDiff =
          (totalProtein - context.targetProtein).abs() / context.targetProtein;
      final overallFitScore = ((1 - (calorieDiff + proteinDiff) / 2) * 100)
          .round()
          .clamp(0, 100);

      // Generate coaching note
      final coachingNote = _generateCoachingNote(
        totalCalories: totalCalories,
        totalProtein: totalProtein,
        targetCalories: context.targetCalories,
        targetProtein: context.targetProtein,
        hasWorkout: context.hasWorkoutToday,
        language: context.language,
      );

      return DailyMealPlan(
        id: _uuid.v4(),
        date: DateTime.now(),
        generatedAt: DateTime.now(),
        targetCalories: context.targetCalories,
        targetProtein: context.targetProtein,
        breakfast: breakfast,
        lunch: lunch,
        dinner: dinner,
        snacks: snacks,
        totalCalories: totalCalories,
        totalProtein: totalProtein,
        totalCarbs: totalCarbs,
        totalFat: totalFat,
        overallFitScore: overallFitScore,
        coachingNote: coachingNote,
        isAiGenerated: false,
        confidence: overallFitScore,
        dietaryRestrictions: context.dietaryRestrictions,
      );
    } catch (e, st) {
      _talker.error('Failed to generate daily plan', e, st);
      return _fallbackDailyPlan(context);
    }
  }

  @override
  Future<List<MealSuggestion>> getAiEnhancedSuggestions(
    MealSuggestionContext context,
  ) async {
    try {
      // First get local suggestions
      final localSuggestions = await suggestMeals(context);

      // Then enhance with AI
      final aiResult = await _geminiService.suggestEgyptianMeals(
        targetCalories: context.targetCalories,
        targetProtein: context.targetProtein,
        mealType: context.mealType,
        dietaryRestrictions: context.dietaryRestrictions,
        preferEgyptian: context.preferEgyptian,
        language: context.language,
      );

      // Combine and deduplicate
      final combined = <String, MealSuggestion>{};

      // Add AI suggestions first (they take priority)
      for (final suggestion in aiResult.suggestions) {
        final converted = _convertAiSuggestionToMealSuggestion(
          suggestion,
          context.mealType,
        );
        combined[suggestion.nameEn.toLowerCase()] = converted;
      }

      // Add local suggestions if not already present
      for (final suggestion in localSuggestions) {
        final key = suggestion.nameEn.toLowerCase();
        if (!combined.containsKey(key)) {
          combined[key] = suggestion;
        }
      }

      // Sort by fit score
      final result = combined.values.toList()
        ..sort((a, b) => b.fitScore.compareTo(a.fitScore));

      return result.take(10).toList();
    } catch (e, st) {
      _talker.error('Failed to get AI-enhanced suggestions', e, st);
      // Fall back to local suggestions
      return suggestMeals(context);
    }
  }

  /// Convert AI MealSuggestionData to MealSuggestion entity
  MealSuggestion _convertAiSuggestionToMealSuggestion(
    MealSuggestionData data,
    String category,
  ) {
    return MealSuggestion(
      id: _uuid.v4(),
      name: data.name,
      nameEn: data.nameEn,
      calories: data.calories,
      protein: data.protein,
      carbs: data.carbs,
      fat: data.fat,
      category: category,
      servingSize: data.servingSize,
      reasoning: data.reasoning,
      fitScore: data.fitScore,
      tags: data.tags,
      isHighProtein: data.isHighProtein,
      isVegetarian: data.isVegetarian,
      isLowCarb: data.isLowCarb,
      isAiGenerated: true,
      confidence: 75,
    );
  }

  @override
  Future<List<MealSuggestion>> suggestForRemainingMacros({
    required int remainingCalories,
    required int remainingProtein,
    required String mealType,
    List<String>? dietaryRestrictions,
  }) async {
    // Determine appropriate meal type based on remaining macros
    String effectiveMealType = mealType;
    if (remainingCalories < 200) {
      effectiveMealType = 'snack';
    }

    return suggestMeals(MealSuggestionContext(
      targetCalories: remainingCalories,
      targetProtein: remainingProtein,
      mealType: effectiveMealType,
      dietaryRestrictions: dietaryRestrictions ?? [],
      preferHighProtein: remainingProtein > 20,
    ));
  }

  // ============ PRIVATE HELPERS ============

  List<MealSuggestion> _getLocalSuggestions(MealSuggestionContext context) {
    var meals = EgyptianMealsData.getMealsByCategory(context.mealType);

    // Apply filters
    if (context.preferVegetarian) {
      meals = meals.where((m) => m.isVegetarian).toList();
    }
    if (context.preferLowCarb) {
      meals = meals.where((m) => m.isLowCarb).toList();
    }
    if (context.preferHighProtein) {
      meals = meals.where((m) => m.isHighProtein).toList();
    }

    // Convert to MealSuggestion entities
    return meals.map((meal) => _convertToMealSuggestion(meal)).toList();
  }

  MealSuggestion _convertToMealSuggestion(EgyptianMeal meal) {
    return MealSuggestion(
      id: _uuid.v4(),
      name: meal.name,
      nameEn: meal.nameEn,
      calories: meal.calories,
      protein: meal.protein,
      carbs: meal.carbs,
      fat: meal.fat,
      category: meal.category,
      servingSize: meal.servingSize,
      tags: meal.tags,
      isHighProtein: meal.isHighProtein,
      isVegetarian: meal.isVegetarian,
      isLowCarb: meal.isLowCarb,
      isAiGenerated: false,
    );
  }

  int _calculateFitScore(MealSuggestion meal, MealSuggestionContext context) {
    var score = 100;

    // Calorie fit (40% weight)
    final calorieDiff = (meal.calories - context.targetCalories).abs();
    final calorieScore = (1 - calorieDiff / context.targetCalories) * 40;
    score = (score + calorieScore).round().clamp(0, 100);

    // Protein fit (30% weight)
    final proteinDiff = (meal.protein - context.targetProtein).abs();
    final proteinScore = context.targetProtein > 0
        ? (1 - proteinDiff / context.targetProtein) * 30
        : 15; // Default if no protein target
    score = (score + proteinScore).round().clamp(0, 100);

    // Preference bonuses (30% weight)
    var preferenceBonus = 0;
    if (context.preferHighProtein && meal.isHighProtein) preferenceBonus += 10;
    if (context.preferVegetarian && meal.isVegetarian) preferenceBonus += 10;
    if (context.preferLowCarb && meal.isLowCarb) preferenceBonus += 10;
    score = (score + preferenceBonus).clamp(0, 100);

    return score;
  }

  Future<MealSuggestion?> _getBestMealForSlot({
    required MealSuggestionContext context,
  }) async {
    final suggestions = await suggestMeals(context);
    return suggestions.isNotEmpty ? suggestions.first : null;
  }

  String _generateCoachingNote({
    required int totalCalories,
    required int totalProtein,
    required int targetCalories,
    required int targetProtein,
    required bool hasWorkout,
    required String language,
  }) {
    final calorieDiff = totalCalories - targetCalories;
    final proteinDiff = totalProtein - targetProtein;

    if (language == 'ar') {
      if (calorieDiff.abs() <= targetCalories * 0.1 &&
          proteinDiff.abs() <= targetProtein * 0.1) {
        return hasWorkout
            ? 'خطة متوازنة ليوم التمرين. تناول وجبة خفيفة قبل التمرين بساعتين.'
            : 'خطة متوازنة تناسب أهدافك. حاول الالتزام بمواعيد الوجبات.';
      } else if (proteinDiff < 0) {
        return 'البروتين أقل من الهدف. يمكنك إضافة بيض مسلوق أو جبنة قريش.';
      } else if (calorieDiff > targetCalories * 0.1) {
        return 'السعرات أعلى قليلاً. يمكنك تقليل حجم الحصص أو اختيار بدائل أخف.';
      }
      return 'خطة جيدة. استمع لجسمك وعدّل حسب احتياجاتك.';
    } else {
      if (calorieDiff.abs() <= targetCalories * 0.1 &&
          proteinDiff.abs() <= targetProtein * 0.1) {
        return hasWorkout
            ? 'Balanced plan for your workout day. Have a light snack 2 hours before training.'
            : 'Balanced plan matching your goals. Try to stick to meal timing.';
      } else if (proteinDiff < 0) {
        return 'Protein is below target. Consider adding boiled eggs or cottage cheese.';
      } else if (calorieDiff > targetCalories * 0.1) {
        return 'Calories slightly high. You can reduce portions or choose lighter alternatives.';
      }
      return 'Good plan. Listen to your body and adjust as needed.';
    }
  }

  DailyMealPlan _fallbackDailyPlan(DailyMealPlanContext context) {
    return DailyMealPlan(
      id: _uuid.v4(),
      date: DateTime.now(),
      generatedAt: DateTime.now(),
      targetCalories: context.targetCalories,
      targetProtein: context.targetProtein,
      totalCalories: 0,
      totalProtein: 0,
      totalCarbs: 0,
      totalFat: 0,
      overallFitScore: 0,
      coachingNote: context.language == 'ar'
          ? 'تعذر إنشاء الخطة. يرجى المحاولة مرة أخرى.'
          : 'Could not generate plan. Please try again.',
      isAiGenerated: false,
      dietaryRestrictions: context.dietaryRestrictions,
    );
  }
}

/// Result from AI meal suggestion
class AiMealSuggestionResult {
  final List<MealSuggestion> suggestions;
  final String? reasoning;
  final int confidence;
  final bool isAiGenerated;

  AiMealSuggestionResult({
    required this.suggestions,
    this.reasoning,
    required this.confidence,
    this.isAiGenerated = true,
  });

  factory AiMealSuggestionResult.empty() => AiMealSuggestionResult(
        suggestions: [],
        confidence: 0,
        isAiGenerated: false,
      );
}

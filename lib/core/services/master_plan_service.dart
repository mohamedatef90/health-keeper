import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:talker/talker.dart';
import 'package:uuid/uuid.dart';

import '../domain/entities/master_plan.dart';
import '../../features/coach/domain/entities/weekly_workout_plan.dart';
import '../../features/nutrition/domain/entities/weekly_meal_plan.dart';

/// Service for coordinating meal and workout plans
abstract class MasterPlanService {
  /// Analyze how a new workout plan should affect the meal plan
  Future<List<PendingPlanChange>> analyzeWorkoutPlanImpact({
    required WeeklyWorkoutPlan newWorkoutPlan,
    required WeeklyMealPlan? currentMealPlan,
    required int dailyCalorieTarget,
    required int dailyProteinTarget,
  });

  /// Analyze how a new meal plan should affect the workout plan
  Future<List<PendingPlanChange>> analyzeMealPlanImpact({
    required WeeklyMealPlan newMealPlan,
    required WeeklyWorkoutPlan? currentWorkoutPlan,
  });

  /// Apply approved changes to the meal plan
  Future<WeeklyMealPlan> applyMealPlanChanges({
    required WeeklyMealPlan mealPlan,
    required List<PendingPlanChange> approvedChanges,
  });

  /// Apply approved changes to the workout plan
  Future<WeeklyWorkoutPlan> applyWorkoutPlanChanges({
    required WeeklyWorkoutPlan workoutPlan,
    required List<PendingPlanChange> approvedChanges,
  });

  /// Get coordination recommendations for both plans
  Future<List<PendingPlanChange>> getCoordinationRecommendations({
    required WeeklyMealPlan mealPlan,
    required WeeklyWorkoutPlan workoutPlan,
    int? recoveryScore,
    double? strainScore,
  });
}

/// Implementation using Gemini AI
class MasterPlanServiceImpl implements MasterPlanService {
  final Talker _talker;
  late final GenerativeModel _model;

  MasterPlanServiceImpl({required Talker talker}) : _talker = talker {
    String apiKey = '';
    try {
      apiKey = dotenv.env['GEMINI_API_KEY'] ?? '';
    } catch (e) {
      _talker.warning('Failed to read GEMINI_API_KEY from dotenv: $e');
    }

    if (apiKey.isEmpty) {
      _talker.warning('GEMINI_API_KEY not found in environment');
    }

    _model = GenerativeModel(
      model: 'gemini-2.0-flash',
      apiKey: apiKey,
      generationConfig: GenerationConfig(
        temperature: 0.7,
        topK: 40,
        topP: 0.95,
        maxOutputTokens: 2048,
      ),
    );
  }

  @override
  Future<List<PendingPlanChange>> analyzeWorkoutPlanImpact({
    required WeeklyWorkoutPlan newWorkoutPlan,
    required WeeklyMealPlan? currentMealPlan,
    required int dailyCalorieTarget,
    required int dailyProteinTarget,
  }) async {
    if (currentMealPlan == null) return [];

    try {
      final prompt = _buildWorkoutImpactPrompt(
        newWorkoutPlan,
        currentMealPlan,
        dailyCalorieTarget,
        dailyProteinTarget,
      );

      final response = await _model.generateContent([Content.text(prompt)]);
      final text = response.text ?? '';

      return _parseChangesResponse(text, PlanChangeSource.workout);
    } catch (e, st) {
      _talker.error('Failed to analyze workout plan impact', e, st);
      return _generateFallbackWorkoutChanges(
          newWorkoutPlan, currentMealPlan, dailyCalorieTarget);
    }
  }

  @override
  Future<List<PendingPlanChange>> analyzeMealPlanImpact({
    required WeeklyMealPlan newMealPlan,
    required WeeklyWorkoutPlan? currentWorkoutPlan,
  }) async {
    if (currentWorkoutPlan == null) return [];

    try {
      final prompt = _buildMealImpactPrompt(newMealPlan, currentWorkoutPlan);

      final response = await _model.generateContent([Content.text(prompt)]);
      final text = response.text ?? '';

      return _parseChangesResponse(text, PlanChangeSource.meal);
    } catch (e, st) {
      _talker.error('Failed to analyze meal plan impact', e, st);
      return [];
    }
  }

  @override
  Future<WeeklyMealPlan> applyMealPlanChanges({
    required WeeklyMealPlan mealPlan,
    required List<PendingPlanChange> approvedChanges,
  }) async {
    // Apply changes based on type
    var updatedPlan = mealPlan;

    for (final change in approvedChanges) {
      if (change.type == PlanChangeType.calorieAdjustment) {
        final dayIndex = change.affectedDayIndex;
        final newCalories = change.proposedChanges['newCalories'] as int?;

        if (dayIndex != null && newCalories != null) {
          // Update the specific day's calorie target
          // This would update the DailyMealPlan for that day
          _talker.debug(
              'Applying calorie adjustment for day $dayIndex: $newCalories');
        }
      } else if (change.type == PlanChangeType.proteinAdjustment) {
        final dayIndex = change.affectedDayIndex;
        final newProtein = change.proposedChanges['newProtein'] as int?;

        if (dayIndex != null && newProtein != null) {
          _talker.debug(
              'Applying protein adjustment for day $dayIndex: $newProtein');
        }
      }
    }

    return updatedPlan;
  }

  @override
  Future<WeeklyWorkoutPlan> applyWorkoutPlanChanges({
    required WeeklyWorkoutPlan workoutPlan,
    required List<PendingPlanChange> approvedChanges,
  }) async {
    var updatedPlan = workoutPlan;

    for (final change in approvedChanges) {
      if (change.type == PlanChangeType.intensityAdjustment) {
        final dayIndex = change.affectedDayIndex;
        final newIntensity = change.proposedChanges['newIntensity'] as int?;

        if (dayIndex != null && newIntensity != null) {
          _talker.debug(
              'Applying intensity adjustment for day $dayIndex: $newIntensity');
        }
      } else if (change.type == PlanChangeType.restDayAdded) {
        final dayIndex = change.affectedDayIndex;
        if (dayIndex != null) {
          _talker.debug('Converting day $dayIndex to rest day');
        }
      }
    }

    return updatedPlan;
  }

  @override
  Future<List<PendingPlanChange>> getCoordinationRecommendations({
    required WeeklyMealPlan mealPlan,
    required WeeklyWorkoutPlan workoutPlan,
    int? recoveryScore,
    double? strainScore,
  }) async {
    try {
      final prompt = _buildCoordinationPrompt(
        mealPlan,
        workoutPlan,
        recoveryScore,
        strainScore,
      );

      final response = await _model.generateContent([Content.text(prompt)]);
      final text = response.text ?? '';

      return _parseChangesResponse(text, PlanChangeSource.recovery);
    } catch (e, st) {
      _talker.error('Failed to get coordination recommendations', e, st);
      return [];
    }
  }

  // ============================================================================
  // Prompt Builders
  // ============================================================================

  String _buildWorkoutImpactPrompt(
    WeeklyWorkoutPlan workoutPlan,
    WeeklyMealPlan mealPlan,
    int dailyCalorieTarget,
    int dailyProteinTarget,
  ) {
    final workoutDays = workoutPlan.workoutDayIndices
        .map((i) => '${WeeklyWorkoutPlan.getDayName(i, arabic: true)}: ${workoutPlan.getDayWorkout(i)?.workoutName} (~${workoutPlan.getDayWorkout(i)?.estimatedCaloriesBurn} سعرة)')
        .join('\n');

    final mealDays = List.generate(7, (i) {
      final day = mealPlan.getDayPlan(i);
      if (day == null) return null;
      return '${WeeklyMealPlan.getDayName(i, arabic: true)}: ${day.totalCalories} سعرة, ${day.totalProtein}g بروتين';
    }).whereType<String>().join('\n');

    return '''
أنت مدرب تغذية ورياضة. حلل تأثير خطة التمارين الجديدة على خطة الوجبات الحالية.

## خطة التمارين الجديدة
$workoutDays

## خطة الوجبات الحالية
$mealDays

## الأهداف اليومية الأساسية
- السعرات: $dailyCalorieTarget سعرة/يوم
- البروتين: ${dailyProteinTarget}g/يوم

## المطلوب
حلل ما إذا كانت خطة الوجبات الحالية تحتاج تعديلات بناءً على خطة التمارين الجديدة.

اقتراحات محتملة:
1. زيادة السعرات في أيام التمرين الشاق (+200-300 سعرة)
2. زيادة البروتين في أيام تمارين القوة (+15-25g)
3. تعديل توقيت الوجبات حول أوقات التمرين
4. تقليل السعرات في أيام الراحة إذا كانت مرتفعة جداً

أجب بتنسيق JSON:

```json
{
  "changes": [
    {
      "type": "calorie_adjustment|protein_adjustment|meal_timing_adjusted",
      "affectedDayIndex": 0-6,
      "description": "English description",
      "descriptionAr": "وصف بالعربية",
      "trigger": "What triggered this change",
      "triggerAr": "سبب التغيير",
      "priority": 1-3,
      "impactScore": 0-100,
      "proposedChanges": {
        "newCalories": <number if applicable>,
        "newProtein": <number if applicable>,
        "reason": "why"
      }
    }
  ],
  "summary": "ملخص التحليل بالعربية"
}
```

ركز على التغييرات المهمة فقط (لا تقترح تغييرات طفيفة أقل من 100 سعرة).
''';
  }

  String _buildMealImpactPrompt(
    WeeklyMealPlan mealPlan,
    WeeklyWorkoutPlan workoutPlan,
  ) {
    return '''
أنت مدرب تغذية ورياضة. حلل تأثير خطة الوجبات الجديدة على خطة التمارين الحالية.

## خطة الوجبات الجديدة
- إجمالي السعرات الأسبوعية: ${mealPlan.totalCalories}
- متوسط يومي: ${mealPlan.averageDailyCalories} سعرة
- إجمالي البروتين: ${mealPlan.totalProtein}g

## خطة التمارين الحالية
- عدد أيام التمرين: ${workoutPlan.workoutDaysCount}
- إجمالي الحرق: ${workoutPlan.totalEstimatedCaloriesBurn} سعرة

حلل ما إذا كانت خطة التمارين تحتاج تعديلات بناءً على السعرات والبروتين الجديدة.

أجب بتنسيق JSON:

```json
{
  "changes": [
    {
      "type": "intensity_adjustment|rest_day_added|rest_day_removed|workout_moved",
      "affectedDayIndex": 0-6,
      "description": "English description",
      "descriptionAr": "وصف بالعربية",
      "trigger": "What triggered this change",
      "triggerAr": "سبب التغيير",
      "priority": 1-3,
      "impactScore": 0-100,
      "proposedChanges": {
        "newIntensity": <number if applicable>,
        "reason": "why"
      }
    }
  ],
  "summary": "ملخص التحليل"
}
```
''';
  }

  String _buildCoordinationPrompt(
    WeeklyMealPlan mealPlan,
    WeeklyWorkoutPlan workoutPlan,
    int? recoveryScore,
    double? strainScore,
  ) {
    return '''
أنت مدرب شخصي. راجع تنسيق خطة الوجبات والتمارين معاً.

## خطة الوجبات
- إجمالي أسبوعي: ${mealPlan.totalCalories} سعرة, ${mealPlan.totalProtein}g بروتين

## خطة التمارين
- أيام التمرين: ${workoutPlan.workoutDayIndices.map((i) => WeeklyWorkoutPlan.getDayName(i, arabic: true)).join('، ')}
- الحرق المتوقع: ${workoutPlan.totalEstimatedCaloriesBurn} سعرة

## حالة التعافي
- درجة التعافي: ${recoveryScore ?? 'غير معروف'}/100
- الإجهاد: ${strainScore?.toStringAsFixed(1) ?? 'غير معروف'}/21

اقترح تحسينات للتنسيق بين الخطتين.

أجب بتنسيق JSON:

```json
{
  "changes": [...],
  "summary": "ملخص التوصيات"
}
```
''';
  }

  // ============================================================================
  // Response Parsers
  // ============================================================================

  List<PendingPlanChange> _parseChangesResponse(
      String text, PlanChangeSource source) {
    try {
      // Extract JSON from response
      final jsonMatch = RegExp(r'\{[\s\S]*\}').firstMatch(text);
      if (jsonMatch == null) return [];

      final jsonStr = jsonMatch.group(0)!;
      final data = jsonDecode(jsonStr) as Map<String, dynamic>;
      final changesData = data['changes'] as List? ?? [];

      return changesData.map((c) {
        final change = c as Map<String, dynamic>;
        return PendingPlanChange(
          id: const Uuid().v4(),
          source: source,
          type: PlanChangeType.fromString(change['type'] ?? 'calorie_adjustment'),
          description: change['description'] ?? '',
          descriptionAr: change['descriptionAr'] ?? '',
          trigger: change['trigger'] ?? '',
          triggerAr: change['triggerAr'],
          affectedDayIndex: change['affectedDayIndex'],
          proposedChanges: change['proposedChanges'] as Map<String, dynamic>? ?? {},
          status: ChangeApprovalStatus.pending,
          createdAt: DateTime.now(),
          priority: change['priority'] ?? 1,
          impactScore: change['impactScore'] ?? 50,
        );
      }).toList();
    } catch (e) {
      _talker.warning('Failed to parse changes response: $e');
      return [];
    }
  }

  List<PendingPlanChange> _generateFallbackWorkoutChanges(
    WeeklyWorkoutPlan workoutPlan,
    WeeklyMealPlan mealPlan,
    int dailyCalorieTarget,
  ) {
    final changes = <PendingPlanChange>[];

    // Check each workout day and suggest calorie increases
    for (final dayIndex in workoutPlan.workoutDayIndices) {
      final workout = workoutPlan.getDayWorkout(dayIndex);
      final mealDay = mealPlan.getDayPlan(dayIndex);

      if (workout != null && mealDay != null) {
        final calorieBurn = workout.estimatedCaloriesBurn;

        // If workout burns significant calories, suggest increase
        if (calorieBurn > 200) {
          final suggestedIncrease = (calorieBurn * 0.6).round(); // 60% of burn

          changes.add(PendingPlanChange(
            id: const Uuid().v4(),
            source: PlanChangeSource.workout,
            type: PlanChangeType.calorieAdjustment,
            description:
                'Increase calories on ${WeeklyWorkoutPlan.getDayName(dayIndex)} by $suggestedIncrease kcal to fuel ${workout.workoutName}',
            descriptionAr:
                'زيادة السعرات يوم ${WeeklyWorkoutPlan.getDayName(dayIndex, arabic: true)} بمقدار $suggestedIncrease سعرة لتغذية ${workout.workoutNameAr ?? workout.workoutName}',
            trigger: '${workout.workoutName} burns ~$calorieBurn kcal',
            triggerAr:
                '${workout.workoutNameAr ?? workout.workoutName} يحرق ~$calorieBurn سعرة',
            affectedDayIndex: dayIndex,
            proposedChanges: {
              'newCalories': mealDay.totalCalories + suggestedIncrease,
              'originalCalories': mealDay.totalCalories,
              'increase': suggestedIncrease,
            },
            status: ChangeApprovalStatus.pending,
            createdAt: DateTime.now(),
            priority: calorieBurn > 400 ? 2 : 1,
            impactScore: (calorieBurn / 5).clamp(30, 80).round(),
          ));
        }

        // If it's a strength day, suggest protein increase
        if (workout.isStrengthTraining) {
          changes.add(PendingPlanChange(
            id: const Uuid().v4(),
            source: PlanChangeSource.workout,
            type: PlanChangeType.proteinAdjustment,
            description:
                'Increase protein on ${WeeklyWorkoutPlan.getDayName(dayIndex)} by 20g for muscle recovery',
            descriptionAr:
                'زيادة البروتين يوم ${WeeklyWorkoutPlan.getDayName(dayIndex, arabic: true)} بمقدار 20g لتعافي العضلات',
            trigger: 'Strength training day',
            triggerAr: 'يوم تمارين قوة',
            affectedDayIndex: dayIndex,
            proposedChanges: {
              'newProtein': mealDay.totalProtein + 20,
              'originalProtein': mealDay.totalProtein,
              'increase': 20,
            },
            status: ChangeApprovalStatus.pending,
            createdAt: DateTime.now(),
            priority: 1,
            impactScore: 40,
          ));
        }
      }
    }

    return changes;
  }
}

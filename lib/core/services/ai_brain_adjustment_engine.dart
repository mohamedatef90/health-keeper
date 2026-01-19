import 'package:talker/talker.dart';
import 'package:uuid/uuid.dart';

import '../domain/entities/ai_brain_context.dart';
import '../domain/entities/plan_adjustment.dart';
import '../domain/entities/user_autonomy_settings.dart';

/// Engine for generating and managing autonomous plan adjustments
///
/// This engine evaluates the current health context against a set of rules
/// and generates plan adjustments when conditions are met. It respects
/// user autonomy settings when deciding whether to auto-apply changes.
class AiBrainAdjustmentEngine {
  final Talker _talker;
  static const _uuid = Uuid();

  // Adjustment rules
  late final List<AdjustmentRule> _rules;

  AiBrainAdjustmentEngine({required Talker talker}) : _talker = talker {
    _rules = _buildRules();
  }

  /// Build the adjustment rules
  List<AdjustmentRule> _buildRules() {
    return [
      // Rule 1: Low recovery for 2+ days → suggest rest day
      AdjustmentRule(
        id: 'low_recovery_rest_day',
        name: 'Low Recovery Rest Day',
        type: AdjustmentType.restDayAdded,
        domain: AdjustmentDomain.workout,
        condition: (ctx) =>
            ctx.consecutiveLowRecoveryDays >= 2 && ctx.isWorkoutDay,
        calculateChange: (ctx) => {
          'action': 'add_rest_day',
          'reason': 'consecutiveLowRecovery',
          'daysLow': ctx.consecutiveLowRecoveryDays,
        },
        defaultImpactScore: 70,
        requiresApprovalByDefault: true,
      ),

      // Rule 2: High recovery after rest → can increase intensity
      AdjustmentRule(
        id: 'high_recovery_intensity',
        name: 'High Recovery Intensity Boost',
        type: AdjustmentType.intensityAdjustment,
        domain: AdjustmentDomain.workout,
        condition: (ctx) =>
            ctx.recoveryScore >= 80 &&
            ctx.isWorkoutDay &&
            (ctx.workoutIntensity ?? 3) < 5,
        calculateChange: (ctx) => {
          'action': 'increase_intensity',
          'currentIntensity': ctx.workoutIntensity ?? 3,
          'newIntensity': ((ctx.workoutIntensity ?? 3) + 1).clamp(1, 5),
        },
        defaultImpactScore: 30,
        requiresApprovalByDefault: false,
      ),

      // Rule 3: Extra calories burned → increase meal calories
      AdjustmentRule(
        id: 'extra_calories_burned',
        name: 'Extra Calories Burned',
        type: AdjustmentType.extraCalories,
        domain: AdjustmentDomain.meal,
        condition: (ctx) => ctx.extraCaloriesBurned >= 300,
        calculateChange: (ctx) {
          final extra = ctx.extraCaloriesBurned;
          // Add 60-70% of extra calories burned
          final adjustment = (extra * 0.65).round();
          return {
            'action': 'increase_calories',
            'extraBurned': extra,
            'calorieAdjustment': adjustment,
          };
        },
        defaultImpactScore: 25,
        requiresApprovalByDefault: false,
      ),

      // Rule 4: Behind on protein → suggest high-protein meal
      AdjustmentRule(
        id: 'behind_on_protein',
        name: 'Behind on Protein',
        type: AdjustmentType.proteinAdjustment,
        domain: AdjustmentDomain.meal,
        condition: (ctx) {
          final now = DateTime.now();
          final hourProgress = now.hour / 24;
          final expectedProtein = ctx.caloriesTarget * 0.15 / 4 * hourProgress;
          return ctx.proteinConsumed < expectedProtein * 0.6;
        },
        calculateChange: (ctx) {
          final remaining = ctx.caloriesTarget * 0.15 / 4 - ctx.proteinConsumed;
          return {
            'action': 'suggest_high_protein',
            'proteinNeeded': remaining.round(),
          };
        },
        defaultImpactScore: 20,
        requiresApprovalByDefault: false,
      ),

      // Rule 5: High strain for 3+ days → suggest deload
      AdjustmentRule(
        id: 'high_strain_deload',
        name: 'High Strain Deload',
        type: AdjustmentType.intensityAdjustment,
        domain: AdjustmentDomain.workout,
        condition: (ctx) =>
            ctx.consecutiveHighStrainDays >= 3 &&
            ctx.recoveryScore < 60,
        calculateChange: (ctx) {
          return {
            'action': 'reduce_intensity',
            'reason': 'highStrainAccumulation',
            'daysHigh': ctx.consecutiveHighStrainDays,
            'suggestedIntensity': 2,
          };
        },
        defaultImpactScore: 60,
        requiresApprovalByDefault: true,
      ),

      // Rule 6: Sleep debt → add sleep recommendation
      AdjustmentRule(
        id: 'sleep_debt_recommendation',
        name: 'Sleep Debt Recommendation',
        type: AdjustmentType.intensityAdjustment,
        domain: AdjustmentDomain.recovery,
        condition: (ctx) =>
            (ctx.sleepDebtHours ?? 0) >= 5 && ctx.recoveryScore < 50,
        calculateChange: (ctx) {
          return {
            'action': 'prioritize_sleep',
            'sleepDebt': ctx.sleepDebtHours,
            'targetBedtime': '22:00',
            'suggestLighterWorkout': ctx.isWorkoutDay,
          };
        },
        defaultImpactScore: 40,
        requiresApprovalByDefault: false,
      ),
    ];
  }

  /// Evaluate all rules and generate adjustments
  Future<List<PlanAdjustment>> generateAdjustments({
    required AiBrainContext context,
    required UserAutonomySettings autonomySettings,
  }) async {
    final adjustments = <PlanAdjustment>[];

    try {
      // Build rule evaluation context
      final ruleContext = _buildRuleContext(context);

      // Evaluate each rule
      for (final rule in _rules) {
        if (rule.condition(ruleContext)) {
          _talker.debug('Rule ${rule.id} matched');

          final change = rule.calculateChange(ruleContext);
          final adjustment = _createAdjustment(
            rule: rule,
            change: change,
            context: context,
            autonomySettings: autonomySettings,
          );

          adjustments.add(adjustment);
        }
      }

      _talker.info('Generated ${adjustments.length} plan adjustments');
    } catch (e, st) {
      _talker.error('Error generating adjustments: $e', e, st);
    }

    return adjustments;
  }

  /// Build the context for rule evaluation
  AdjustmentRuleContext _buildRuleContext(AiBrainContext context) {
    final health = context.healthContext;
    final nutrition = context.nutritionContext;
    final plans = context.plansContext;
    final trends = context.trendsContext;

    // Calculate consecutive low recovery days
    int consecutiveLowRecoveryDays = 0;
    if (trends != null) {
      for (final recovery in trends.recoveryScores.reversed) {
        if (recovery < 40) {
          consecutiveLowRecoveryDays++;
        } else {
          break;
        }
      }
    }

    // Calculate consecutive high strain days
    int consecutiveHighStrainDays = 0;
    if (trends != null) {
      for (final strain in trends.strainScores.reversed) {
        if (strain > 14) {
          consecutiveHighStrainDays++;
        } else {
          break;
        }
      }
    }

    // Calculate sleep debt
    double sleepDebt = 0;
    if (trends != null) {
      const targetSleep = 7.5;
      for (final sleep in trends.sleepDurations) {
        if (sleep < targetSleep) {
          sleepDebt += targetSleep - sleep;
        }
      }
    }

    return AdjustmentRuleContext(
      recoveryScore: health?.recoveryScore ?? 50,
      strainScore: health?.strainScore ?? 0,
      sleepHours: health?.sleepDuration,
      consecutiveLowRecoveryDays: consecutiveLowRecoveryDays,
      consecutiveHighStrainDays: consecutiveHighStrainDays,
      caloriesConsumed: nutrition?.caloriesConsumed ?? 0,
      caloriesTarget: nutrition?.caloriesTarget ?? 2000,
      caloriesBurnedToday: health?.activeEnergy ?? 0,
      plannedCaloriesBurn: plans?.workoutPlan?.estimatedCaloriesBurn ?? 0,
      isWorkoutDay: !(plans?.workoutPlan?.isTodayRestDay ?? true),
      workoutType: plans?.workoutPlan?.todayWorkoutType,
      workoutIntensity: plans?.workoutPlan?.todayWorkoutIntensity,
      sleepDebtHours: sleepDebt,
      recoveryHistory: trends?.recoveryScores ?? [],
      strainHistory: trends?.strainScores ?? [],
    );
  }

  /// Create a plan adjustment from a matched rule
  PlanAdjustment _createAdjustment({
    required AdjustmentRule rule,
    required Map<String, dynamic> change,
    required AiBrainContext context,
    required UserAutonomySettings autonomySettings,
  }) {
    // Determine if auto-apply is allowed
    final canAutoApply = autonomySettings.canAutoApply(
      decisionType: rule.type.name,
      impactScore: rule.defaultImpactScore,
    );

    // Determine initial status
    final status = canAutoApply
        ? AdjustmentStatus.autoApplied
        : AdjustmentStatus.proposed;

    // Build reason strings
    final reason = _buildReason(rule, change);
    final reasonAr = _buildReasonAr(rule, change);

    // Build trigger strings
    final trigger = _buildTrigger(rule, change);
    final triggerAr = _buildTriggerAr(rule, change);

    return PlanAdjustment(
      id: _uuid.v4(),
      type: rule.type,
      domain: rule.domain,
      reason: reason,
      reasonAr: reasonAr,
      trigger: trigger,
      triggerAr: triggerAr,
      originalValue: {}, // Will be filled when applying
      proposedValue: change,
      impactScore: rule.defaultImpactScore,
      confidence: 80,
      status: status,
      mealPlanId: context.plansContext?.mealPlan?.planId,
      workoutPlanId: context.plansContext?.workoutPlan?.planId,
      masterPlanId: context.plansContext?.masterPlanId,
      createdAt: DateTime.now(),
      appliedAt: canAutoApply ? DateTime.now() : null,
    );
  }

  /// Build English reason string
  String _buildReason(AdjustmentRule rule, Map<String, dynamic> change) {
    switch (rule.type) {
      case AdjustmentType.restDayAdded:
        return 'Your recovery has been low for ${change['daysLow']} consecutive days. A rest day is recommended.';
      case AdjustmentType.intensityAdjustment:
        if (change['action'] == 'increase_intensity') {
          return 'Your recovery is excellent (80%+). You can handle increased intensity today.';
        } else {
          return 'High strain accumulation detected. Reducing workout intensity to allow recovery.';
        }
      case AdjustmentType.extraCalories:
        return 'You burned ${change['extraBurned']} extra calories. Adding ${change['calorieAdjustment']} calories to maintain energy.';
      case AdjustmentType.proteinAdjustment:
        return 'You\'re behind on protein today. Consider a high-protein meal.';
      default:
        return 'Plan adjustment based on health data.';
    }
  }

  /// Build Arabic reason string
  String _buildReasonAr(AdjustmentRule rule, Map<String, dynamic> change) {
    switch (rule.type) {
      case AdjustmentType.restDayAdded:
        return 'تعافيك منخفض منذ ${change['daysLow']} أيام متتالية. يُنصح بيوم راحة.';
      case AdjustmentType.intensityAdjustment:
        if (change['action'] == 'increase_intensity') {
          return 'تعافيك ممتاز (80%+). يمكنك زيادة الشدة اليوم.';
        } else {
          return 'تراكم إجهاد عالي. تقليل شدة التمرين للسماح بالتعافي.';
        }
      case AdjustmentType.extraCalories:
        return 'حرقت ${change['extraBurned']} سعرة إضافية. إضافة ${change['calorieAdjustment']} سعرة للحفاظ على الطاقة.';
      case AdjustmentType.proteinAdjustment:
        return 'أنت متأخر في البروتين اليوم. فكر في وجبة غنية بالبروتين.';
      default:
        return 'تعديل الخطة بناءً على البيانات الصحية.';
    }
  }

  /// Build English trigger string
  String _buildTrigger(AdjustmentRule rule, Map<String, dynamic> change) {
    switch (rule.id) {
      case 'low_recovery_rest_day':
        return 'Recovery below 40% for ${change['daysLow']} days';
      case 'high_recovery_intensity':
        return 'Recovery at 80%+ on workout day';
      case 'extra_calories_burned':
        return 'Burned ${change['extraBurned']} extra calories';
      case 'behind_on_protein':
        return 'Protein intake behind target';
      case 'high_strain_deload':
        return 'High strain for ${change['daysHigh']} days';
      case 'sleep_debt_recommendation':
        return 'Sleep debt of ${(change['sleepDebt'] as double?)?.toStringAsFixed(1) ?? '0'} hours';
      default:
        return 'Health data analysis';
    }
  }

  /// Build Arabic trigger string
  String _buildTriggerAr(AdjustmentRule rule, Map<String, dynamic> change) {
    switch (rule.id) {
      case 'low_recovery_rest_day':
        return 'التعافي أقل من 40% منذ ${change['daysLow']} أيام';
      case 'high_recovery_intensity':
        return 'التعافي 80%+ في يوم تمرين';
      case 'extra_calories_burned':
        return 'حرق ${change['extraBurned']} سعرة إضافية';
      case 'behind_on_protein':
        return 'تناول البروتين متأخر';
      case 'high_strain_deload':
        return 'إجهاد عالي منذ ${change['daysHigh']} أيام';
      case 'sleep_debt_recommendation':
        return 'دين نوم ${(change['sleepDebt'] as double?)?.toStringAsFixed(1) ?? '0'} ساعة';
      default:
        return 'تحليل البيانات الصحية';
    }
  }

  /// Get the list of active rules
  List<AdjustmentRule> get rules => List.unmodifiable(_rules);
}

/// Extension on AdjustmentRuleContext for additional calculations
extension AdjustmentRuleContextExtension on AdjustmentRuleContext {
  /// Get protein consumed (estimated from calories)
  int get proteinConsumed => (caloriesConsumed * 0.15 / 4).round();
}

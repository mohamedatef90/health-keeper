import 'package:talker/talker.dart';
import 'package:uuid/uuid.dart';

import '../domain/entities/sleep_need.dart';
import '../domain/entities/strain_target.dart';

/// Service for WHOOP-inspired Strain Coach functionality
///
/// Provides:
/// - Real-time strain targets based on recovery
/// - Sleep need calculations
/// - Live strain progress tracking
/// - Personalized activity guidance
abstract class StrainCoachService {
  /// Get today's strain target based on recovery score
  Future<StrainTarget> getStrainTarget({
    required int recoveryScore,
    double currentStrain,
  });

  /// Calculate sleep need for tonight
  Future<SleepNeed> calculateSleepNeed({
    required double strainScore,
    required double sleepDebt,
    double baseNeed,
    DateTime? desiredWakeTime,
  });

  /// Get sleep debt tracker with recent history
  Future<SleepDebtTracker> getSleepDebtTracker({
    required List<DailySleepRecord> recentRecords,
  });

  /// Update strain target with current progress
  Future<StrainTarget> updateStrainProgress({
    required StrainTarget target,
    required double newStrain,
  });

  /// Get strain coaching message based on current state
  String getCoachingMessage({
    required StrainTarget target,
    required String language,
  });

  /// Check if user should push more or ease off
  StrainCoachAdvice getStrainAdvice({
    required StrainTarget target,
  });
}

/// Implementation of StrainCoachService
class StrainCoachServiceImpl implements StrainCoachService {
  final Talker _talker;
  final Uuid _uuid = const Uuid();

  StrainCoachServiceImpl({
    required Talker talker,
  }) : _talker = talker;

  @override
  Future<StrainTarget> getStrainTarget({
    required int recoveryScore,
    double currentStrain = 0.0,
  }) async {
    try {
      _talker.debug('Calculating strain target for recovery: $recoveryScore');

      final target = StrainTarget.fromRecovery(
        id: _uuid.v4(),
        date: DateTime.now(),
        recoveryScore: recoveryScore,
        currentStrain: currentStrain,
      );

      _talker.info(
        'Strain target calculated: ${target.minStrain}-${target.maxStrain} '
        '(optimal: ${target.optimalStrain})',
      );

      return target;
    } catch (e, st) {
      _talker.error('Failed to calculate strain target', e, st);
      // Return a conservative default
      return StrainTarget(
        id: _uuid.v4(),
        date: DateTime.now(),
        calculatedAt: DateTime.now(),
        recoveryScore: recoveryScore,
        minStrain: 5,
        maxStrain: 10,
        optimalStrain: 7.5,
        currentStrain: currentStrain,
        suggestedIntensity: StrainIntensity.moderate,
        recommendation: 'Moderate activity recommended',
        recommendationAr: 'نشاط معتدل مناسب',
      );
    }
  }

  @override
  Future<SleepNeed> calculateSleepNeed({
    required double strainScore,
    required double sleepDebt,
    double baseNeed = 7.5,
    DateTime? desiredWakeTime,
  }) async {
    try {
      _talker.debug(
        'Calculating sleep need - strain: $strainScore, debt: $sleepDebt',
      );

      // Default wake time to 7:00 AM tomorrow if not provided
      final wakeTime = desiredWakeTime ??
          DateTime.now()
              .add(const Duration(days: 1))
              .copyWith(hour: 7, minute: 0, second: 0, millisecond: 0);

      final sleepNeed = SleepNeed.calculate(
        id: _uuid.v4(),
        date: DateTime.now(),
        strainScore: strainScore,
        sleepDebt: sleepDebt,
        baseNeed: baseNeed,
        desiredWakeTime: wakeTime,
      );

      _talker.info(
        'Sleep need calculated: ${sleepNeed.totalNeed.toStringAsFixed(1)}h '
        '(base: ${baseNeed}h, debt: ${sleepNeed.debtPayback.toStringAsFixed(1)}h, '
        'strain adj: ${sleepNeed.strainAdjustment.toStringAsFixed(1)}h)',
      );

      return sleepNeed;
    } catch (e, st) {
      _talker.error('Failed to calculate sleep need', e, st);
      // Return a conservative default
      return SleepNeed(
        id: _uuid.v4(),
        date: DateTime.now(),
        calculatedAt: DateTime.now(),
        baseNeed: 7.5,
        debtPayback: 0,
        strainAdjustment: 0,
        totalNeed: 7.5,
        sleepDebt: sleepDebt,
        strainScore: strainScore,
      );
    }
  }

  @override
  Future<SleepDebtTracker> getSleepDebtTracker({
    required List<DailySleepRecord> recentRecords,
  }) async {
    try {
      _talker.debug('Calculating sleep debt from ${recentRecords.length} records');

      final tracker = SleepDebtTracker.calculate(
        id: _uuid.v4(),
        date: DateTime.now(),
        records: recentRecords,
      );

      _talker.info(
        'Sleep debt tracker: ${tracker.formattedDebt} total, '
        '${tracker.severity.label} severity',
      );

      return tracker;
    } catch (e, st) {
      _talker.error('Failed to calculate sleep debt', e, st);
      return SleepDebtTracker(
        id: _uuid.v4(),
        date: DateTime.now(),
        totalDebt: 0,
        recentRecords: recentRecords,
        avgNightlyDeficit: 0,
        estimatedRecoveryDays: 0,
      );
    }
  }

  @override
  Future<StrainTarget> updateStrainProgress({
    required StrainTarget target,
    required double newStrain,
  }) async {
    _talker.debug('Updating strain progress: ${target.currentStrain} -> $newStrain');

    return target.copyWith(
      currentStrain: newStrain,
      targetMet: newStrain >= target.minStrain,
    );
  }

  @override
  String getCoachingMessage({
    required StrainTarget target,
    required String language,
  }) {
    final isArabic = language == 'ar';
    final progress = target.progress;

    if (target.isOverReaching) {
      return isArabic
          ? 'تجاوزت هدف الإجهاد الأمثل. فكر في التخفيف لتجنب الإرهاق.'
          : 'You\'ve exceeded your optimal strain target. Consider easing off to avoid overtraining.';
    }

    if (target.targetMet && target.isInOptimalRange) {
      return isArabic
          ? 'أنت في المسار الصحيح! إجهادك الحالي مثالي لمستوى تعافيك.'
          : 'You\'re on track! Your current strain is optimal for your recovery level.';
    }

    if (progress >= 0.7) {
      return isArabic
          ? 'تقدم رائع! أنت قريب من تحقيق هدفك اليومي.'
          : 'Great progress! You\'re close to reaching your daily target.';
    }

    if (progress >= 0.4) {
      return isArabic
          ? 'لا يزال لديك مساحة لمزيد من النشاط اليوم.'
          : 'You still have room for more activity today.';
    }

    return isArabic
        ? 'الوقت مناسب للتمرين! إجهادك منخفض مقارنة بقدرة جسمك.'
        : 'Good time to exercise! Your strain is low compared to what your body can handle.';
  }

  @override
  StrainCoachAdvice getStrainAdvice({
    required StrainTarget target,
  }) {
    if (target.isOverReaching) {
      return StrainCoachAdvice.easeOff;
    }

    if (target.targetMet && target.isInOptimalRange) {
      return StrainCoachAdvice.onTrack;
    }

    if (target.progress >= 0.7) {
      return StrainCoachAdvice.almostThere;
    }

    if (target.shouldPushMore) {
      return StrainCoachAdvice.pushMore;
    }

    return StrainCoachAdvice.onTrack;
  }
}

/// Strain coach advice types
enum StrainCoachAdvice {
  /// User should ease off activity
  easeOff,

  /// User is on track
  onTrack,

  /// User is almost at target
  almostThere,

  /// User should push for more activity
  pushMore,
}

extension StrainCoachAdviceExtension on StrainCoachAdvice {
  String get label {
    switch (this) {
      case StrainCoachAdvice.easeOff:
        return 'Ease Off';
      case StrainCoachAdvice.onTrack:
        return 'On Track';
      case StrainCoachAdvice.almostThere:
        return 'Almost There';
      case StrainCoachAdvice.pushMore:
        return 'Push More';
    }
  }

  String get labelAr {
    switch (this) {
      case StrainCoachAdvice.easeOff:
        return 'خفف قليلاً';
      case StrainCoachAdvice.onTrack:
        return 'في المسار';
      case StrainCoachAdvice.almostThere:
        return 'تقريباً هناك';
      case StrainCoachAdvice.pushMore:
        return 'ادفع أكثر';
    }
  }

  String get emoji {
    switch (this) {
      case StrainCoachAdvice.easeOff:
        return '⚠️';
      case StrainCoachAdvice.onTrack:
        return '✅';
      case StrainCoachAdvice.almostThere:
        return '🎯';
      case StrainCoachAdvice.pushMore:
        return '💪';
    }
  }

  String get colorHex {
    switch (this) {
      case StrainCoachAdvice.easeOff:
        return '#FF9800'; // Orange
      case StrainCoachAdvice.onTrack:
        return '#4CAF50'; // Green
      case StrainCoachAdvice.almostThere:
        return '#2196F3'; // Blue
      case StrainCoachAdvice.pushMore:
        return '#9C27B0'; // Purple
    }
  }
}

/// Context for strain coach calculations
class StrainCoachContext {
  final int recoveryScore;
  final double currentStrain;
  final double sleepDebt;
  final double? previousDayStrain;
  final int? sleepHours;
  final int? sleepQuality;
  final DateTime? lastWorkoutTime;

  const StrainCoachContext({
    required this.recoveryScore,
    this.currentStrain = 0.0,
    this.sleepDebt = 0.0,
    this.previousDayStrain,
    this.sleepHours,
    this.sleepQuality,
    this.lastWorkoutTime,
  });
}

/// Daily strain and sleep summary
class DailyCoachSummary {
  final StrainTarget strainTarget;
  final SleepNeed sleepNeed;
  final StrainCoachAdvice advice;
  final String coachingMessage;
  final String coachingMessageAr;
  final List<String> recommendations;
  final List<String> recommendationsAr;

  const DailyCoachSummary({
    required this.strainTarget,
    required this.sleepNeed,
    required this.advice,
    required this.coachingMessage,
    required this.coachingMessageAr,
    required this.recommendations,
    required this.recommendationsAr,
  });

  factory DailyCoachSummary.generate({
    required StrainTarget strainTarget,
    required SleepNeed sleepNeed,
    required StrainCoachAdvice advice,
  }) {
    final recommendations = <String>[];
    final recommendationsAr = <String>[];

    // Add recommendations based on advice
    switch (advice) {
      case StrainCoachAdvice.easeOff:
        recommendations.add('Consider active recovery instead of intense training');
        recommendations.add('Focus on stretching and mobility work');
        recommendationsAr.add('فكر في التعافي النشط بدلاً من التمرين المكثف');
        recommendationsAr.add('ركز على التمدد وتمارين المرونة');
        break;
      case StrainCoachAdvice.onTrack:
        recommendations.add('Great job maintaining optimal strain levels');
        recommendations.add('Keep listening to your body');
        recommendationsAr.add('عمل رائع في الحفاظ على مستويات إجهاد مثالية');
        recommendationsAr.add('استمر في الاستماع لجسمك');
        break;
      case StrainCoachAdvice.almostThere:
        recommendations.add('A short workout could help you reach your target');
        recommendations.add('Even a 20-minute session counts');
        recommendationsAr.add('تمرين قصير يمكن أن يساعدك في الوصول لهدفك');
        recommendationsAr.add('حتى جلسة 20 دقيقة تحتسب');
        break;
      case StrainCoachAdvice.pushMore:
        recommendations.add('Your body is ready for activity');
        recommendations.add('Consider a workout that matches your recovery level');
        recommendationsAr.add('جسمك مستعد للنشاط');
        recommendationsAr.add('فكر في تمرين يناسب مستوى تعافيك');
        break;
    }

    // Add sleep recommendation if needed
    if (sleepNeed.totalNeed > 8) {
      recommendations.add('Prioritize getting ${sleepNeed.formattedTotalNeed} of sleep tonight');
      recommendationsAr.add('أعطِ الأولوية للحصول على ${sleepNeed.formattedTotalNeed} من النوم الليلة');
    }

    return DailyCoachSummary(
      strainTarget: strainTarget,
      sleepNeed: sleepNeed,
      advice: advice,
      coachingMessage: _getCoachingMessage(advice, strainTarget),
      coachingMessageAr: _getCoachingMessageAr(advice, strainTarget),
      recommendations: recommendations,
      recommendationsAr: recommendationsAr,
    );
  }

  static String _getCoachingMessage(StrainCoachAdvice advice, StrainTarget target) {
    switch (advice) {
      case StrainCoachAdvice.easeOff:
        return 'You\'ve exceeded your optimal strain. Consider easing off.';
      case StrainCoachAdvice.onTrack:
        return 'You\'re perfectly on track! Current strain: ${target.currentStrain.toStringAsFixed(1)}/${target.optimalStrain.toStringAsFixed(1)}';
      case StrainCoachAdvice.almostThere:
        return 'Almost at your target! Just ${(target.optimalStrain - target.currentStrain).toStringAsFixed(1)} more to go.';
      case StrainCoachAdvice.pushMore:
        return 'Room for activity! Your target strain is ${target.optimalStrain.toStringAsFixed(0)}.';
    }
  }

  static String _getCoachingMessageAr(StrainCoachAdvice advice, StrainTarget target) {
    switch (advice) {
      case StrainCoachAdvice.easeOff:
        return 'تجاوزت إجهادك الأمثل. فكر في التخفيف.';
      case StrainCoachAdvice.onTrack:
        return 'أنت في المسار الصحيح! الإجهاد الحالي: ${target.currentStrain.toStringAsFixed(1)}/${target.optimalStrain.toStringAsFixed(1)}';
      case StrainCoachAdvice.almostThere:
        return 'تقريباً عند هدفك! ${(target.optimalStrain - target.currentStrain).toStringAsFixed(1)} فقط متبقي.';
      case StrainCoachAdvice.pushMore:
        return 'لديك مساحة للنشاط! هدف إجهادك هو ${target.optimalStrain.toStringAsFixed(0)}.';
    }
  }
}

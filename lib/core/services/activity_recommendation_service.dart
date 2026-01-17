import 'package:talker/talker.dart';
import 'package:uuid/uuid.dart';

import '../../features/workouts/domain/entities/activity_recommendation.dart';
import 'gemini_coach_service.dart';

/// Service for AI-powered activity recommendations based on recovery score
///
/// Provides intelligent recommendations for what type of activity to perform
/// based on:
/// - Recovery score (0-100)
/// - Strain score from previous day (0-21)
/// - Recent workout history
/// - User's protocol and constraints
/// - Egyptian context (weather, Ramadan, etc.)
abstract class ActivityRecommendationService {
  /// Get activity recommendation based on current recovery state
  ///
  /// [context] contains recovery score, strain, and other relevant data
  /// Returns [ActivityRecommendation] with suggestions and reasoning
  Future<ActivityRecommendation> getRecommendation(
    ActivityRecommendationContext context,
  );

  /// Get AI-enhanced recommendation with more detailed analysis
  Future<ActivityRecommendation> getAiEnhancedRecommendation(
    ActivityRecommendationContext context,
  );

  /// Check if a specific workout is appropriate for current recovery
  Future<WorkoutApprovalResult> approveWorkout({
    required double recoveryScore,
    required String workoutType,
    required int plannedDuration,
    required int plannedIntensity,
  });

  /// Get recovery protocols based on current state
  Future<List<RecoveryProtocol>> getRecoveryProtocols(
    ActivityRecommendationContext context,
  );
}

/// Implementation of ActivityRecommendationService
class ActivityRecommendationServiceImpl implements ActivityRecommendationService {
  final GeminiCoachService _geminiService;
  final Talker _talker;
  final Uuid _uuid = const Uuid();

  ActivityRecommendationServiceImpl({
    required GeminiCoachService geminiService,
    required Talker talker,
  })  : _geminiService = geminiService,
        _talker = talker;

  @override
  Future<ActivityRecommendation> getRecommendation(
    ActivityRecommendationContext context,
  ) async {
    try {
      // Determine recommendation type based on recovery score
      final recommendationType = _getRecommendationType(context);

      // Get suggested activities for this type
      final suggestedActivities = _getSuggestedActivities(
        recommendationType,
        context,
      );

      // Get recovery protocols
      final recoveryProtocols = DefaultRecoveryProtocols.getProtocols(
        context.recoveryScore,
      );

      // Generate warnings if needed
      final warnings = _generateWarnings(context);

      // Generate reasoning
      final reasoning = _generateReasoning(context, recommendationType);

      // Calculate suggested duration and intensity
      final (duration, intensity) = _calculateDurationAndIntensity(
        recommendationType,
        context,
      );

      return ActivityRecommendation(
        id: _uuid.v4(),
        generatedAt: DateTime.now(),
        recommendationType: recommendationType,
        primaryRecommendation: _getPrimaryRecommendation(
          recommendationType,
          context.language,
        ),
        alternativeActivities: _getAlternativeActivities(
          recommendationType,
          context.language,
        ),
        reasoning: reasoning,
        targetStrainRange: recommendationType.strainRange,
        suggestedDuration: duration,
        suggestedIntensity: intensity,
        warnings: warnings,
        recoveryScore: context.recoveryScore,
        previousDayStrain: context.strainScore,
        isAiGenerated: false,
        confidence: _calculateConfidence(context),
        suggestedActivities: suggestedActivities,
        recoveryProtocols: recoveryProtocols,
      );
    } catch (e, st) {
      _talker.error('Failed to get activity recommendation', e, st);
      return _fallbackRecommendation(context);
    }
  }

  @override
  Future<ActivityRecommendation> getAiEnhancedRecommendation(
    ActivityRecommendationContext context,
  ) async {
    try {
      // Get base recommendation first
      final baseRecommendation = await getRecommendation(context);

      // Enhance with AI
      final aiResult = await _geminiService.getActivityRecommendation(
        recoveryScore: context.recoveryScore,
        strainScore: context.strainScore,
        recentWorkouts: context.recentWorkouts
            .map((w) => {
                  'date': w.date.toIso8601String(),
                  'type': w.type,
                  'duration': w.durationMinutes,
                  'intensity': w.intensity,
                  'strain': w.strainScore,
                })
            .toList(),
        constraints: context.constraints,
        weeklyPlan: context.weeklyPlan,
        isRamadan: context.isRamadan,
        language: context.language,
      );

      // Merge AI insights with base recommendation
      return baseRecommendation.copyWith(
        reasoning: aiResult.reasoning ?? baseRecommendation.reasoning,
        warnings: [
          ...baseRecommendation.warnings,
          ...aiResult.warnings,
        ],
        isAiGenerated: true,
        confidence: aiResult.confidence,
      );
    } catch (e, st) {
      _talker.error('Failed to get AI-enhanced recommendation', e, st);
      // Fall back to base recommendation
      return getRecommendation(context);
    }
  }

  @override
  Future<WorkoutApprovalResult> approveWorkout({
    required double recoveryScore,
    required String workoutType,
    required int plannedDuration,
    required int plannedIntensity,
  }) async {
    try {
      final recommendationType = _getRecommendationTypeFromScore(recoveryScore);
      final targetStrainRange = recommendationType.strainRange;

      // Estimate planned strain based on duration and intensity
      final estimatedStrain = _estimateStrain(
        workoutType,
        plannedDuration,
        plannedIntensity,
      );

      final isApproved = estimatedStrain <= targetStrainRange.max;
      final isOptimal =
          estimatedStrain >= targetStrainRange.min &&
          estimatedStrain <= targetStrainRange.max;

      String? warning;
      String? suggestion;

      if (!isApproved) {
        warning = 'This workout may be too intense for your current recovery.';
        suggestion = 'Consider reducing duration or intensity, or choose a lighter activity.';
      } else if (!isOptimal && estimatedStrain < targetStrainRange.min) {
        suggestion = 'You have capacity for more intensity if you want to push today.';
      }

      return WorkoutApprovalResult(
        isApproved: isApproved,
        isOptimal: isOptimal,
        estimatedStrain: estimatedStrain,
        targetStrainRange: targetStrainRange,
        warning: warning,
        suggestion: suggestion,
        modifiedDuration: isApproved ? null : (plannedDuration * 0.7).round(),
        modifiedIntensity: isApproved ? null : (plannedIntensity * 0.7).round(),
      );
    } catch (e, st) {
      _talker.error('Failed to approve workout', e, st);
      return WorkoutApprovalResult(
        isApproved: true,
        isOptimal: false,
        estimatedStrain: 10,
        targetStrainRange: const StrainRange(min: 0, max: 21),
        warning: 'Could not fully analyze workout. Listen to your body.',
      );
    }
  }

  @override
  Future<List<RecoveryProtocol>> getRecoveryProtocols(
    ActivityRecommendationContext context,
  ) async {
    return DefaultRecoveryProtocols.getProtocols(context.recoveryScore);
  }

  // ============ PRIVATE HELPERS ============

  RecommendationType _getRecommendationType(
    ActivityRecommendationContext context,
  ) {
    final recoveryScore = context.recoveryScore;

    // Factor in HRV deviation if available
    double adjustedScore = recoveryScore;
    if (context.currentHrv != null && context.baselineHrv != null) {
      final hrvDeviation =
          (context.currentHrv! - context.baselineHrv!) / context.baselineHrv!;
      // Negative deviation (lower HRV) reduces score
      adjustedScore += hrvDeviation * 20;
    }

    // Factor in sleep quality
    if (context.sleepQuality != null && context.sleepQuality! < 60) {
      adjustedScore -= 10;
    }

    // Factor in previous day strain
    if (context.strainScore != null && context.strainScore! > 15) {
      adjustedScore -= 10;
    }

    // Ramadan adjustment (reduce intensity recommendations)
    if (context.isRamadan) {
      adjustedScore -= 15;
    }

    // Temperature adjustment for Egypt
    if (context.temperatureCelsius != null &&
        context.temperatureCelsius! > 35) {
      adjustedScore -= 10;
    }

    return _getRecommendationTypeFromScore(adjustedScore.clamp(0, 100));
  }

  RecommendationType _getRecommendationTypeFromScore(double score) {
    if (score < 30) {
      return RecommendationType.rest;
    } else if (score < 50) {
      return RecommendationType.light;
    } else if (score < 70) {
      return RecommendationType.moderate;
    } else {
      return RecommendationType.intense;
    }
  }

  List<SuggestedActivity> _getSuggestedActivities(
    RecommendationType type,
    ActivityRecommendationContext context,
  ) {
    var activities = DefaultActivitySuggestions.getActivities(type);

    // Filter based on context
    if (context.constraints.isNotEmpty) {
      // Remove activities that conflict with constraints
      activities = activities.where((activity) {
        for (final constraint in context.constraints) {
          if (constraint.toLowerCase().contains('gym') &&
              activity.equipment.contains('gym access')) {
            return false;
          }
          if (constraint.toLowerCase().contains('running') &&
              activity.type == 'running') {
            return false;
          }
        }
        return true;
      }).toList();
    }

    // Adjust for hot weather in Egypt
    if (context.temperatureCelsius != null &&
        context.temperatureCelsius! > 35) {
      // Prefer indoor or water activities
      activities = activities.map((activity) {
        if (activity.type == 'running' || activity.type == 'cycling') {
          return activity.copyWith(
            localContextNote:
                context.language == 'ar'
                    ? 'يفضل ممارستها في الصباح الباكر أو بعد الغروب'
                    : 'Best done early morning or after sunset',
          );
        }
        return activity;
      }).toList();
    }

    return activities;
  }

  List<String> _generateWarnings(ActivityRecommendationContext context) {
    final warnings = <String>[];
    final isArabic = context.language == 'ar';

    // Low recovery warning
    if (context.recoveryScore < 30) {
      warnings.add(
        isArabic
            ? 'تعافيك منخفض جداً. الراحة ضرورية اليوم.'
            : 'Your recovery is very low. Rest is essential today.',
      );
    }

    // High previous strain warning
    if (context.strainScore != null && context.strainScore! > 18) {
      warnings.add(
        isArabic
            ? 'الإجهاد بالأمس كان مرتفعاً جداً. خذ وقتاً للتعافي.'
            : 'Yesterday\'s strain was very high. Take time to recover.',
      );
    }

    // Poor sleep warning
    if (context.sleepHours != null && context.sleepHours! < 6) {
      warnings.add(
        isArabic
            ? 'قلة النوم تؤثر على التعافي والأداء.'
            : 'Low sleep affects recovery and performance.',
      );
    }

    // HRV drop warning
    if (context.currentHrv != null && context.baselineHrv != null) {
      final hrvDrop =
          ((context.baselineHrv! - context.currentHrv!) / context.baselineHrv!) *
              100;
      if (hrvDrop > 20) {
        warnings.add(
          isArabic
              ? 'HRV أقل من المعتاد. جسمك قد يكون تحت ضغط.'
              : 'HRV is below baseline. Your body may be under stress.',
        );
      }
    }

    // Heat warning for Egypt
    if (context.temperatureCelsius != null &&
        context.temperatureCelsius! > 38) {
      warnings.add(
        isArabic
            ? 'الحرارة مرتفعة جداً. تجنب التمارين في الهواء الطلق.'
            : 'Temperature is very high. Avoid outdoor exercise.',
      );
    }

    // Ramadan warning
    if (context.isRamadan) {
      warnings.add(
        isArabic
            ? 'خلال رمضان، يفضل التمرين قبل الإفطار أو بعده بساعتين.'
            : 'During Ramadan, exercise is best before iftar or 2 hours after.',
      );
    }

    return warnings;
  }

  String _generateReasoning(
    ActivityRecommendationContext context,
    RecommendationType type,
  ) {
    final isArabic = context.language == 'ar';
    final parts = <String>[];

    // Recovery score reasoning
    if (isArabic) {
      parts.add('معدل تعافيك ${context.recoveryScore.round()}%');
    } else {
      parts.add('Your recovery is ${context.recoveryScore.round()}%');
    }

    // Sleep contribution
    if (context.sleepHours != null) {
      if (isArabic) {
        parts.add('حصلت على ${context.sleepHours!.toStringAsFixed(1)} ساعة نوم');
      } else {
        parts.add('You got ${context.sleepHours!.toStringAsFixed(1)}h of sleep');
      }
    }

    // Previous strain contribution
    if (context.strainScore != null) {
      if (isArabic) {
        parts.add('الإجهاد بالأمس كان ${context.strainScore!.toStringAsFixed(1)}/21');
      } else {
        parts.add('Yesterday\'s strain was ${context.strainScore!.toStringAsFixed(1)}/21');
      }
    }

    // Final recommendation
    switch (type) {
      case RecommendationType.rest:
        parts.add(
          isArabic
              ? 'جسمك يحتاج راحة تامة اليوم.'
              : 'Your body needs complete rest today.',
        );
        break;
      case RecommendationType.light:
        parts.add(
          isArabic
              ? 'نشاط خفيف سيساعد على التعافي.'
              : 'Light activity will aid recovery.',
        );
        break;
      case RecommendationType.moderate:
        parts.add(
          isArabic
              ? 'يمكنك ممارسة نشاط متوسط الشدة.'
              : 'You can handle moderate activity.',
        );
        break;
      case RecommendationType.intense:
        parts.add(
          isArabic
              ? 'أنت مستعد لتمرين عالي الشدة!'
              : 'You\'re ready for high-intensity training!',
        );
        break;
    }

    return parts.join('. ');
  }

  (int duration, int intensity) _calculateDurationAndIntensity(
    RecommendationType type,
    ActivityRecommendationContext context,
  ) {
    int baseDuration;
    int baseIntensity;

    switch (type) {
      case RecommendationType.rest:
        baseDuration = 0;
        baseIntensity = 0;
        break;
      case RecommendationType.light:
        baseDuration = 30;
        baseIntensity = 3;
        break;
      case RecommendationType.moderate:
        baseDuration = 45;
        baseIntensity = 5;
        break;
      case RecommendationType.intense:
        baseDuration = 60;
        baseIntensity = 8;
        break;
    }

    // Adjust for Ramadan
    if (context.isRamadan && type != RecommendationType.rest) {
      baseDuration = (baseDuration * 0.7).round();
      baseIntensity = (baseIntensity * 0.8).round();
    }

    // Adjust for heat
    if (context.temperatureCelsius != null &&
        context.temperatureCelsius! > 35 &&
        type != RecommendationType.rest) {
      baseDuration = (baseDuration * 0.8).round();
    }

    return (baseDuration, baseIntensity);
  }

  String _getPrimaryRecommendation(RecommendationType type, String language) {
    if (language == 'ar') {
      switch (type) {
        case RecommendationType.rest:
          return 'استرح اليوم وركز على التعافي';
        case RecommendationType.light:
          return 'مشي خفيف أو تمدد لمدة 30 دقيقة';
        case RecommendationType.moderate:
          return 'تمرين متوسط الشدة لمدة 45 دقيقة';
        case RecommendationType.intense:
          return 'تمرين كامل عالي الشدة لمدة 60 دقيقة';
      }
    } else {
      switch (type) {
        case RecommendationType.rest:
          return 'Rest today and focus on recovery';
        case RecommendationType.light:
          return 'Light walking or stretching for 30 minutes';
        case RecommendationType.moderate:
          return 'Moderate intensity workout for 45 minutes';
        case RecommendationType.intense:
          return 'Full high-intensity training for 60 minutes';
      }
    }
  }

  List<String> _getAlternativeActivities(
    RecommendationType type,
    String language,
  ) {
    if (language == 'ar') {
      switch (type) {
        case RecommendationType.rest:
          return ['تأمل', 'تمدد خفيف', 'قراءة'];
        case RecommendationType.light:
          return ['يوجا', 'سباحة خفيفة', 'تدليك بالرول'];
        case RecommendationType.moderate:
          return ['دراجة', 'جري خفيف', 'تمرين تقنية'];
        case RecommendationType.intense:
          return ['HIIT', 'رفع أثقال', 'كرة قدم'];
      }
    } else {
      switch (type) {
        case RecommendationType.rest:
          return ['Meditation', 'Light stretching', 'Reading'];
        case RecommendationType.light:
          return ['Yoga', 'Light swimming', 'Foam rolling'];
        case RecommendationType.moderate:
          return ['Cycling', 'Light jog', 'Technique work'];
        case RecommendationType.intense:
          return ['HIIT', 'Weight training', 'Football'];
      }
    }
  }

  int _calculateConfidence(ActivityRecommendationContext context) {
    var confidence = 70;

    // More data = higher confidence
    if (context.currentHrv != null) confidence += 5;
    if (context.currentRhr != null) confidence += 5;
    if (context.sleepHours != null) confidence += 5;
    if (context.sleepQuality != null) confidence += 5;
    if (context.strainScore != null) confidence += 5;
    if (context.recentWorkouts.isNotEmpty) confidence += 5;

    return confidence.clamp(0, 100);
  }

  double _estimateStrain(String workoutType, int duration, int intensity) {
    // Base strain per minute at intensity 5
    final baseStrainPerMinute = 0.15;

    // Intensity multiplier (exponential scaling)
    final intensityMultiplier = (intensity / 5).clamp(0.5, 2.5);

    // Workout type multiplier
    double typeMultiplier;
    switch (workoutType.toLowerCase()) {
      case 'hiit':
      case 'crossfit':
        typeMultiplier = 1.5;
        break;
      case 'running':
      case 'cycling':
        typeMultiplier = 1.2;
        break;
      case 'strength':
      case 'weights':
        typeMultiplier = 1.1;
        break;
      case 'yoga':
      case 'stretching':
        typeMultiplier = 0.5;
        break;
      case 'walking':
        typeMultiplier = 0.4;
        break;
      default:
        typeMultiplier = 1.0;
    }

    final strain =
        duration * baseStrainPerMinute * intensityMultiplier * typeMultiplier;
    return strain.clamp(0, 21);
  }

  ActivityRecommendation _fallbackRecommendation(
    ActivityRecommendationContext context,
  ) {
    final isArabic = context.language == 'ar';
    return ActivityRecommendation(
      id: _uuid.v4(),
      generatedAt: DateTime.now(),
      recommendationType: RecommendationType.moderate,
      primaryRecommendation: isArabic
          ? 'استمع لجسمك وتمرن بحذر'
          : 'Listen to your body and exercise with caution',
      alternativeActivities: isArabic
          ? ['مشي', 'تمدد', 'يوجا']
          : ['Walking', 'Stretching', 'Yoga'],
      reasoning: isArabic
          ? 'لم نتمكن من تحليل حالتك بالكامل. هذه توصية عامة.'
          : 'Could not fully analyze your state. This is a general recommendation.',
      targetStrainRange: const StrainRange(min: 5, max: 12),
      suggestedDuration: 30,
      suggestedIntensity: 5,
      warnings: [
        isArabic
            ? 'توصية عامة - استمع لجسمك'
            : 'General recommendation - listen to your body',
      ],
      recoveryScore: context.recoveryScore,
      previousDayStrain: context.strainScore,
      isAiGenerated: false,
      confidence: 50,
      suggestedActivities: DefaultActivitySuggestions.moderateActivities,
      recoveryProtocols:
          DefaultRecoveryProtocols.getProtocols(context.recoveryScore),
    );
  }
}

/// Result of workout approval check
class WorkoutApprovalResult {
  final bool isApproved;
  final bool isOptimal;
  final double estimatedStrain;
  final StrainRange targetStrainRange;
  final String? warning;
  final String? suggestion;
  final int? modifiedDuration;
  final int? modifiedIntensity;

  WorkoutApprovalResult({
    required this.isApproved,
    required this.isOptimal,
    required this.estimatedStrain,
    required this.targetStrainRange,
    this.warning,
    this.suggestion,
    this.modifiedDuration,
    this.modifiedIntensity,
  });
}

/// Result from AI activity recommendation
class AiActivityRecommendationResult {
  final String? reasoning;
  final List<String> warnings;
  final int confidence;

  AiActivityRecommendationResult({
    this.reasoning,
    required this.warnings,
    required this.confidence,
  });

  factory AiActivityRecommendationResult.empty() =>
      AiActivityRecommendationResult(
        warnings: [],
        confidence: 50,
      );
}

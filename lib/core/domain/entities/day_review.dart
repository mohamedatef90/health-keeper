import 'package:freezed_annotation/freezed_annotation.dart';

part 'day_review.freezed.dart';
part 'day_review.g.dart';

/// Day in Review entity for evening summary
/// WHOOP-inspired feature providing end-of-day analysis
@freezed
class DayReview with _$DayReview {
  const DayReview._();

  const factory DayReview({
    required String id,
    required DateTime date,
    required DateTime generatedAt,

    /// Strain performance
    required StrainReview strainReview,

    /// Sleep review from last night (context)
    required SleepReview sleepReview,

    /// Nutrition review
    NutritionReview? nutritionReview,

    /// Predicted recovery for tomorrow
    required RecoveryPrediction recoveryPrediction,

    /// Top behavior impacts
    @Default([]) List<DayBehaviorImpact> behaviorImpacts,

    /// What went well
    @Default([]) List<String> whatWentWell,

    /// Arabic what went well
    @Default([]) List<String> whatWentWellAr,

    /// Areas to improve
    @Default([]) List<String> areasToImprove,

    /// Arabic areas to improve
    @Default([]) List<String> areasToImproveAr,

    /// Sleep recommendation for tonight
    required double sleepRecommendationHours,

    /// Recommended bedtime
    DateTime? recommendedBedtime,

    /// AI-generated summary
    String? aiSummary,

    /// Arabic AI summary
    String? aiSummaryAr,

    /// Overall day score (0-100)
    required int overallScore,

    /// Whether this is AI-generated
    @Default(false) bool isAiGenerated,

    /// Confidence score (0-100)
    @Default(70) int confidence,
  }) = _DayReview;

  factory DayReview.fromJson(Map<String, dynamic> json) =>
      _$DayReviewFromJson(json);

  /// Get overall assessment message
  String getAssessmentMessage(String language) {
    if (language == 'ar') {
      if (overallScore >= 80) return 'يوم ممتاز! عمل رائع.';
      if (overallScore >= 60) return 'يوم جيد. أحسنت!';
      if (overallScore >= 40) return 'يوم عادي. غداً سيكون أفضل.';
      return 'يوم صعب. خذ راحة واستعد للغد.';
    }
    if (overallScore >= 80) return 'Excellent day! Great job.';
    if (overallScore >= 60) return 'Good day. Well done!';
    if (overallScore >= 40) return 'Average day. Tomorrow will be better.';
    return 'Tough day. Rest up and prepare for tomorrow.';
  }

  /// Get color for overall score
  String get scoreColorHex {
    if (overallScore >= 80) return '#4CAF50';
    if (overallScore >= 60) return '#8BC34A';
    if (overallScore >= 40) return '#FF9800';
    return '#F44336';
  }
}

/// Strain review component
@freezed
class StrainReview with _$StrainReview {
  const StrainReview._();

  const factory StrainReview({
    /// Strain achieved today
    required double strainAchieved,

    /// Target strain for today
    required double strainTarget,

    /// Was target met?
    required bool targetMet,

    /// Was strain in optimal range?
    required bool wasOptimal,

    /// Strain breakdown by activity
    @Default([]) List<StrainContribution> contributions,

    /// Total active minutes
    required int totalActiveMinutes,

    /// Calories burned
    int? caloriesBurned,
  }) = _StrainReview;

  factory StrainReview.fromJson(Map<String, dynamic> json) =>
      _$StrainReviewFromJson(json);

  /// Performance vs target (percentage)
  double get performance =>
      strainTarget > 0 ? (strainAchieved / strainTarget) : 0;

  /// Performance percentage for display
  int get performancePercent => (performance * 100).clamp(0, 150).round();

  /// Get status message
  String getStatusMessage(String language) {
    if (language == 'ar') {
      if (wasOptimal) return 'إجهاد مثالي!';
      if (targetMet) return 'تجاوزت الهدف';
      if (performance >= 0.7) return 'قريب من الهدف';
      return 'تحت الهدف';
    }
    if (wasOptimal) return 'Optimal strain!';
    if (targetMet) return 'Exceeded target';
    if (performance >= 0.7) return 'Close to target';
    return 'Under target';
  }
}

/// Strain contribution from an activity
@freezed
class StrainContribution with _$StrainContribution {
  const factory StrainContribution({
    required String activityType,
    required String activityName,
    required double strain,
    required int durationMinutes,
    DateTime? startTime,
  }) = _StrainContribution;

  factory StrainContribution.fromJson(Map<String, dynamic> json) =>
      _$StrainContributionFromJson(json);
}

/// Sleep review component
@freezed
class SleepReview with _$SleepReview {
  const SleepReview._();

  const factory SleepReview({
    /// Hours slept
    required double hoursSlept,

    /// Hours needed
    required double hoursNeeded,

    /// Sleep quality (0-100)
    int? qualityScore,

    /// Sleep efficiency
    int? efficiency,

    /// Time in bed
    double? timeInBed,

    /// Sleep stages if available
    SleepStagesReview? stages,
  }) = _SleepReview;

  factory SleepReview.fromJson(Map<String, dynamic> json) =>
      _$SleepReviewFromJson(json);

  /// Performance vs need
  double get performance =>
      hoursNeeded > 0 ? (hoursSlept / hoursNeeded) : 0;

  /// Deficit or surplus
  double get difference => hoursSlept - hoursNeeded;

  /// Get status message
  String getStatusMessage(String language) {
    if (language == 'ar') {
      if (difference >= 0.5) return 'نوم ممتاز!';
      if (difference >= 0) return 'حققت هدفك';
      if (difference >= -1) return 'قليلاً تحت الهدف';
      return 'عجز كبير';
    }
    if (difference >= 0.5) return 'Excellent sleep!';
    if (difference >= 0) return 'Met your need';
    if (difference >= -1) return 'Slightly under';
    return 'Significant deficit';
  }
}

/// Sleep stages breakdown
@freezed
class SleepStagesReview with _$SleepStagesReview {
  const factory SleepStagesReview({
    @Default(0) int lightMinutes,
    @Default(0) int deepMinutes,
    @Default(0) int remMinutes,
    @Default(0) int awakeMinutes,
  }) = _SleepStagesReview;

  factory SleepStagesReview.fromJson(Map<String, dynamic> json) =>
      _$SleepStagesReviewFromJson(json);
}

/// Nutrition review component
@freezed
class NutritionReview with _$NutritionReview {
  const NutritionReview._();

  const factory NutritionReview({
    /// Calories consumed
    required int caloriesConsumed,

    /// Calories target
    required int caloriesTarget,

    /// Protein consumed (grams)
    required int proteinConsumed,

    /// Protein target (grams)
    required int proteinTarget,

    /// Meals logged
    required int mealsLogged,

    /// Was in eating window?
    @Default(true) bool wasInEatingWindow,
  }) = _NutritionReview;

  factory NutritionReview.fromJson(Map<String, dynamic> json) =>
      _$NutritionReviewFromJson(json);

  /// Calorie performance
  double get caloriePerformance =>
      caloriesTarget > 0 ? (caloriesConsumed / caloriesTarget) : 0;

  /// Protein performance
  double get proteinPerformance =>
      proteinTarget > 0 ? (proteinConsumed / proteinTarget) : 0;

  /// Get status message
  String getStatusMessage(String language) {
    final calMet = caloriePerformance >= 0.9 && caloriePerformance <= 1.1;
    final proMet = proteinPerformance >= 0.9;

    if (language == 'ar') {
      if (calMet && proMet) return 'تغذية ممتازة!';
      if (calMet || proMet) return 'تغذية جيدة';
      return 'يمكن تحسينها';
    }
    if (calMet && proMet) return 'Excellent nutrition!';
    if (calMet || proMet) return 'Good nutrition';
    return 'Room for improvement';
  }
}

/// Recovery prediction for tomorrow
@freezed
class RecoveryPrediction with _$RecoveryPrediction {
  const RecoveryPrediction._();

  const factory RecoveryPrediction({
    /// Predicted score (0-100)
    required int predictedScore,

    /// Confidence range (e.g., 70-80)
    required int rangeMin,
    required int rangeMax,

    /// Factors influencing prediction
    @Default([]) List<PredictionFactor> factors,

    /// Prediction confidence
    @Default(70) int confidence,
  }) = _RecoveryPrediction;

  factory RecoveryPrediction.fromJson(Map<String, dynamic> json) =>
      _$RecoveryPredictionFromJson(json);

  /// Get prediction state
  String get predictedState {
    if (predictedScore >= 80) return 'Peak';
    if (predictedScore >= 60) return 'Good';
    if (predictedScore >= 40) return 'Moderate';
    if (predictedScore >= 20) return 'Low';
    return 'Rest';
  }

  /// Get formatted range
  String get formattedRange => '$rangeMin-$rangeMax%';

  /// Get color for predicted score
  String get colorHex {
    if (predictedScore >= 80) return '#4CAF50';
    if (predictedScore >= 60) return '#8BC34A';
    if (predictedScore >= 40) return '#FFEB3B';
    if (predictedScore >= 20) return '#FF9800';
    return '#F44336';
  }
}

/// Factor influencing recovery prediction
@freezed
class PredictionFactor with _$PredictionFactor {
  const factory PredictionFactor({
    required String name,
    required String nameAr,

    /// Impact on recovery (positive or negative points)
    required int impact,

    /// Description of impact
    required String description,
    required String descriptionAr,
  }) = _PredictionFactor;

  factory PredictionFactor.fromJson(Map<String, dynamic> json) =>
      _$PredictionFactorFromJson(json);
}

/// Behavior impact on recovery
@freezed
class DayBehaviorImpact with _$DayBehaviorImpact {
  const factory DayBehaviorImpact({
    required String behaviorId,
    required String behaviorName,
    required String behaviorNameAr,

    /// Impact on recovery (percentage points)
    required double impactPercent,

    /// Is this positive or negative?
    required bool isPositive,

    /// Correlation strength (0-1)
    required double correlationStrength,

    /// Number of data points
    required int dataPoints,
  }) = _DayBehaviorImpact;

  factory DayBehaviorImpact.fromJson(Map<String, dynamic> json) =>
      _$DayBehaviorImpactFromJson(json);
}

/// Day grade based on overall performance
enum DayGrade {
  excellent, // 80-100
  good, // 60-79
  average, // 40-59
  poor, // 20-39
  veryPoor, // 0-19
}

extension DayGradeExtension on DayGrade {
  static DayGrade fromScore(int score) {
    if (score >= 80) return DayGrade.excellent;
    if (score >= 60) return DayGrade.good;
    if (score >= 40) return DayGrade.average;
    if (score >= 20) return DayGrade.poor;
    return DayGrade.veryPoor;
  }

  String get label {
    switch (this) {
      case DayGrade.excellent:
        return 'Excellent';
      case DayGrade.good:
        return 'Good';
      case DayGrade.average:
        return 'Average';
      case DayGrade.poor:
        return 'Poor';
      case DayGrade.veryPoor:
        return 'Rest Day';
    }
  }

  String get labelAr {
    switch (this) {
      case DayGrade.excellent:
        return 'ممتاز';
      case DayGrade.good:
        return 'جيد';
      case DayGrade.average:
        return 'متوسط';
      case DayGrade.poor:
        return 'ضعيف';
      case DayGrade.veryPoor:
        return 'يوم راحة';
    }
  }

  String get emoji {
    switch (this) {
      case DayGrade.excellent:
        return '🏆';
      case DayGrade.good:
        return '👍';
      case DayGrade.average:
        return '👌';
      case DayGrade.poor:
        return '😐';
      case DayGrade.veryPoor:
        return '😴';
    }
  }
}

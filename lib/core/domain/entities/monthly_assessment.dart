import 'package:freezed_annotation/freezed_annotation.dart';

part 'monthly_assessment.freezed.dart';
part 'monthly_assessment.g.dart';

/// Monthly Performance Assessment entity
/// WHOOP-inspired feature for 30-day analytics and insights
@freezed
class MonthlyAssessment with _$MonthlyAssessment {
  const MonthlyAssessment._();

  const factory MonthlyAssessment({
    required String id,
    required DateTime monthStart,
    required DateTime generatedAt,

    /// Monthly averages
    required MonthlyAverages averages,

    /// Comparison with previous month
    MonthlyComparison? comparison,

    /// Recovery trends
    required TrendAnalysis recoveryTrend,

    /// Strain trends
    required TrendAnalysis strainTrend,

    /// Sleep trends
    required TrendAnalysis sleepTrend,

    /// Top positive behavior correlations
    @Default([]) List<MonthlyBehaviorCorrelation> positiveCorrelations,

    /// Top negative behavior correlations
    @Default([]) List<MonthlyBehaviorCorrelation> negativeCorrelations,

    /// Weekly breakdowns
    @Default([]) List<WeeklyBreakdown> weeklyBreakdowns,

    /// Key insights
    @Default([]) List<MonthlyInsight> insights,

    /// AI-generated summary
    String? aiSummary,

    /// Arabic AI summary
    String? aiSummaryAr,

    /// Best day of the month
    DateTime? bestDay,
    int? bestDayRecovery,

    /// Most challenging day
    DateTime? worstDay,
    int? worstDayRecovery,

    /// Total workout days
    required int workoutDays,

    /// Total rest days
    required int restDays,

    /// Streak data
    MonthlyStreakData? streakData,

    /// Is AI-generated
    @Default(false) bool isAiGenerated,

    /// Data completeness percentage
    @Default(0) int dataCompleteness,
  }) = _MonthlyAssessment;

  factory MonthlyAssessment.fromJson(Map<String, dynamic> json) =>
      _$MonthlyAssessmentFromJson(json);

  /// Get month name
  String getMonthName(String language) {
    final months = language == 'ar'
        ? [
            'يناير', 'فبراير', 'مارس', 'أبريل', 'مايو', 'يونيو',
            'يوليو', 'أغسطس', 'سبتمبر', 'أكتوبر', 'نوفمبر', 'ديسمبر'
          ]
        : [
            'January', 'February', 'March', 'April', 'May', 'June',
            'July', 'August', 'September', 'October', 'November', 'December'
          ];
    return months[monthStart.month - 1];
  }

  /// Get overall grade
  MonthlyGrade get overallGrade {
    final avgRecovery = averages.avgRecovery;
    if (avgRecovery >= 75) return MonthlyGrade.excellent;
    if (avgRecovery >= 60) return MonthlyGrade.good;
    if (avgRecovery >= 45) return MonthlyGrade.average;
    return MonthlyGrade.needsWork;
  }
}

/// Monthly averages
@freezed
class MonthlyAverages with _$MonthlyAverages {
  const factory MonthlyAverages({
    /// Average recovery score
    required double avgRecovery,

    /// Average strain score
    required double avgStrain,

    /// Average sleep hours
    required double avgSleep,

    /// Average HRV
    double? avgHrv,

    /// Average RHR
    double? avgRhr,

    /// Average calories consumed
    int? avgCalories,

    /// Average protein consumed
    int? avgProtein,

    /// Average steps
    int? avgSteps,
  }) = _MonthlyAverages;

  factory MonthlyAverages.fromJson(Map<String, dynamic> json) =>
      _$MonthlyAveragesFromJson(json);
}

/// Month-over-month comparison
@freezed
class MonthlyComparison with _$MonthlyComparison {
  const MonthlyComparison._();

  const factory MonthlyComparison({
    /// Recovery change (percentage points)
    required double recoveryChange,

    /// Strain change
    required double strainChange,

    /// Sleep change (hours)
    required double sleepChange,

    /// HRV change
    double? hrvChange,

    /// RHR change
    double? rhrChange,

    /// Workout days change
    int? workoutDaysChange,
  }) = _MonthlyComparison;

  factory MonthlyComparison.fromJson(Map<String, dynamic> json) =>
      _$MonthlyComparisonFromJson(json);

  /// Is recovery improving?
  bool get isRecoveryImproving => recoveryChange > 0;

  /// Is strain appropriate?
  bool get isStrainAppropriate => strainChange >= -2 && strainChange <= 2;

  /// Is sleep improving?
  bool get isSleepImproving => sleepChange >= 0;
}

/// Trend analysis
@freezed
class TrendAnalysis with _$TrendAnalysis {
  const factory TrendAnalysis({
    required TrendDirection direction,

    /// Percentage change over the month
    required double changePercent,

    /// Weekly values for charting
    @Default([]) List<double> weeklyValues,

    /// Is trend statistically significant?
    @Default(false) bool isSignificant,
  }) = _TrendAnalysis;

  factory TrendAnalysis.fromJson(Map<String, dynamic> json) =>
      _$TrendAnalysisFromJson(json);
}

/// Trend direction
@JsonEnum()
enum TrendDirection {
  @JsonValue('improving')
  improving,

  @JsonValue('stable')
  stable,

  @JsonValue('declining')
  declining,
}

extension TrendDirectionExtension on TrendDirection {
  String get label {
    switch (this) {
      case TrendDirection.improving:
        return 'Improving';
      case TrendDirection.stable:
        return 'Stable';
      case TrendDirection.declining:
        return 'Declining';
    }
  }

  String get labelAr {
    switch (this) {
      case TrendDirection.improving:
        return 'تحسن';
      case TrendDirection.stable:
        return 'مستقر';
      case TrendDirection.declining:
        return 'تراجع';
    }
  }

  String get emoji {
    switch (this) {
      case TrendDirection.improving:
        return '📈';
      case TrendDirection.stable:
        return '➡️';
      case TrendDirection.declining:
        return '📉';
    }
  }

  String get colorHex {
    switch (this) {
      case TrendDirection.improving:
        return '#4CAF50';
      case TrendDirection.stable:
        return '#2196F3';
      case TrendDirection.declining:
        return '#F44336';
    }
  }
}

/// Behavior correlation with recovery
@freezed
class MonthlyBehaviorCorrelation with _$MonthlyBehaviorCorrelation {
  const MonthlyBehaviorCorrelation._();

  const factory MonthlyBehaviorCorrelation({
    required String behaviorId,
    required String behaviorName,
    required String behaviorNameAr,
    required String category,

    /// Correlation coefficient (-1 to 1)
    required double correlation,

    /// Average recovery impact (percentage points)
    required double avgImpact,

    /// Number of times behavior was logged
    required int occurrences,

    /// Is statistically significant (p < 0.05)?
    @Default(false) bool isSignificant,

    /// Confidence level
    @Default(70) int confidence,
  }) = _MonthlyBehaviorCorrelation;

  factory MonthlyBehaviorCorrelation.fromJson(Map<String, dynamic> json) =>
      _$MonthlyBehaviorCorrelationFromJson(json);

  /// Is this a positive correlation?
  bool get isPositive => correlation > 0;

  /// Get formatted impact
  String get formattedImpact {
    final sign = avgImpact >= 0 ? '+' : '';
    return '$sign${avgImpact.toStringAsFixed(1)}%';
  }

  /// Get correlation strength label
  String getStrengthLabel(String language) {
    final absCorr = correlation.abs();
    if (language == 'ar') {
      if (absCorr >= 0.7) return 'قوي';
      if (absCorr >= 0.4) return 'متوسط';
      return 'ضعيف';
    }
    if (absCorr >= 0.7) return 'Strong';
    if (absCorr >= 0.4) return 'Moderate';
    return 'Weak';
  }
}

/// Weekly breakdown
@freezed
class WeeklyBreakdown with _$WeeklyBreakdown {
  const factory WeeklyBreakdown({
    required DateTime weekStart,
    required int weekNumber,
    required double avgRecovery,
    required double avgStrain,
    required double avgSleep,
    required int workoutDays,
    required int restDays,
  }) = _WeeklyBreakdown;

  factory WeeklyBreakdown.fromJson(Map<String, dynamic> json) =>
      _$WeeklyBreakdownFromJson(json);
}

/// Monthly insight
@freezed
class MonthlyInsight with _$MonthlyInsight {
  const factory MonthlyInsight({
    required String id,
    required MonthlyInsightType type,
    required String title,
    required String titleAr,
    required String message,
    required String messageAr,

    /// Priority (1 = highest)
    @Default(3) int priority,

    /// Is actionable?
    @Default(false) bool isActionable,

    /// Suggested action
    String? actionSuggestion,
    String? actionSuggestionAr,
  }) = _MonthlyInsight;

  factory MonthlyInsight.fromJson(Map<String, dynamic> json) =>
      _$MonthlyInsightFromJson(json);
}

/// Monthly insight types
@JsonEnum()
enum MonthlyInsightType {
  @JsonValue('achievement')
  achievement,

  @JsonValue('improvement')
  improvement,

  @JsonValue('concern')
  concern,

  @JsonValue('pattern')
  pattern,

  @JsonValue('recommendation')
  recommendation,
}

extension MonthlyInsightTypeExtension on MonthlyInsightType {
  String get emoji {
    switch (this) {
      case MonthlyInsightType.achievement:
        return '🏆';
      case MonthlyInsightType.improvement:
        return '📈';
      case MonthlyInsightType.concern:
        return '⚠️';
      case MonthlyInsightType.pattern:
        return '🔍';
      case MonthlyInsightType.recommendation:
        return '💡';
    }
  }

  String get colorHex {
    switch (this) {
      case MonthlyInsightType.achievement:
        return '#FFC107';
      case MonthlyInsightType.improvement:
        return '#4CAF50';
      case MonthlyInsightType.concern:
        return '#FF9800';
      case MonthlyInsightType.pattern:
        return '#2196F3';
      case MonthlyInsightType.recommendation:
        return '#9C27B0';
    }
  }
}

/// Monthly streak data
@freezed
class MonthlyStreakData with _$MonthlyStreakData {
  const factory MonthlyStreakData({
    /// Longest recovery streak (70%+)
    required int longestRecoveryStreak,

    /// Longest workout streak
    required int longestWorkoutStreak,

    /// Longest meal logging streak
    required int longestMealStreak,

    /// Days with all metrics logged
    required int completeLogDays,
  }) = _MonthlyStreakData;

  factory MonthlyStreakData.fromJson(Map<String, dynamic> json) =>
      _$MonthlyStreakDataFromJson(json);
}

/// Monthly grade
enum MonthlyGrade {
  excellent,
  good,
  average,
  needsWork,
}

extension MonthlyGradeExtension on MonthlyGrade {
  String get label {
    switch (this) {
      case MonthlyGrade.excellent:
        return 'Excellent';
      case MonthlyGrade.good:
        return 'Good';
      case MonthlyGrade.average:
        return 'Average';
      case MonthlyGrade.needsWork:
        return 'Needs Work';
    }
  }

  String get labelAr {
    switch (this) {
      case MonthlyGrade.excellent:
        return 'ممتاز';
      case MonthlyGrade.good:
        return 'جيد';
      case MonthlyGrade.average:
        return 'متوسط';
      case MonthlyGrade.needsWork:
        return 'يحتاج تحسين';
    }
  }

  String get emoji {
    switch (this) {
      case MonthlyGrade.excellent:
        return '🏆';
      case MonthlyGrade.good:
        return '👏';
      case MonthlyGrade.average:
        return '👌';
      case MonthlyGrade.needsWork:
        return '💪';
    }
  }

  String get colorHex {
    switch (this) {
      case MonthlyGrade.excellent:
        return '#4CAF50';
      case MonthlyGrade.good:
        return '#8BC34A';
      case MonthlyGrade.average:
        return '#FF9800';
      case MonthlyGrade.needsWork:
        return '#F44336';
    }
  }
}

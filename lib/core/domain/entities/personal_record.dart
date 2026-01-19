import 'package:freezed_annotation/freezed_annotation.dart';

part 'personal_record.freezed.dart';
part 'personal_record.g.dart';

/// Personal Record entity for tracking all-time stats
/// WHOOP-inspired feature for tracking personal bests
@freezed
class PersonalRecord with _$PersonalRecord {
  const PersonalRecord._();

  const factory PersonalRecord({
    required String id,
    required RecordCategory category,
    required RecordMetric metric,

    /// Current best value
    required double value,

    /// Formatted value for display
    String? formattedValue,

    /// When this record was achieved
    required DateTime achievedAt,

    /// Previous record value (if any)
    double? previousValue,

    /// Previous record date
    DateTime? previousAchievedAt,

    /// Is this the all-time best?
    @Default(true) bool isAllTime,

    /// Times this record has been broken
    @Default(0) int timesImproved,

    /// Additional context (e.g., workout type)
    String? context,
  }) = _PersonalRecord;

  factory PersonalRecord.fromJson(Map<String, dynamic> json) =>
      _$PersonalRecordFromJson(json);

  /// Check if value breaks this record
  bool wouldBreakRecord(double newValue) {
    return metric.isBetterThan(newValue, value);
  }

  /// Update record with new value
  PersonalRecord updateRecord(double newValue, DateTime newDate) {
    return copyWith(
      previousValue: value,
      previousAchievedAt: achievedAt,
      value: newValue,
      achievedAt: newDate,
      timesImproved: timesImproved + 1,
    );
  }

  /// Get improvement percentage from previous
  double? get improvementPercent {
    if (previousValue == null || previousValue == 0) return null;
    return ((value - previousValue!) / previousValue!.abs()) * 100;
  }

  /// Get formatted display string
  String get displayValue {
    if (formattedValue != null) return formattedValue!;
    return metric.formatValue(value);
  }
}

/// Categories of personal records
@JsonEnum()
enum RecordCategory {
  @JsonValue('recovery')
  recovery,

  @JsonValue('strain')
  strain,

  @JsonValue('sleep')
  sleep,

  @JsonValue('activity')
  activity,

  @JsonValue('nutrition')
  nutrition,

  @JsonValue('streaks')
  streaks,

  @JsonValue('consistency')
  consistency,
}

extension RecordCategoryExtension on RecordCategory {
  String get label {
    switch (this) {
      case RecordCategory.recovery:
        return 'Recovery';
      case RecordCategory.strain:
        return 'Strain';
      case RecordCategory.sleep:
        return 'Sleep';
      case RecordCategory.activity:
        return 'Activity';
      case RecordCategory.nutrition:
        return 'Nutrition';
      case RecordCategory.streaks:
        return 'Streaks';
      case RecordCategory.consistency:
        return 'Consistency';
    }
  }

  String get labelAr {
    switch (this) {
      case RecordCategory.recovery:
        return 'التعافي';
      case RecordCategory.strain:
        return 'الإجهاد';
      case RecordCategory.sleep:
        return 'النوم';
      case RecordCategory.activity:
        return 'النشاط';
      case RecordCategory.nutrition:
        return 'التغذية';
      case RecordCategory.streaks:
        return 'السلاسل';
      case RecordCategory.consistency:
        return 'الالتزام';
    }
  }

  String get emoji {
    switch (this) {
      case RecordCategory.recovery:
        return '💪';
      case RecordCategory.strain:
        return '🔥';
      case RecordCategory.sleep:
        return '😴';
      case RecordCategory.activity:
        return '🏃';
      case RecordCategory.nutrition:
        return '🍎';
      case RecordCategory.streaks:
        return '🔥';
      case RecordCategory.consistency:
        return '📅';
    }
  }
}

/// Specific metrics for records
@JsonEnum()
enum RecordMetric {
  // Recovery metrics (higher is better)
  @JsonValue('highest_recovery')
  highestRecovery,

  @JsonValue('highest_hrv')
  highestHrv,

  @JsonValue('lowest_rhr')
  lowestRhr,

  // Strain metrics (higher is better for some)
  @JsonValue('highest_strain')
  highestStrain,

  @JsonValue('highest_daily_calories_burned')
  highestDailyCaloriesBurned,

  // Sleep metrics
  @JsonValue('longest_sleep')
  longestSleep,

  @JsonValue('best_sleep_quality')
  bestSleepQuality,

  @JsonValue('best_sleep_efficiency')
  bestSleepEfficiency,

  // Activity metrics
  @JsonValue('most_steps')
  mostSteps,

  @JsonValue('longest_workout')
  longestWorkout,

  @JsonValue('most_workouts_week')
  mostWorkoutsWeek,

  @JsonValue('most_active_minutes')
  mostActiveMinutes,

  // Nutrition metrics
  @JsonValue('longest_meal_logging_streak')
  longestMealLoggingStreak,

  @JsonValue('most_consistent_protein')
  mostConsistentProtein,

  // Streak metrics
  @JsonValue('longest_recovery_streak')
  longestRecoveryStreak,

  @JsonValue('longest_workout_streak')
  longestWorkoutStreak,

  @JsonValue('longest_sleep_streak')
  longestSleepStreak,

  @JsonValue('longest_strain_target_streak')
  longestStrainTargetStreak,

  // Consistency metrics
  @JsonValue('most_consistent_week')
  mostConsistentWeek,

  @JsonValue('most_consistent_month')
  mostConsistentMonth,

  @JsonValue('total_workouts')
  totalWorkouts,

  @JsonValue('total_meals_logged')
  totalMealsLogged,
}

extension RecordMetricExtension on RecordMetric {
  String get label {
    switch (this) {
      case RecordMetric.highestRecovery:
        return 'Highest Recovery';
      case RecordMetric.highestHrv:
        return 'Highest HRV';
      case RecordMetric.lowestRhr:
        return 'Lowest RHR';
      case RecordMetric.highestStrain:
        return 'Highest Strain';
      case RecordMetric.highestDailyCaloriesBurned:
        return 'Most Calories Burned';
      case RecordMetric.longestSleep:
        return 'Longest Sleep';
      case RecordMetric.bestSleepQuality:
        return 'Best Sleep Quality';
      case RecordMetric.bestSleepEfficiency:
        return 'Best Sleep Efficiency';
      case RecordMetric.mostSteps:
        return 'Most Steps';
      case RecordMetric.longestWorkout:
        return 'Longest Workout';
      case RecordMetric.mostWorkoutsWeek:
        return 'Most Workouts (Week)';
      case RecordMetric.mostActiveMinutes:
        return 'Most Active Minutes';
      case RecordMetric.longestMealLoggingStreak:
        return 'Meal Logging Streak';
      case RecordMetric.mostConsistentProtein:
        return 'Protein Consistency';
      case RecordMetric.longestRecoveryStreak:
        return 'Recovery Streak';
      case RecordMetric.longestWorkoutStreak:
        return 'Workout Streak';
      case RecordMetric.longestSleepStreak:
        return 'Sleep Streak';
      case RecordMetric.longestStrainTargetStreak:
        return 'Strain Target Streak';
      case RecordMetric.mostConsistentWeek:
        return 'Most Consistent Week';
      case RecordMetric.mostConsistentMonth:
        return 'Most Consistent Month';
      case RecordMetric.totalWorkouts:
        return 'Total Workouts';
      case RecordMetric.totalMealsLogged:
        return 'Total Meals Logged';
    }
  }

  String get labelAr {
    switch (this) {
      case RecordMetric.highestRecovery:
        return 'أعلى تعافي';
      case RecordMetric.highestHrv:
        return 'أعلى HRV';
      case RecordMetric.lowestRhr:
        return 'أقل معدل ضربات';
      case RecordMetric.highestStrain:
        return 'أعلى إجهاد';
      case RecordMetric.highestDailyCaloriesBurned:
        return 'أكثر سعرات محروقة';
      case RecordMetric.longestSleep:
        return 'أطول نوم';
      case RecordMetric.bestSleepQuality:
        return 'أفضل جودة نوم';
      case RecordMetric.bestSleepEfficiency:
        return 'أفضل كفاءة نوم';
      case RecordMetric.mostSteps:
        return 'أكثر خطوات';
      case RecordMetric.longestWorkout:
        return 'أطول تمرين';
      case RecordMetric.mostWorkoutsWeek:
        return 'أكثر تمارين (أسبوع)';
      case RecordMetric.mostActiveMinutes:
        return 'أكثر دقائق نشاط';
      case RecordMetric.longestMealLoggingStreak:
        return 'سلسلة تسجيل الوجبات';
      case RecordMetric.mostConsistentProtein:
        return 'اتساق البروتين';
      case RecordMetric.longestRecoveryStreak:
        return 'سلسلة التعافي';
      case RecordMetric.longestWorkoutStreak:
        return 'سلسلة التمرين';
      case RecordMetric.longestSleepStreak:
        return 'سلسلة النوم';
      case RecordMetric.longestStrainTargetStreak:
        return 'سلسلة هدف الإجهاد';
      case RecordMetric.mostConsistentWeek:
        return 'أكثر أسبوع التزاماً';
      case RecordMetric.mostConsistentMonth:
        return 'أكثر شهر التزاماً';
      case RecordMetric.totalWorkouts:
        return 'إجمالي التمارين';
      case RecordMetric.totalMealsLogged:
        return 'إجمالي الوجبات';
    }
  }

  RecordCategory get category {
    switch (this) {
      case RecordMetric.highestRecovery:
      case RecordMetric.highestHrv:
      case RecordMetric.lowestRhr:
        return RecordCategory.recovery;
      case RecordMetric.highestStrain:
      case RecordMetric.highestDailyCaloriesBurned:
        return RecordCategory.strain;
      case RecordMetric.longestSleep:
      case RecordMetric.bestSleepQuality:
      case RecordMetric.bestSleepEfficiency:
        return RecordCategory.sleep;
      case RecordMetric.mostSteps:
      case RecordMetric.longestWorkout:
      case RecordMetric.mostWorkoutsWeek:
      case RecordMetric.mostActiveMinutes:
        return RecordCategory.activity;
      case RecordMetric.longestMealLoggingStreak:
      case RecordMetric.mostConsistentProtein:
        return RecordCategory.nutrition;
      case RecordMetric.longestRecoveryStreak:
      case RecordMetric.longestWorkoutStreak:
      case RecordMetric.longestSleepStreak:
      case RecordMetric.longestStrainTargetStreak:
        return RecordCategory.streaks;
      case RecordMetric.mostConsistentWeek:
      case RecordMetric.mostConsistentMonth:
      case RecordMetric.totalWorkouts:
      case RecordMetric.totalMealsLogged:
        return RecordCategory.consistency;
    }
  }

  /// Is higher value better?
  bool get higherIsBetter {
    switch (this) {
      case RecordMetric.lowestRhr:
        return false;
      default:
        return true;
    }
  }

  /// Check if newValue is better than currentValue
  bool isBetterThan(double newValue, double currentValue) {
    if (higherIsBetter) {
      return newValue > currentValue;
    }
    return newValue < currentValue;
  }

  /// Format value for display
  String formatValue(double value) {
    switch (this) {
      case RecordMetric.highestRecovery:
      case RecordMetric.bestSleepQuality:
      case RecordMetric.bestSleepEfficiency:
      case RecordMetric.mostConsistentProtein:
        return '${value.round()}%';
      case RecordMetric.highestStrain:
        return value.toStringAsFixed(1);
      case RecordMetric.longestSleep:
        final hours = value.floor();
        final minutes = ((value - hours) * 60).round();
        return '${hours}h ${minutes}m';
      case RecordMetric.highestHrv:
        return '${value.round()} ms';
      case RecordMetric.lowestRhr:
        return '${value.round()} bpm';
      case RecordMetric.mostSteps:
      case RecordMetric.highestDailyCaloriesBurned:
        return _formatNumber(value.round());
      case RecordMetric.longestWorkout:
      case RecordMetric.mostActiveMinutes:
        return '${value.round()} min';
      default:
        return value.round().toString();
    }
  }

  static String _formatNumber(int number) {
    if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}k';
    }
    return number.toString();
  }
}

/// Collection of all personal records
@freezed
class PersonalRecordCollection with _$PersonalRecordCollection {
  const PersonalRecordCollection._();

  const factory PersonalRecordCollection({
    required String userId,
    required DateTime lastUpdated,
    @Default([]) List<PersonalRecord> records,
  }) = _PersonalRecordCollection;

  factory PersonalRecordCollection.fromJson(Map<String, dynamic> json) =>
      _$PersonalRecordCollectionFromJson(json);

  /// Get record for specific metric
  PersonalRecord? getRecord(RecordMetric metric) {
    try {
      return records.firstWhere((r) => r.metric == metric);
    } catch (_) {
      return null;
    }
  }

  /// Get records by category
  List<PersonalRecord> getRecordsByCategory(RecordCategory category) {
    return records.where((r) => r.category == category).toList();
  }

  /// Get recently broken records (last 7 days)
  List<PersonalRecord> get recentRecords {
    final weekAgo = DateTime.now().subtract(const Duration(days: 7));
    return records
        .where((r) => r.achievedAt.isAfter(weekAgo))
        .toList()
      ..sort((a, b) => b.achievedAt.compareTo(a.achievedAt));
  }

  /// Get total number of records
  int get totalRecords => records.length;

  /// Get total improvements
  int get totalImprovements =>
      records.fold(0, (sum, r) => sum + r.timesImproved);
}

/// Summary of all-time stats
@freezed
class AllTimeStats with _$AllTimeStats {
  const factory AllTimeStats({
    required String userId,
    required DateTime calculatedAt,

    /// Total days tracked
    required int totalDaysTracked,

    /// Total workouts completed
    required int totalWorkouts,

    /// Total meals logged
    required int totalMealsLogged,

    /// Total calories burned
    required int totalCaloriesBurned,

    /// Total steps
    required int totalSteps,

    /// Total hours of sleep
    required double totalSleepHours,

    /// Average recovery score
    required double avgRecovery,

    /// Average strain score
    required double avgStrain,

    /// Best week (date + score)
    DateTime? bestWeekDate,
    double? bestWeekScore,

    /// Best month (date + score)
    DateTime? bestMonthDate,
    double? bestMonthScore,

    /// Personal records
    required PersonalRecordCollection records,
  }) = _AllTimeStats;

  factory AllTimeStats.fromJson(Map<String, dynamic> json) =>
      _$AllTimeStatsFromJson(json);
}

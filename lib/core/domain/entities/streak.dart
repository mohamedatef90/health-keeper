import 'package:freezed_annotation/freezed_annotation.dart';

part 'streak.freezed.dart';
part 'streak.g.dart';

/// Streak entity for tracking consecutive days of achievements
/// WHOOP-inspired feature for motivation and engagement
@freezed
class Streak with _$Streak {
  const Streak._();

  const factory Streak({
    required String id,
    required StreakType type,

    /// Current streak count
    required int currentCount,

    /// Longest streak ever
    required int longestEver,

    /// Last day the streak was achieved
    DateTime? lastAchievedAt,

    /// When the current streak started
    DateTime? startedAt,

    /// When the streak was broken (if not active)
    DateTime? brokenAt,

    /// Is the streak currently active?
    required bool isActive,

    /// Milestone reached (7, 30, 100, etc.)
    int? currentMilestone,

    /// Next milestone
    int? nextMilestone,

    /// Days until next milestone
    int? daysToNextMilestone,
  }) = _Streak;

  factory Streak.fromJson(Map<String, dynamic> json) =>
      _$StreakFromJson(json);

  /// Create a new streak
  factory Streak.create({
    required String id,
    required StreakType type,
  }) {
    return Streak(
      id: id,
      type: type,
      currentCount: 0,
      longestEver: 0,
      isActive: false,
    );
  }

  /// Record a success for today
  Streak recordSuccess(DateTime date) {
    final newCount = currentCount + 1;
    final isNewRecord = newCount > longestEver;

    // Calculate milestones
    final milestone = _getMilestone(newCount);
    final nextMilestoneValue = _getNextMilestone(newCount);

    return copyWith(
      currentCount: newCount,
      longestEver: isNewRecord ? newCount : longestEver,
      lastAchievedAt: date,
      startedAt: currentCount == 0 ? date : startedAt,
      brokenAt: null,
      isActive: true,
      currentMilestone: milestone,
      nextMilestone: nextMilestoneValue,
      daysToNextMilestone: nextMilestoneValue != null
          ? nextMilestoneValue - newCount
          : null,
    );
  }

  /// Break the streak
  Streak breakStreak(DateTime date) {
    return copyWith(
      currentCount: 0,
      brokenAt: date,
      isActive: false,
      startedAt: null,
      currentMilestone: null,
      nextMilestone: 7,
      daysToNextMilestone: 7,
    );
  }

  static int? _getMilestone(int count) {
    const milestones = [7, 14, 21, 30, 60, 90, 100, 180, 365];
    for (final m in milestones.reversed) {
      if (count >= m) return m;
    }
    return null;
  }

  static int? _getNextMilestone(int count) {
    const milestones = [7, 14, 21, 30, 60, 90, 100, 180, 365];
    for (final m in milestones) {
      if (count < m) return m;
    }
    return null;
  }

  /// Is this a new record?
  bool get isNewRecord => currentCount == longestEver && currentCount > 0;

  /// Get progress to next milestone (0.0 to 1.0)
  double get progressToNextMilestone {
    if (nextMilestone == null) return 1.0;
    final currentMilestoneValue = currentMilestone ?? 0;
    final progress = (currentCount - currentMilestoneValue) /
        (nextMilestone! - currentMilestoneValue);
    return progress.clamp(0.0, 1.0);
  }

  /// Get status message
  String getStatusMessage(String language) {
    if (!isActive) {
      return language == 'ar' ? 'ابدأ سلسلتك!' : 'Start your streak!';
    }
    if (currentMilestone != null && currentCount == currentMilestone) {
      return language == 'ar'
          ? 'أحسنت! وصلت لـ $currentMilestone يوم!'
          : 'Amazing! You hit $currentMilestone days!';
    }
    if (isNewRecord) {
      return language == 'ar'
          ? 'رقم قياسي جديد!'
          : 'New personal record!';
    }
    return language == 'ar'
        ? '$currentCount يوم متتالي'
        : '$currentCount day streak';
  }
}

/// Types of streaks to track
@JsonEnum()
enum StreakType {
  @JsonValue('strain_target')
  strainTarget,

  @JsonValue('optimal_sleep')
  optimalSleep,

  @JsonValue('high_recovery')
  highRecovery,

  @JsonValue('meal_logging')
  mealLogging,

  @JsonValue('workout_complete')
  workoutComplete,

  @JsonValue('journal_entry')
  journalEntry,

  @JsonValue('weight_logging')
  weightLogging,

  @JsonValue('step_goal')
  stepGoal,
}

extension StreakTypeExtension on StreakType {
  String get label {
    switch (this) {
      case StreakType.strainTarget:
        return 'Strain Target';
      case StreakType.optimalSleep:
        return 'Optimal Sleep';
      case StreakType.highRecovery:
        return 'High Recovery';
      case StreakType.mealLogging:
        return 'Meal Logging';
      case StreakType.workoutComplete:
        return 'Workout';
      case StreakType.journalEntry:
        return 'Journal';
      case StreakType.weightLogging:
        return 'Weight Tracking';
      case StreakType.stepGoal:
        return 'Step Goal';
    }
  }

  String get labelAr {
    switch (this) {
      case StreakType.strainTarget:
        return 'هدف الإجهاد';
      case StreakType.optimalSleep:
        return 'نوم مثالي';
      case StreakType.highRecovery:
        return 'تعافي عالي';
      case StreakType.mealLogging:
        return 'تسجيل الوجبات';
      case StreakType.workoutComplete:
        return 'التمرين';
      case StreakType.journalEntry:
        return 'اليومية';
      case StreakType.weightLogging:
        return 'تتبع الوزن';
      case StreakType.stepGoal:
        return 'هدف الخطوات';
    }
  }

  String get description {
    switch (this) {
      case StreakType.strainTarget:
        return 'Meet daily strain target';
      case StreakType.optimalSleep:
        return 'Get recommended sleep';
      case StreakType.highRecovery:
        return 'Achieve 70%+ recovery';
      case StreakType.mealLogging:
        return 'Log all meals';
      case StreakType.workoutComplete:
        return 'Complete a workout';
      case StreakType.journalEntry:
        return 'Make a journal entry';
      case StreakType.weightLogging:
        return 'Log your weight';
      case StreakType.stepGoal:
        return 'Hit step goal';
    }
  }

  String get descriptionAr {
    switch (this) {
      case StreakType.strainTarget:
        return 'تحقيق هدف الإجهاد اليومي';
      case StreakType.optimalSleep:
        return 'الحصول على النوم المطلوب';
      case StreakType.highRecovery:
        return 'تحقيق تعافي 70%+';
      case StreakType.mealLogging:
        return 'تسجيل جميع الوجبات';
      case StreakType.workoutComplete:
        return 'إكمال تمرين';
      case StreakType.journalEntry:
        return 'إضافة إدخال يومية';
      case StreakType.weightLogging:
        return 'تسجيل وزنك';
      case StreakType.stepGoal:
        return 'تحقيق هدف الخطوات';
    }
  }

  String get emoji {
    switch (this) {
      case StreakType.strainTarget:
        return '🎯';
      case StreakType.optimalSleep:
        return '😴';
      case StreakType.highRecovery:
        return '💪';
      case StreakType.mealLogging:
        return '🍎';
      case StreakType.workoutComplete:
        return '🏋️';
      case StreakType.journalEntry:
        return '📝';
      case StreakType.weightLogging:
        return '⚖️';
      case StreakType.stepGoal:
        return '👟';
    }
  }

  String get colorHex {
    switch (this) {
      case StreakType.strainTarget:
        return '#FF5722';
      case StreakType.optimalSleep:
        return '#673AB7';
      case StreakType.highRecovery:
        return '#4CAF50';
      case StreakType.mealLogging:
        return '#8BC34A';
      case StreakType.workoutComplete:
        return '#2196F3';
      case StreakType.journalEntry:
        return '#FFC107';
      case StreakType.weightLogging:
        return '#9C27B0';
      case StreakType.stepGoal:
        return '#00BCD4';
    }
  }
}

/// Collection of user's streaks
@freezed
class StreakCollection with _$StreakCollection {
  const StreakCollection._();

  const factory StreakCollection({
    required String userId,
    required DateTime lastUpdated,
    @Default([]) List<Streak> streaks,
  }) = _StreakCollection;

  factory StreakCollection.fromJson(Map<String, dynamic> json) =>
      _$StreakCollectionFromJson(json);

  /// Get streak by type
  Streak? getStreak(StreakType type) {
    try {
      return streaks.firstWhere((s) => s.type == type);
    } catch (_) {
      return null;
    }
  }

  /// Get active streaks
  List<Streak> get activeStreaks =>
      streaks.where((s) => s.isActive).toList();

  /// Get total active streak days
  int get totalActiveStreakDays =>
      activeStreaks.fold(0, (sum, s) => sum + s.currentCount);

  /// Get longest current streak
  Streak? get longestCurrentStreak {
    if (activeStreaks.isEmpty) return null;
    return activeStreaks.reduce(
      (a, b) => a.currentCount > b.currentCount ? a : b,
    );
  }

  /// Get all-time longest streak
  Streak? get allTimeLongestStreak {
    if (streaks.isEmpty) return null;
    return streaks.reduce(
      (a, b) => a.longestEver > b.longestEver ? a : b,
    );
  }
}

/// Streak milestone celebration
@freezed
class StreakMilestone with _$StreakMilestone {
  const factory StreakMilestone({
    required StreakType streakType,
    required int milestone,
    required DateTime achievedAt,
    required String title,
    required String titleAr,
    required String message,
    required String messageAr,
    @Default(false) bool celebrated,
  }) = _StreakMilestone;

  factory StreakMilestone.fromJson(Map<String, dynamic> json) =>
      _$StreakMilestoneFromJson(json);

  /// Create milestone based on count
  factory StreakMilestone.forCount({
    required StreakType type,
    required int count,
    required DateTime achievedAt,
  }) {
    final (title, titleAr, message, messageAr) = _getMilestoneText(type, count);
    return StreakMilestone(
      streakType: type,
      milestone: count,
      achievedAt: achievedAt,
      title: title,
      titleAr: titleAr,
      message: message,
      messageAr: messageAr,
    );
  }

  static (String, String, String, String) _getMilestoneText(
    StreakType type,
    int count,
  ) {
    switch (count) {
      case 7:
        return (
          '1 Week Streak!',
          'سلسلة أسبوع!',
          'You\'ve maintained your ${type.label} streak for a week!',
          'حافظت على سلسلة ${type.labelAr} لمدة أسبوع!',
        );
      case 14:
        return (
          '2 Week Streak!',
          'سلسلة أسبوعين!',
          'Two weeks strong! Keep it up!',
          'أسبوعان قوياً! استمر!',
        );
      case 30:
        return (
          '1 Month Streak!',
          'سلسلة شهر!',
          'Amazing! A full month of consistency!',
          'رائع! شهر كامل من الالتزام!',
        );
      case 100:
        return (
          '100 Day Streak!',
          'سلسلة 100 يوم!',
          'Incredible dedication! You\'re a champion!',
          'تفاني مذهل! أنت بطل!',
        );
      default:
        return (
          '$count Day Streak!',
          'سلسلة $count يوم!',
          'Great job maintaining your streak!',
          'عمل رائع في الحفاظ على سلسلتك!',
        );
    }
  }
}

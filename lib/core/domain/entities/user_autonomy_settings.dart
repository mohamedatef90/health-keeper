import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_autonomy_settings.freezed.dart';
part 'user_autonomy_settings.g.dart';

/// Level of autonomy for AI auto-apply decisions
@JsonEnum()
enum AutoApplyLevel {
  /// Always ask user before making any changes
  @JsonValue('conservative')
  conservative,

  /// Safe changes auto-apply, risky changes ask
  @JsonValue('moderate')
  moderate,

  /// Most changes auto-apply, only major changes ask
  @JsonValue('aggressive')
  aggressive,
}

/// Notification frequency preference
@JsonEnum()
enum NotificationFrequency {
  /// Minimal notifications (only critical)
  @JsonValue('minimal')
  minimal,

  /// Normal notifications (important updates)
  @JsonValue('normal')
  normal,

  /// All notifications (proactive coaching)
  @JsonValue('all')
  all,
}

/// User autonomy settings for AI Brain
@freezed
class UserAutonomySettings with _$UserAutonomySettings {
  const UserAutonomySettings._();

  const factory UserAutonomySettings({
    required String id,

    /// Overall autonomy level
    @Default(AutoApplyLevel.moderate) AutoApplyLevel autoApplyLevel,

    /// Notification frequency preference
    @Default(NotificationFrequency.normal) NotificationFrequency notificationFrequency,

    // ==========================================
    // Specific auto-apply permissions
    // ==========================================

    /// Can AI auto-adjust daily calorie targets?
    @Default(true) bool canAutoAdjustCalories,

    /// Can AI auto-adjust protein targets?
    @Default(true) bool canAutoAdjustProtein,

    /// Can AI automatically add rest days? (conservative by default)
    @Default(false) bool canAutoAddRestDay,

    /// Can AI automatically remove/skip workouts? (conservative by default)
    @Default(false) bool canAutoRemoveWorkout,

    /// Can AI auto-adjust workout intensity?
    @Default(true) bool canAutoAdjustIntensity,

    /// Can AI auto-adjust meal timing?
    @Default(true) bool canAutoAdjustMealTiming,

    /// Can AI auto-send proactive notifications?
    @Default(true) bool canAutoSendNotifications,

    // ==========================================
    // Quiet hours configuration
    // ==========================================

    /// Whether quiet hours are enabled
    @Default(true) bool quietHoursEnabled,

    /// Quiet hours start (24-hour format, e.g., 22 for 10pm)
    @Default(22) int quietHoursStart,

    /// Quiet hours end (24-hour format, e.g., 7 for 7am)
    @Default(7) int quietHoursEnd,

    // ==========================================
    // AI behavior preferences
    // ==========================================

    /// Preferred language for AI responses
    @Default('ar') String aiLanguage,

    /// Coaching tone preference
    @Default('supportive') String coachingTone,

    /// Show AI reasoning in responses
    @Default(false) bool showAiReasoning,

    /// Enable experimental AI features
    @Default(false) bool enableExperimentalFeatures,

    // ==========================================
    // Thresholds for auto-adjustments
    // ==========================================

    /// Minimum recovery score to allow intensity increase (0-100)
    @Default(60) int minRecoveryForIntensityIncrease,

    /// Maximum calorie adjustment per day (absolute value)
    @Default(300) int maxCalorieAdjustmentPerDay,

    /// Maximum protein adjustment per day (grams)
    @Default(30) int maxProteinAdjustmentPerDay,

    /// Days of low recovery before suggesting rest day
    @Default(2) int lowRecoveryDaysBeforeRestSuggestion,

    // ==========================================
    // Timestamps
    // ==========================================

    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserAutonomySettings;

  factory UserAutonomySettings.fromJson(Map<String, dynamic> json) =>
      _$UserAutonomySettingsFromJson(json);

  /// Create default settings for a new user
  factory UserAutonomySettings.defaults({required String id}) => UserAutonomySettings(
        id: id,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

  /// Check if current time is within quiet hours
  bool isInQuietHours() {
    if (!quietHoursEnabled) return false;

    final now = DateTime.now();
    final currentHour = now.hour;

    // Handle overnight quiet hours (e.g., 22:00 to 07:00)
    if (quietHoursStart > quietHoursEnd) {
      return currentHour >= quietHoursStart || currentHour < quietHoursEnd;
    }

    // Handle same-day quiet hours (e.g., 13:00 to 15:00)
    return currentHour >= quietHoursStart && currentHour < quietHoursEnd;
  }

  /// Check if AI can auto-apply a decision of given type
  bool canAutoApply({
    required String decisionType,
    required int impactScore,
  }) {
    // Check quiet hours for notifications
    if (decisionType == 'send_notification' && isInQuietHours()) {
      return false;
    }

    // Check specific permissions based on decision type
    switch (decisionType) {
      case 'adjust_calories':
        return canAutoAdjustCalories &&
            (autoApplyLevel != AutoApplyLevel.conservative);
      case 'adjust_protein':
        return canAutoAdjustProtein &&
            (autoApplyLevel != AutoApplyLevel.conservative);
      case 'add_rest_day':
        return canAutoAddRestDay &&
            autoApplyLevel == AutoApplyLevel.aggressive;
      case 'remove_workout':
        return canAutoRemoveWorkout &&
            autoApplyLevel == AutoApplyLevel.aggressive;
      case 'adjust_intensity':
        return canAutoAdjustIntensity &&
            (autoApplyLevel != AutoApplyLevel.conservative);
      case 'adjust_meal_timing':
        return canAutoAdjustMealTiming &&
            (autoApplyLevel != AutoApplyLevel.conservative);
      case 'send_notification':
        return canAutoSendNotifications;
      default:
        break;
    }

    // General rule based on impact score and autonomy level
    switch (autoApplyLevel) {
      case AutoApplyLevel.conservative:
        return false; // Always ask
      case AutoApplyLevel.moderate:
        return impactScore < 40; // Auto-apply low-impact only
      case AutoApplyLevel.aggressive:
        return impactScore < 70; // Auto-apply low and medium impact
    }
  }

  /// Check if should send notification based on frequency preference
  bool shouldSendNotification({
    required String priority,
    bool isUrgent = false,
  }) {
    if (isInQuietHours() && !isUrgent) return false;

    switch (notificationFrequency) {
      case NotificationFrequency.minimal:
        return priority == 'critical' || isUrgent;
      case NotificationFrequency.normal:
        return priority == 'critical' || priority == 'high' || isUrgent;
      case NotificationFrequency.all:
        return true;
    }
  }
}

/// Notification priority levels
class NotificationPriority {
  static const String critical = 'critical';
  static const String high = 'high';
  static const String medium = 'medium';
  static const String low = 'low';
}

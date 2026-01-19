import 'package:freezed_annotation/freezed_annotation.dart';

import 'strain_target.dart';

part 'daily_outlook.freezed.dart';
part 'daily_outlook.g.dart';

/// Daily Outlook entity for morning briefing
/// WHOOP-inspired feature providing personalized morning recommendations
@freezed
class DailyOutlook with _$DailyOutlook {
  const DailyOutlook._();

  const factory DailyOutlook({
    required String id,
    required DateTime date,
    required DateTime generatedAt,

    /// Recovery score for today
    required int recoveryScore,

    /// Recovery state (peak, good, moderate, low, rest)
    required RecoveryOutlookState recoveryState,

    /// Strain target for today
    required StrainTarget strainTarget,

    /// Sleep data from last night
    required SleepOutlook sleepOutlook,

    /// Sleep need for tonight
    required double sleepNeedHours,

    /// Recommended bedtime for tonight
    DateTime? recommendedBedtime,

    /// Recommended activities for today
    @Default([]) List<RecommendedActivity> recommendedActivities,

    /// Behaviors to track today
    @Default([]) List<String> behaviorsToTrack,

    /// Key insights for the day
    @Default([]) List<OutlookInsight> insights,

    /// AI-generated personalized message
    String? aiInsight,

    /// Arabic AI insight
    String? aiInsightAr,

    /// Whether this is AI-generated or rule-based
    @Default(false) bool isAiGenerated,

    /// Confidence score (0-100)
    @Default(70) int confidence,
  }) = _DailyOutlook;

  factory DailyOutlook.fromJson(Map<String, dynamic> json) =>
      _$DailyOutlookFromJson(json);

  /// Get greeting based on time of day
  String getGreeting(String language) {
    final hour = DateTime.now().hour;
    if (language == 'ar') {
      if (hour < 12) return 'صباح الخير!';
      if (hour < 17) return 'مساء الخير!';
      return 'مساء الخير!';
    }
    if (hour < 12) return 'Good morning!';
    if (hour < 17) return 'Good afternoon!';
    return 'Good evening!';
  }

  /// Get main message based on recovery state
  String getMainMessage(String language) {
    if (language == 'ar') {
      switch (recoveryState) {
        case RecoveryOutlookState.peak:
          return 'جاهزية قصوى! يوم مثالي للتمرين المكثف.';
        case RecoveryOutlookState.good:
          return 'تعافي جيد. يمكنك التمرين بشكل طبيعي.';
        case RecoveryOutlookState.moderate:
          return 'تعافي معتدل. استمع لجسمك اليوم.';
        case RecoveryOutlookState.low:
          return 'تعافي منخفض. ركز على النشاط الخفيف.';
        case RecoveryOutlookState.rest:
          return 'جسمك يحتاج راحة. أعطِ الأولوية للتعافي.';
      }
    }
    switch (recoveryState) {
      case RecoveryOutlookState.peak:
        return 'Peak readiness! Great day for intense training.';
      case RecoveryOutlookState.good:
        return 'Good recovery. You can train normally.';
      case RecoveryOutlookState.moderate:
        return 'Moderate recovery. Listen to your body today.';
      case RecoveryOutlookState.low:
        return 'Low recovery. Focus on light activity.';
      case RecoveryOutlookState.rest:
        return 'Your body needs rest. Prioritize recovery.';
    }
  }
}

/// Recovery state for outlook
@JsonEnum()
enum RecoveryOutlookState {
  @JsonValue('peak')
  peak,

  @JsonValue('good')
  good,

  @JsonValue('moderate')
  moderate,

  @JsonValue('low')
  low,

  @JsonValue('rest')
  rest,
}

extension RecoveryOutlookStateExtension on RecoveryOutlookState {
  static RecoveryOutlookState fromScore(int score) {
    if (score >= 80) return RecoveryOutlookState.peak;
    if (score >= 60) return RecoveryOutlookState.good;
    if (score >= 40) return RecoveryOutlookState.moderate;
    if (score >= 20) return RecoveryOutlookState.low;
    return RecoveryOutlookState.rest;
  }

  String get label {
    switch (this) {
      case RecoveryOutlookState.peak:
        return 'Peak';
      case RecoveryOutlookState.good:
        return 'Good';
      case RecoveryOutlookState.moderate:
        return 'Moderate';
      case RecoveryOutlookState.low:
        return 'Low';
      case RecoveryOutlookState.rest:
        return 'Rest';
    }
  }

  String get labelAr {
    switch (this) {
      case RecoveryOutlookState.peak:
        return 'ذروة';
      case RecoveryOutlookState.good:
        return 'جيد';
      case RecoveryOutlookState.moderate:
        return 'معتدل';
      case RecoveryOutlookState.low:
        return 'منخفض';
      case RecoveryOutlookState.rest:
        return 'راحة';
    }
  }

  String get colorHex {
    switch (this) {
      case RecoveryOutlookState.peak:
        return '#4CAF50'; // Green
      case RecoveryOutlookState.good:
        return '#8BC34A'; // Light Green
      case RecoveryOutlookState.moderate:
        return '#FFEB3B'; // Yellow
      case RecoveryOutlookState.low:
        return '#FF9800'; // Orange
      case RecoveryOutlookState.rest:
        return '#F44336'; // Red
    }
  }
}

/// Sleep outlook from last night
@freezed
class SleepOutlook with _$SleepOutlook {
  const SleepOutlook._();

  const factory SleepOutlook({
    /// Hours of sleep
    required double hoursSlept,

    /// Sleep quality score (0-100)
    int? qualityScore,

    /// Hours needed
    required double hoursNeeded,

    /// Sleep efficiency percentage
    int? efficiency,

    /// Did meet sleep need?
    required bool metNeed,
  }) = _SleepOutlook;

  factory SleepOutlook.fromJson(Map<String, dynamic> json) =>
      _$SleepOutlookFromJson(json);

  /// Get sleep performance percentage
  double get performance => hoursNeeded > 0 ? (hoursSlept / hoursNeeded) : 0;

  /// Get sleep deficit/surplus
  double get difference => hoursSlept - hoursNeeded;

  /// Get formatted hours slept
  String get formattedHoursSlept {
    final hours = hoursSlept.floor();
    final minutes = ((hoursSlept - hours) * 60).round();
    if (minutes == 0) return '${hours}h';
    return '${hours}h ${minutes}m';
  }

  /// Get status message
  String getStatusMessage(String language) {
    if (language == 'ar') {
      if (difference >= 0.5) return 'نوم ممتاز!';
      if (difference >= 0) return 'حققت هدفك';
      if (difference >= -1) return 'أقل قليلاً من الهدف';
      return 'عجز كبير في النوم';
    }
    if (difference >= 0.5) return 'Excellent sleep!';
    if (difference >= 0) return 'You met your need';
    if (difference >= -1) return 'Slightly under target';
    return 'Significant sleep deficit';
  }
}

/// Recommended activity for today
@freezed
class RecommendedActivity with _$RecommendedActivity {
  const factory RecommendedActivity({
    required String id,
    required String type,
    required String name,
    required String nameAr,
    required String description,
    required String descriptionAr,

    /// Duration in minutes
    required int durationMinutes,

    /// Intensity (1-5)
    required int intensity,

    /// Expected strain contribution
    required double expectedStrain,

    /// Is this the primary recommendation?
    @Default(false) bool isPrimary,

    /// Icon name for UI
    String? iconName,
  }) = _RecommendedActivity;

  factory RecommendedActivity.fromJson(Map<String, dynamic> json) =>
      _$RecommendedActivityFromJson(json);
}

/// Insight for daily outlook
@freezed
class OutlookInsight with _$OutlookInsight {
  const factory OutlookInsight({
    required String id,
    required OutlookInsightType type,
    required String title,
    required String titleAr,
    required String message,
    required String messageAr,

    /// Priority (1 = highest)
    @Default(3) int priority,

    /// Is this actionable?
    @Default(false) bool isActionable,

    /// Action if actionable
    String? actionType,
  }) = _OutlookInsight;

  factory OutlookInsight.fromJson(Map<String, dynamic> json) =>
      _$OutlookInsightFromJson(json);
}

/// Types of insights
@JsonEnum()
enum OutlookInsightType {
  @JsonValue('recovery')
  recovery,

  @JsonValue('sleep')
  sleep,

  @JsonValue('strain')
  strain,

  @JsonValue('nutrition')
  nutrition,

  @JsonValue('trend')
  trend,

  @JsonValue('alert')
  alert,

  @JsonValue('achievement')
  achievement,
}

extension OutlookInsightTypeExtension on OutlookInsightType {
  String get emoji {
    switch (this) {
      case OutlookInsightType.recovery:
        return '💪';
      case OutlookInsightType.sleep:
        return '😴';
      case OutlookInsightType.strain:
        return '🏃';
      case OutlookInsightType.nutrition:
        return '🍎';
      case OutlookInsightType.trend:
        return '📈';
      case OutlookInsightType.alert:
        return '⚠️';
      case OutlookInsightType.achievement:
        return '🏆';
    }
  }

  String get colorHex {
    switch (this) {
      case OutlookInsightType.recovery:
        return '#4CAF50';
      case OutlookInsightType.sleep:
        return '#673AB7';
      case OutlookInsightType.strain:
        return '#FF5722';
      case OutlookInsightType.nutrition:
        return '#8BC34A';
      case OutlookInsightType.trend:
        return '#2196F3';
      case OutlookInsightType.alert:
        return '#FF9800';
      case OutlookInsightType.achievement:
        return '#FFC107';
    }
  }
}

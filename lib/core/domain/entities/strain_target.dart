import 'package:freezed_annotation/freezed_annotation.dart';

part 'strain_target.freezed.dart';
part 'strain_target.g.dart';

/// Strain target entity for real-time strain coaching
/// Based on WHOOP-inspired recovery-based strain recommendations
@freezed
class StrainTarget with _$StrainTarget {
  const StrainTarget._();

  const factory StrainTarget({
    required String id,
    required DateTime date,
    required DateTime calculatedAt,

    /// Recovery score used to calculate target
    required int recoveryScore,

    /// Minimum recommended strain for the day
    required double minStrain,

    /// Maximum recommended strain for the day
    required double maxStrain,

    /// Optimal strain target (middle of range)
    required double optimalStrain,

    /// Current strain achieved so far
    @Default(0.0) double currentStrain,

    /// Whether target has been met
    @Default(false) bool targetMet,

    /// Suggested workout intensity (1-5)
    required StrainIntensity suggestedIntensity,

    /// Recommendation message
    required String recommendation,

    /// Arabic recommendation message
    required String recommendationAr,

    /// Detailed guidance
    String? guidance,

    /// Arabic detailed guidance
    String? guidanceAr,
  }) = _StrainTarget;

  factory StrainTarget.fromJson(Map<String, dynamic> json) =>
      _$StrainTargetFromJson(json);

  /// Calculate strain target from recovery score
  factory StrainTarget.fromRecovery({
    required String id,
    required DateTime date,
    required int recoveryScore,
    double currentStrain = 0.0,
  }) {
    final intensity = StrainIntensityExtension.fromRecovery(recoveryScore);
    final (min, max, optimal) = _calculateStrainRange(recoveryScore);

    return StrainTarget(
      id: id,
      date: date,
      calculatedAt: DateTime.now(),
      recoveryScore: recoveryScore,
      minStrain: min,
      maxStrain: max,
      optimalStrain: optimal,
      currentStrain: currentStrain,
      targetMet: currentStrain >= min,
      suggestedIntensity: intensity,
      recommendation: intensity.recommendation,
      recommendationAr: intensity.recommendationAr,
      guidance: intensity.guidance,
      guidanceAr: intensity.guidanceAr,
    );
  }

  static (double, double, double) _calculateStrainRange(int recovery) {
    if (recovery >= 85) {
      return (14.0, 18.0, 16.0);
    } else if (recovery >= 70) {
      return (10.0, 14.0, 12.0);
    } else if (recovery >= 55) {
      return (6.0, 10.0, 8.0);
    } else if (recovery >= 40) {
      return (3.0, 6.0, 4.5);
    } else {
      return (0.0, 3.0, 1.5);
    }
  }

  /// Progress towards strain target (0.0 to 1.0+)
  double get progress {
    if (optimalStrain <= 0) return currentStrain > 0 ? 1.0 : 0.0;
    return currentStrain / optimalStrain;
  }

  /// Percentage progress for display
  int get progressPercent => (progress * 100).clamp(0, 150).round();

  /// Check if currently within optimal range
  bool get isInOptimalRange =>
      currentStrain >= minStrain && currentStrain <= maxStrain;

  /// Check if strain is too high for recovery
  bool get isOverReaching => currentStrain > maxStrain;

  /// Check if more strain is recommended
  bool get shouldPushMore => currentStrain < minStrain;

  /// Get status message based on current progress
  String get statusMessage {
    if (isOverReaching) return 'Consider easing off';
    if (targetMet && isInOptimalRange) return 'On target';
    if (shouldPushMore) return 'Room for more activity';
    return 'Great progress';
  }

  /// Get Arabic status message
  String get statusMessageAr {
    if (isOverReaching) return 'فكر في التخفيف';
    if (targetMet && isInOptimalRange) return 'في المسار الصحيح';
    if (shouldPushMore) return 'يمكنك بذل المزيد';
    return 'تقدم رائع';
  }
}

/// Strain intensity levels based on recovery
@JsonEnum()
enum StrainIntensity {
  @JsonValue('rest')
  rest,

  @JsonValue('light')
  light,

  @JsonValue('moderate')
  moderate,

  @JsonValue('intense')
  intense,

  @JsonValue('allOut')
  allOut,
}

extension StrainIntensityExtension on StrainIntensity {
  /// Get intensity from recovery score
  static StrainIntensity fromRecovery(int recoveryScore) {
    if (recoveryScore >= 85) return StrainIntensity.allOut;
    if (recoveryScore >= 70) return StrainIntensity.intense;
    if (recoveryScore >= 55) return StrainIntensity.moderate;
    if (recoveryScore >= 40) return StrainIntensity.light;
    return StrainIntensity.rest;
  }

  /// Get intensity value (1-5)
  int get value {
    switch (this) {
      case StrainIntensity.rest:
        return 1;
      case StrainIntensity.light:
        return 2;
      case StrainIntensity.moderate:
        return 3;
      case StrainIntensity.intense:
        return 4;
      case StrainIntensity.allOut:
        return 5;
    }
  }

  /// Get label
  String get label {
    switch (this) {
      case StrainIntensity.rest:
        return 'Rest';
      case StrainIntensity.light:
        return 'Light';
      case StrainIntensity.moderate:
        return 'Moderate';
      case StrainIntensity.intense:
        return 'Intense';
      case StrainIntensity.allOut:
        return 'All Out';
    }
  }

  /// Get Arabic label
  String get labelAr {
    switch (this) {
      case StrainIntensity.rest:
        return 'راحة';
      case StrainIntensity.light:
        return 'خفيف';
      case StrainIntensity.moderate:
        return 'معتدل';
      case StrainIntensity.intense:
        return 'مكثف';
      case StrainIntensity.allOut:
        return 'أقصى جهد';
    }
  }

  /// Get recommendation message
  String get recommendation {
    switch (this) {
      case StrainIntensity.rest:
        return 'Focus on recovery today';
      case StrainIntensity.light:
        return 'Light activity recommended';
      case StrainIntensity.moderate:
        return 'Good day for moderate training';
      case StrainIntensity.intense:
        return 'Ready for intense workout';
      case StrainIntensity.allOut:
        return 'Go all out today!';
    }
  }

  /// Get Arabic recommendation
  String get recommendationAr {
    switch (this) {
      case StrainIntensity.rest:
        return 'ركز على التعافي اليوم';
      case StrainIntensity.light:
        return 'نشاط خفيف مناسب';
      case StrainIntensity.moderate:
        return 'يوم جيد للتمرين المعتدل';
      case StrainIntensity.intense:
        return 'جاهز لتمرين مكثف';
      case StrainIntensity.allOut:
        return 'أعطِ أقصى جهدك اليوم!';
    }
  }

  /// Get detailed guidance
  String get guidance {
    switch (this) {
      case StrainIntensity.rest:
        return 'Your body needs recovery. Light stretching, walking, or meditation are ideal.';
      case StrainIntensity.light:
        return 'Easy does it today. Consider yoga, light walking, or mobility work.';
      case StrainIntensity.moderate:
        return 'You can handle a solid workout. Strength training or steady cardio is appropriate.';
      case StrainIntensity.intense:
        return 'Your recovery is strong. Push yourself with HIIT, heavy lifts, or long runs.';
      case StrainIntensity.allOut:
        return 'Peak readiness! This is a great day for competition, PRs, or maximum effort.';
    }
  }

  /// Get Arabic detailed guidance
  String get guidanceAr {
    switch (this) {
      case StrainIntensity.rest:
        return 'جسمك يحتاج للتعافي. التمدد الخفيف أو المشي أو التأمل مثالي.';
      case StrainIntensity.light:
        return 'خذها ببساطة اليوم. اليوغا أو المشي الخفيف أو تمارين المرونة مناسبة.';
      case StrainIntensity.moderate:
        return 'يمكنك التعامل مع تمرين جيد. تمارين القوة أو الكارديو الثابت مناسب.';
      case StrainIntensity.intense:
        return 'تعافيك قوي. تحدَّ نفسك بـ HIIT أو رفع أثقال ثقيلة أو جري طويل.';
      case StrainIntensity.allOut:
        return 'جاهزية قصوى! يوم رائع للمنافسة أو تحطيم الأرقام القياسية.';
    }
  }

  /// Get color hex for this intensity
  String get colorHex {
    switch (this) {
      case StrainIntensity.rest:
        return '#9E9E9E'; // Grey
      case StrainIntensity.light:
        return '#4CAF50'; // Green
      case StrainIntensity.moderate:
        return '#2196F3'; // Blue
      case StrainIntensity.intense:
        return '#FF9800'; // Orange
      case StrainIntensity.allOut:
        return '#F44336'; // Red
    }
  }
}

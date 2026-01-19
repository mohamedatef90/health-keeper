import 'package:freezed_annotation/freezed_annotation.dart';

part 'healthspan.freezed.dart';
part 'healthspan.g.dart';

/// Healthspan / Biological Age entity
/// WHOOP-inspired feature for estimating biological age
@freezed
class Healthspan with _$Healthspan {
  const Healthspan._();

  const factory Healthspan({
    required String id,
    required DateTime calculatedAt,

    /// User's chronological age
    required int chronologicalAge,

    /// Calculated biological age
    required int biologicalAge,

    /// Age difference (negative = younger)
    required int ageDifference,

    /// Individual factor contributions
    required HealthspanFactors factors,

    /// Historical trend (last 6 months)
    @Default([]) List<HealthspanHistoryPoint> history,

    /// Recommendations for improvement
    @Default([]) List<HealthspanRecommendation> recommendations,

    /// AI-generated insight
    String? aiInsight,

    /// Arabic AI insight
    String? aiInsightAr,

    /// Confidence score (0-100)
    @Default(70) int confidence,

    /// Data completeness (0-100)
    @Default(0) int dataCompleteness,
  }) = _Healthspan;

  factory Healthspan.fromJson(Map<String, dynamic> json) =>
      _$HealthspanFromJson(json);

  /// Calculate healthspan from metrics
  factory Healthspan.calculate({
    required String id,
    required int chronologicalAge,
    required HealthspanInputs inputs,
  }) {
    final factors = _calculateFactors(chronologicalAge, inputs);
    final biologicalAge = chronologicalAge + factors.totalAdjustment;

    return Healthspan(
      id: id,
      calculatedAt: DateTime.now(),
      chronologicalAge: chronologicalAge,
      biologicalAge: biologicalAge.clamp(18, 100),
      ageDifference: factors.totalAdjustment,
      factors: factors,
      recommendations: _generateRecommendations(factors),
      confidence: _calculateConfidence(inputs),
      dataCompleteness: _calculateDataCompleteness(inputs),
    );
  }

  static HealthspanFactors _calculateFactors(
    int chronologicalAge,
    HealthspanInputs inputs,
  ) {
    // HRV Adjustment (-5 to +5 years)
    // Higher HRV = younger biological age
    int hrvAdjustment = 0;
    if (inputs.avgHrv != null && inputs.ageNormHrv != null) {
      final hrvRatio = inputs.avgHrv! / inputs.ageNormHrv!;
      if (hrvRatio >= 1.3) {
        hrvAdjustment = -5;
      } else if (hrvRatio >= 1.15) {
        hrvAdjustment = -3;
      } else if (hrvRatio >= 1.0) {
        hrvAdjustment = -1;
      } else if (hrvRatio >= 0.85) {
        hrvAdjustment = 1;
      } else if (hrvRatio >= 0.7) {
        hrvAdjustment = 3;
      } else {
        hrvAdjustment = 5;
      }
    }

    // RHR Adjustment (-3 to +3 years)
    // Lower RHR = younger biological age
    int rhrAdjustment = 0;
    if (inputs.avgRhr != null) {
      if (inputs.avgRhr! <= 50) {
        rhrAdjustment = -3;
      } else if (inputs.avgRhr! <= 55) {
        rhrAdjustment = -2;
      } else if (inputs.avgRhr! <= 60) {
        rhrAdjustment = -1;
      } else if (inputs.avgRhr! <= 70) {
        rhrAdjustment = 0;
      } else if (inputs.avgRhr! <= 80) {
        rhrAdjustment = 2;
      } else {
        rhrAdjustment = 3;
      }
    }

    // Sleep Adjustment (-2 to +2 years)
    // Consistent good sleep = younger biological age
    int sleepAdjustment = 0;
    if (inputs.avgSleepHours != null && inputs.sleepQuality != null) {
      final sleepScore = (inputs.avgSleepHours! / 7.5) * (inputs.sleepQuality! / 100);
      if (sleepScore >= 1.1) {
        sleepAdjustment = -2;
      } else if (sleepScore >= 0.95) {
        sleepAdjustment = -1;
      } else if (sleepScore >= 0.8) {
        sleepAdjustment = 0;
      } else if (sleepScore >= 0.6) {
        sleepAdjustment = 1;
      } else {
        sleepAdjustment = 2;
      }
    }

    // Activity Adjustment (-3 to +3 years)
    // Higher activity = younger biological age
    int activityAdjustment = 0;
    if (inputs.avgStrain != null) {
      if (inputs.avgStrain! >= 14) {
        activityAdjustment = -3;
      } else if (inputs.avgStrain! >= 11) {
        activityAdjustment = -2;
      } else if (inputs.avgStrain! >= 8) {
        activityAdjustment = -1;
      } else if (inputs.avgStrain! >= 5) {
        activityAdjustment = 0;
      } else if (inputs.avgStrain! >= 2) {
        activityAdjustment = 2;
      } else {
        activityAdjustment = 3;
      }
    }

    // Recovery Consistency Adjustment (-2 to +2 years)
    // Consistent high recovery = younger biological age
    int recoveryAdjustment = 0;
    if (inputs.avgRecovery != null && inputs.recoveryConsistency != null) {
      final recoveryScore = (inputs.avgRecovery! / 100) * inputs.recoveryConsistency!;
      if (recoveryScore >= 0.7) {
        recoveryAdjustment = -2;
      } else if (recoveryScore >= 0.55) {
        recoveryAdjustment = -1;
      } else if (recoveryScore >= 0.4) {
        recoveryAdjustment = 0;
      } else if (recoveryScore >= 0.25) {
        recoveryAdjustment = 1;
      } else {
        recoveryAdjustment = 2;
      }
    }

    return HealthspanFactors(
      hrvAdjustment: hrvAdjustment,
      rhrAdjustment: rhrAdjustment,
      sleepAdjustment: sleepAdjustment,
      activityAdjustment: activityAdjustment,
      recoveryAdjustment: recoveryAdjustment,
      avgHrv: inputs.avgHrv,
      avgRhr: inputs.avgRhr,
      avgSleepHours: inputs.avgSleepHours,
      avgStrain: inputs.avgStrain,
      avgRecovery: inputs.avgRecovery,
    );
  }

  static List<HealthspanRecommendation> _generateRecommendations(
    HealthspanFactors factors,
  ) {
    final recommendations = <HealthspanRecommendation>[];

    // HRV recommendations
    if (factors.hrvAdjustment > 0) {
      recommendations.add(HealthspanRecommendation(
        area: HealthspanArea.hrv,
        title: 'Improve HRV',
        titleAr: 'تحسين HRV',
        description: 'Regular exercise, stress management, and good sleep can improve HRV.',
        descriptionAr: 'التمرين المنتظم وإدارة التوتر والنوم الجيد يمكن أن يحسن HRV.',
        potentialImpact: -factors.hrvAdjustment,
        priority: factors.hrvAdjustment > 2 ? 1 : 2,
      ));
    }

    // RHR recommendations
    if (factors.rhrAdjustment > 0) {
      recommendations.add(HealthspanRecommendation(
        area: HealthspanArea.rhr,
        title: 'Lower Resting Heart Rate',
        titleAr: 'خفض معدل ضربات القلب',
        description: 'Cardiovascular exercise and weight management can lower RHR.',
        descriptionAr: 'تمارين القلب وإدارة الوزن يمكن أن تخفض معدل ضربات القلب.',
        potentialImpact: -factors.rhrAdjustment,
        priority: factors.rhrAdjustment > 1 ? 1 : 2,
      ));
    }

    // Sleep recommendations
    if (factors.sleepAdjustment > 0) {
      recommendations.add(HealthspanRecommendation(
        area: HealthspanArea.sleep,
        title: 'Improve Sleep Quality',
        titleAr: 'تحسين جودة النوم',
        description: 'Consistent sleep schedule and good sleep hygiene can help.',
        descriptionAr: 'جدول نوم ثابت ونظافة نوم جيدة يمكن أن تساعد.',
        potentialImpact: -factors.sleepAdjustment,
        priority: factors.sleepAdjustment > 1 ? 1 : 3,
      ));
    }

    // Activity recommendations
    if (factors.activityAdjustment > 0) {
      recommendations.add(HealthspanRecommendation(
        area: HealthspanArea.activity,
        title: 'Increase Activity Level',
        titleAr: 'زيادة مستوى النشاط',
        description: 'More regular exercise will improve your biological age.',
        descriptionAr: 'المزيد من التمارين المنتظمة ستحسن عمرك البيولوجي.',
        potentialImpact: -factors.activityAdjustment,
        priority: factors.activityAdjustment > 1 ? 1 : 2,
      ));
    }

    // Sort by priority
    recommendations.sort((a, b) => a.priority.compareTo(b.priority));

    return recommendations;
  }

  static int _calculateConfidence(HealthspanInputs inputs) {
    var confidence = 50;
    if (inputs.avgHrv != null) confidence += 15;
    if (inputs.avgRhr != null) confidence += 10;
    if (inputs.avgSleepHours != null) confidence += 10;
    if (inputs.avgStrain != null) confidence += 10;
    if (inputs.avgRecovery != null) confidence += 5;
    return confidence.clamp(0, 100);
  }

  static int _calculateDataCompleteness(HealthspanInputs inputs) {
    var completeness = 0;
    if (inputs.avgHrv != null) completeness += 25;
    if (inputs.avgRhr != null) completeness += 20;
    if (inputs.avgSleepHours != null) completeness += 20;
    if (inputs.avgStrain != null) completeness += 20;
    if (inputs.avgRecovery != null) completeness += 15;
    return completeness;
  }

  /// Is biological age younger than chronological?
  bool get isYounger => ageDifference < 0;

  /// Get status message
  String getStatusMessage(String language) {
    final diff = ageDifference.abs();
    if (language == 'ar') {
      if (ageDifference <= -5) return 'ممتاز! أنت أصغر بـ $diff سنوات!';
      if (ageDifference <= -2) return 'رائع! أنت أصغر بـ $diff سنوات.';
      if (ageDifference <= 0) return 'جيد! عمرك البيولوجي مثالي.';
      if (ageDifference <= 3) return 'يمكن تحسينه. أنت أكبر بـ $diff سنوات.';
      return 'يحتاج اهتمام. أنت أكبر بـ $diff سنوات.';
    }
    if (ageDifference <= -5) return 'Excellent! You\'re $diff years younger!';
    if (ageDifference <= -2) return 'Great! You\'re $diff years younger.';
    if (ageDifference <= 0) return 'Good! Your biological age is optimal.';
    if (ageDifference <= 3) return 'Room to improve. You\'re $diff years older.';
    return 'Needs attention. You\'re $diff years older.';
  }

  /// Get color based on age difference
  String get colorHex {
    if (ageDifference <= -5) return '#4CAF50';
    if (ageDifference <= -2) return '#8BC34A';
    if (ageDifference <= 0) return '#2196F3';
    if (ageDifference <= 3) return '#FF9800';
    return '#F44336';
  }
}

/// Inputs for healthspan calculation
class HealthspanInputs {
  final double? avgHrv;
  final double? ageNormHrv;
  final double? avgRhr;
  final double? avgSleepHours;
  final int? sleepQuality;
  final double? avgStrain;
  final double? avgRecovery;
  final double? recoveryConsistency;

  const HealthspanInputs({
    this.avgHrv,
    this.ageNormHrv,
    this.avgRhr,
    this.avgSleepHours,
    this.sleepQuality,
    this.avgStrain,
    this.avgRecovery,
    this.recoveryConsistency,
  });
}

/// Factors contributing to biological age
@freezed
class HealthspanFactors with _$HealthspanFactors {
  const HealthspanFactors._();

  const factory HealthspanFactors({
    /// HRV adjustment (-5 to +5)
    required int hrvAdjustment,

    /// RHR adjustment (-3 to +3)
    required int rhrAdjustment,

    /// Sleep adjustment (-2 to +2)
    required int sleepAdjustment,

    /// Activity adjustment (-3 to +3)
    required int activityAdjustment,

    /// Recovery adjustment (-2 to +2)
    required int recoveryAdjustment,

    /// Underlying metrics
    double? avgHrv,
    double? avgRhr,
    double? avgSleepHours,
    double? avgStrain,
    double? avgRecovery,
  }) = _HealthspanFactors;

  factory HealthspanFactors.fromJson(Map<String, dynamic> json) =>
      _$HealthspanFactorsFromJson(json);

  /// Total age adjustment
  int get totalAdjustment =>
      hrvAdjustment +
      rhrAdjustment +
      sleepAdjustment +
      activityAdjustment +
      recoveryAdjustment;

  /// Get best contributing factor
  HealthspanArea? get bestFactor {
    final factors = {
      HealthspanArea.hrv: hrvAdjustment,
      HealthspanArea.rhr: rhrAdjustment,
      HealthspanArea.sleep: sleepAdjustment,
      HealthspanArea.activity: activityAdjustment,
      HealthspanArea.recovery: recoveryAdjustment,
    };
    final best = factors.entries.reduce(
      (a, b) => a.value < b.value ? a : b,
    );
    return best.value < 0 ? best.key : null;
  }

  /// Get worst contributing factor
  HealthspanArea? get worstFactor {
    final factors = {
      HealthspanArea.hrv: hrvAdjustment,
      HealthspanArea.rhr: rhrAdjustment,
      HealthspanArea.sleep: sleepAdjustment,
      HealthspanArea.activity: activityAdjustment,
      HealthspanArea.recovery: recoveryAdjustment,
    };
    final worst = factors.entries.reduce(
      (a, b) => a.value > b.value ? a : b,
    );
    return worst.value > 0 ? worst.key : null;
  }
}

/// Healthspan area/factor
@JsonEnum()
enum HealthspanArea {
  @JsonValue('hrv')
  hrv,

  @JsonValue('rhr')
  rhr,

  @JsonValue('sleep')
  sleep,

  @JsonValue('activity')
  activity,

  @JsonValue('recovery')
  recovery,
}

extension HealthspanAreaExtension on HealthspanArea {
  String get label {
    switch (this) {
      case HealthspanArea.hrv:
        return 'HRV';
      case HealthspanArea.rhr:
        return 'Resting HR';
      case HealthspanArea.sleep:
        return 'Sleep';
      case HealthspanArea.activity:
        return 'Activity';
      case HealthspanArea.recovery:
        return 'Recovery';
    }
  }

  String get labelAr {
    switch (this) {
      case HealthspanArea.hrv:
        return 'تقلب معدل ضربات القلب';
      case HealthspanArea.rhr:
        return 'معدل ضربات القلب';
      case HealthspanArea.sleep:
        return 'النوم';
      case HealthspanArea.activity:
        return 'النشاط';
      case HealthspanArea.recovery:
        return 'التعافي';
    }
  }

  String get emoji {
    switch (this) {
      case HealthspanArea.hrv:
        return '💓';
      case HealthspanArea.rhr:
        return '❤️';
      case HealthspanArea.sleep:
        return '😴';
      case HealthspanArea.activity:
        return '🏃';
      case HealthspanArea.recovery:
        return '🔋';
    }
  }
}

/// Recommendation for improving healthspan
@freezed
class HealthspanRecommendation with _$HealthspanRecommendation {
  const factory HealthspanRecommendation({
    required HealthspanArea area,
    required String title,
    required String titleAr,
    required String description,
    required String descriptionAr,

    /// Potential years improvement
    required int potentialImpact,

    /// Priority (1 = highest)
    @Default(2) int priority,
  }) = _HealthspanRecommendation;

  factory HealthspanRecommendation.fromJson(Map<String, dynamic> json) =>
      _$HealthspanRecommendationFromJson(json);
}

/// Historical healthspan point
@freezed
class HealthspanHistoryPoint with _$HealthspanHistoryPoint {
  const factory HealthspanHistoryPoint({
    required DateTime calculatedAt,
    required int biologicalAge,
    required int ageDifference,
  }) = _HealthspanHistoryPoint;

  factory HealthspanHistoryPoint.fromJson(Map<String, dynamic> json) =>
      _$HealthspanHistoryPointFromJson(json);
}

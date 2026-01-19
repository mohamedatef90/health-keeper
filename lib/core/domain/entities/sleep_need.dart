import 'package:freezed_annotation/freezed_annotation.dart';

part 'sleep_need.freezed.dart';
part 'sleep_need.g.dart';

/// Sleep need entity for personalized sleep recommendations
/// Based on WHOOP-inspired sleep need calculations
@freezed
class SleepNeed with _$SleepNeed {
  const SleepNeed._();

  const factory SleepNeed({
    required String id,
    required DateTime date,
    required DateTime calculatedAt,

    /// Base sleep need (typically 7-8 hours)
    required double baseNeed,

    /// Additional sleep needed to pay off sleep debt
    required double debtPayback,

    /// Additional sleep needed based on strain
    required double strainAdjustment,

    /// Total recommended sleep (hours)
    required double totalNeed,

    /// Actual sleep achieved (hours, if available)
    double? actualSleep,

    /// Sleep debt accumulated (hours)
    required double sleepDebt,

    /// Today's strain score (0-21)
    required double strainScore,

    /// Recommended bedtime
    DateTime? recommendedBedtime,

    /// Recommended wake time
    DateTime? recommendedWakeTime,
  }) = _SleepNeed;

  factory SleepNeed.fromJson(Map<String, dynamic> json) =>
      _$SleepNeedFromJson(json);

  /// Calculate sleep need from strain and debt
  factory SleepNeed.calculate({
    required String id,
    required DateTime date,
    required double strainScore,
    required double sleepDebt,
    double baseNeed = 7.5,
    DateTime? desiredWakeTime,
  }) {
    // Calculate debt payback (pay off 30% of debt per night)
    final debtPayback = sleepDebt * 0.3;

    // Calculate strain adjustment (higher strain = more sleep needed)
    // Add 0.15 hours per strain point above 10
    final strainAdjustment = strainScore > 10
        ? (strainScore - 10) * 0.15
        : 0.0;

    final totalNeed = baseNeed + debtPayback + strainAdjustment;

    // Calculate recommended bedtime if wake time is provided
    DateTime? recommendedBedtime;
    if (desiredWakeTime != null) {
      final sleepDuration = Duration(
        hours: totalNeed.floor(),
        minutes: ((totalNeed - totalNeed.floor()) * 60).round(),
      );
      recommendedBedtime = desiredWakeTime.subtract(sleepDuration);
    }

    return SleepNeed(
      id: id,
      date: date,
      calculatedAt: DateTime.now(),
      baseNeed: baseNeed,
      debtPayback: debtPayback,
      strainAdjustment: strainAdjustment,
      totalNeed: totalNeed,
      sleepDebt: sleepDebt,
      strainScore: strainScore,
      recommendedBedtime: recommendedBedtime,
      recommendedWakeTime: desiredWakeTime,
    );
  }

  /// Sleep performance percentage (actual / needed)
  double get performance {
    if (actualSleep == null || totalNeed <= 0) return 0;
    return (actualSleep! / totalNeed).clamp(0, 1.5);
  }

  /// Performance percentage for display
  int get performancePercent => (performance * 100).round();

  /// Check if sleep need was met
  bool get needMet => actualSleep != null && actualSleep! >= totalNeed;

  /// Sleep deficit for today (negative if surplus)
  double get deficit {
    if (actualSleep == null) return totalNeed;
    return totalNeed - actualSleep!;
  }

  /// Get formatted total need (e.g., "8h 15m")
  String get formattedTotalNeed {
    final hours = totalNeed.floor();
    final minutes = ((totalNeed - hours) * 60).round();
    if (minutes == 0) return '${hours}h';
    return '${hours}h ${minutes}m';
  }

  /// Get formatted bedtime (e.g., "10:30 PM")
  String get formattedBedtime {
    if (recommendedBedtime == null) return '--:--';
    final hour = recommendedBedtime!.hour;
    final minute = recommendedBedtime!.minute;
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    return '$displayHour:${minute.toString().padLeft(2, '0')} $period';
  }

  /// Get status based on sleep performance
  SleepStatus get status {
    if (actualSleep == null) return SleepStatus.pending;
    final perf = performance;
    if (perf >= 1.0) return SleepStatus.optimal;
    if (perf >= 0.85) return SleepStatus.good;
    if (perf >= 0.70) return SleepStatus.adequate;
    return SleepStatus.insufficient;
  }

  /// Get insight message
  String get insight {
    if (actualSleep == null) {
      return 'Get ${formattedTotalNeed} of sleep tonight for optimal recovery.';
    }

    final diff = actualSleep! - totalNeed;
    if (diff >= 0.5) {
      return 'Great sleep! You exceeded your need by ${diff.toStringAsFixed(1)} hours.';
    } else if (diff >= 0) {
      return 'You met your sleep need. Well done!';
    } else if (diff >= -1) {
      return 'Slightly short on sleep. Try to get to bed earlier tonight.';
    } else {
      return 'Significant sleep deficit. Prioritize rest today.';
    }
  }

  /// Get Arabic insight message
  String get insightAr {
    if (actualSleep == null) {
      return 'احصل على ${formattedTotalNeed} من النوم الليلة للتعافي الأمثل.';
    }

    final diff = actualSleep! - totalNeed;
    if (diff >= 0.5) {
      return 'نوم رائع! تجاوزت حاجتك بـ ${diff.toStringAsFixed(1)} ساعة.';
    } else if (diff >= 0) {
      return 'حققت حاجتك من النوم. أحسنت!';
    } else if (diff >= -1) {
      return 'نوم أقل قليلاً. حاول النوم مبكراً الليلة.';
    } else {
      return 'عجز كبير في النوم. أعطِ الأولوية للراحة اليوم.';
    }
  }
}

/// Sleep performance status
@JsonEnum()
enum SleepStatus {
  @JsonValue('pending')
  pending,

  @JsonValue('insufficient')
  insufficient,

  @JsonValue('adequate')
  adequate,

  @JsonValue('good')
  good,

  @JsonValue('optimal')
  optimal,
}

extension SleepStatusExtension on SleepStatus {
  String get label {
    switch (this) {
      case SleepStatus.pending:
        return 'Pending';
      case SleepStatus.insufficient:
        return 'Insufficient';
      case SleepStatus.adequate:
        return 'Adequate';
      case SleepStatus.good:
        return 'Good';
      case SleepStatus.optimal:
        return 'Optimal';
    }
  }

  String get labelAr {
    switch (this) {
      case SleepStatus.pending:
        return 'قيد الانتظار';
      case SleepStatus.insufficient:
        return 'غير كافٍ';
      case SleepStatus.adequate:
        return 'مناسب';
      case SleepStatus.good:
        return 'جيد';
      case SleepStatus.optimal:
        return 'مثالي';
    }
  }

  String get colorHex {
    switch (this) {
      case SleepStatus.pending:
        return '#9E9E9E'; // Grey
      case SleepStatus.insufficient:
        return '#F44336'; // Red
      case SleepStatus.adequate:
        return '#FF9800'; // Orange
      case SleepStatus.good:
        return '#8BC34A'; // Light Green
      case SleepStatus.optimal:
        return '#4CAF50'; // Green
    }
  }
}

/// Sleep debt tracker for accumulated sleep deficit
@freezed
class SleepDebtTracker with _$SleepDebtTracker {
  const SleepDebtTracker._();

  const factory SleepDebtTracker({
    required String id,
    required DateTime date,

    /// Total accumulated sleep debt (hours)
    required double totalDebt,

    /// Sleep debt from last 7 days
    required List<DailySleepRecord> recentRecords,

    /// Average nightly deficit over 7 days
    required double avgNightlyDeficit,

    /// Days to recover if sleeping optimally
    required int estimatedRecoveryDays,
  }) = _SleepDebtTracker;

  factory SleepDebtTracker.fromJson(Map<String, dynamic> json) =>
      _$SleepDebtTrackerFromJson(json);

  /// Calculate sleep debt from recent records
  factory SleepDebtTracker.calculate({
    required String id,
    required DateTime date,
    required List<DailySleepRecord> records,
  }) {
    double totalDebt = 0;
    for (final record in records) {
      totalDebt += record.deficit.clamp(0, double.infinity);
    }

    final avgDeficit = records.isNotEmpty
        ? records.map((r) => r.deficit.clamp(0, double.infinity)).reduce((a, b) => a + b) / records.length
        : 0.0;

    // Estimate recovery days (paying off 30% per night)
    final recoveryDays = totalDebt > 0 ? (totalDebt / (avgDeficit * 0.3)).ceil() : 0;

    return SleepDebtTracker(
      id: id,
      date: date,
      totalDebt: totalDebt,
      recentRecords: records,
      avgNightlyDeficit: avgDeficit,
      estimatedRecoveryDays: recoveryDays.clamp(0, 14),
    );
  }

  /// Get severity level
  SleepDebtSeverity get severity {
    if (totalDebt <= 2) return SleepDebtSeverity.minimal;
    if (totalDebt <= 5) return SleepDebtSeverity.moderate;
    if (totalDebt <= 10) return SleepDebtSeverity.significant;
    return SleepDebtSeverity.severe;
  }

  /// Get formatted debt (e.g., "5h 30m")
  String get formattedDebt {
    final hours = totalDebt.floor();
    final minutes = ((totalDebt - hours) * 60).round();
    if (minutes == 0) return '${hours}h';
    return '${hours}h ${minutes}m';
  }
}

/// Daily sleep record for debt calculation
@freezed
class DailySleepRecord with _$DailySleepRecord {
  const factory DailySleepRecord({
    required DateTime date,
    required double needed,
    required double actual,
    required double deficit,
  }) = _DailySleepRecord;

  factory DailySleepRecord.fromJson(Map<String, dynamic> json) =>
      _$DailySleepRecordFromJson(json);
}

/// Sleep debt severity levels
@JsonEnum()
enum SleepDebtSeverity {
  @JsonValue('minimal')
  minimal,

  @JsonValue('moderate')
  moderate,

  @JsonValue('significant')
  significant,

  @JsonValue('severe')
  severe,
}

extension SleepDebtSeverityExtension on SleepDebtSeverity {
  String get label {
    switch (this) {
      case SleepDebtSeverity.minimal:
        return 'Minimal';
      case SleepDebtSeverity.moderate:
        return 'Moderate';
      case SleepDebtSeverity.significant:
        return 'Significant';
      case SleepDebtSeverity.severe:
        return 'Severe';
    }
  }

  String get labelAr {
    switch (this) {
      case SleepDebtSeverity.minimal:
        return 'ضئيل';
      case SleepDebtSeverity.moderate:
        return 'معتدل';
      case SleepDebtSeverity.significant:
        return 'كبير';
      case SleepDebtSeverity.severe:
        return 'شديد';
    }
  }

  String get advice {
    switch (this) {
      case SleepDebtSeverity.minimal:
        return 'Sleep debt is manageable. Maintain consistent sleep schedule.';
      case SleepDebtSeverity.moderate:
        return 'Try to get extra sleep on weekends to recover.';
      case SleepDebtSeverity.significant:
        return 'Prioritize sleep. Consider earlier bedtimes this week.';
      case SleepDebtSeverity.severe:
        return 'Critical sleep debt. Focus on recovery before intense training.';
    }
  }

  String get adviceAr {
    switch (this) {
      case SleepDebtSeverity.minimal:
        return 'دين النوم تحت السيطرة. حافظ على جدول نوم ثابت.';
      case SleepDebtSeverity.moderate:
        return 'حاول الحصول على نوم إضافي في عطلة نهاية الأسبوع.';
      case SleepDebtSeverity.significant:
        return 'أعطِ الأولوية للنوم. فكر في النوم مبكراً هذا الأسبوع.';
      case SleepDebtSeverity.severe:
        return 'دين نوم حرج. ركز على التعافي قبل التمرين المكثف.';
    }
  }

  String get colorHex {
    switch (this) {
      case SleepDebtSeverity.minimal:
        return '#4CAF50'; // Green
      case SleepDebtSeverity.moderate:
        return '#FF9800'; // Orange
      case SleepDebtSeverity.significant:
        return '#FF5722'; // Deep Orange
      case SleepDebtSeverity.severe:
        return '#F44336'; // Red
    }
  }
}

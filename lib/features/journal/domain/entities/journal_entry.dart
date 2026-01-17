import 'package:freezed_annotation/freezed_annotation.dart';

import 'journal_behavior.dart';

part 'journal_entry.freezed.dart';
part 'journal_entry.g.dart';

/// Journal entry entity for tracking daily behaviors and habits
@freezed
class JournalEntry with _$JournalEntry {
  const factory JournalEntry({
    required String id,
    required DateTime date,
    required DateTime createdAt,
    required DateTime updatedAt,

    /// List of logged behaviors for this entry
    @Default([]) List<LoggedBehavior> behaviors,

    /// Optional notes for the day
    String? notes,

    /// Overall mood/energy level (1-5)
    int? moodLevel,

    /// Overall stress level (1-5)
    int? stressLevel,

    /// Whether this entry has been reviewed
    @Default(false) bool isReviewed,

    /// Tags for categorization
    @Default([]) List<String> tags,
  }) = _JournalEntry;

  factory JournalEntry.fromJson(Map<String, dynamic> json) =>
      _$JournalEntryFromJson(json);
}

/// A logged behavior instance
@freezed
class LoggedBehavior with _$LoggedBehavior {
  const factory LoggedBehavior({
    required String id,

    /// Reference to the behavior definition
    required String behaviorId,

    /// Time the behavior was logged
    required DateTime loggedAt,

    /// Numeric value (if applicable)
    double? value,

    /// Unit for the value
    String? unit,

    /// Intensity/severity (1-5)
    int? intensity,

    /// Duration in minutes (if applicable)
    int? durationMinutes,

    /// Optional note specific to this log
    String? note,

    /// Custom data as JSON string
    String? customDataJson,
  }) = _LoggedBehavior;

  factory LoggedBehavior.fromJson(Map<String, dynamic> json) =>
      _$LoggedBehaviorFromJson(json);
}

/// Extension for logged behavior helpers
extension LoggedBehaviorExtension on LoggedBehavior {
  /// Get display string for the behavior value
  String get displayValue {
    if (value != null && unit != null) {
      return '${value!.toStringAsFixed(value! == value!.truncate() ? 0 : 1)} $unit';
    } else if (value != null) {
      return value.toString();
    } else if (durationMinutes != null) {
      return '$durationMinutes min';
    } else if (intensity != null) {
      return 'Level $intensity';
    }
    return 'Logged';
  }
}

/// Extension for journal entry helpers
extension JournalEntryExtension on JournalEntry {
  /// Get behaviors grouped by category
  Map<BehaviorCategory, List<LoggedBehavior>> get behaviorsByCategory {
    final result = <BehaviorCategory, List<LoggedBehavior>>{};

    for (final behavior in behaviors) {
      final def = JournalBehaviors.getById(behavior.behaviorId);
      if (def != null) {
        result.putIfAbsent(def.category, () => []).add(behavior);
      }
    }

    return result;
  }

  /// Get count of behaviors in a specific category
  int countBehaviorsInCategory(BehaviorCategory category) {
    return behaviors.where((b) {
      final def = JournalBehaviors.getById(b.behaviorId);
      return def?.category == category;
    }).length;
  }

  /// Check if a specific behavior is logged
  bool hasBehavior(String behaviorId) {
    return behaviors.any((b) => b.behaviorId == behaviorId);
  }

  /// Get total logged behaviors count
  int get totalBehaviorsCount => behaviors.length;

  /// Get summary string
  String get summary {
    final count = behaviors.length;
    if (count == 0) return 'No behaviors logged';
    if (count == 1) return '1 behavior logged';
    return '$count behaviors logged';
  }
}

/// Journal entry summary for list display
@freezed
class JournalEntrySummary with _$JournalEntrySummary {
  const factory JournalEntrySummary({
    required String id,
    required DateTime date,
    required int behaviorsCount,
    required List<String> topCategories,
    int? moodLevel,
    int? stressLevel,
  }) = _JournalEntrySummary;

  factory JournalEntrySummary.fromJson(Map<String, dynamic> json) =>
      _$JournalEntrySummaryFromJson(json);
}

/// Create summary from full entry
extension JournalEntrySummaryExtension on JournalEntry {
  JournalEntrySummary toSummary() {
    final categoryCounts = <BehaviorCategory, int>{};

    for (final behavior in behaviors) {
      final def = JournalBehaviors.getById(behavior.behaviorId);
      if (def != null) {
        categoryCounts[def.category] = (categoryCounts[def.category] ?? 0) + 1;
      }
    }

    // Sort categories by count and get top 3
    final sortedCategories = categoryCounts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    final topCategories = sortedCategories
        .take(3)
        .map((e) => e.key.displayName)
        .toList();

    return JournalEntrySummary(
      id: id,
      date: date,
      behaviorsCount: behaviors.length,
      topCategories: topCategories,
      moodLevel: moodLevel,
      stressLevel: stressLevel,
    );
  }
}

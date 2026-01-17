import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/data/database/database.dart' as db;
import '../../../../core/providers/providers.dart';
import '../../domain/entities/journal_behavior.dart';
import '../../domain/entities/journal_entry.dart';

/// Repository for managing journal entries
abstract class JournalRepository {
  /// Get journal entry for a specific date
  Future<JournalEntry?> getEntryForDate(DateTime date);

  /// Get all journal entries within a date range
  Future<List<JournalEntry>> getEntriesInRange(DateTime start, DateTime end);

  /// Create a new journal entry
  Future<JournalEntry> createEntry(DateTime date);

  /// Update an existing journal entry
  Future<void> updateEntry(JournalEntry entry);

  /// Delete a journal entry
  Future<void> deleteEntry(String id);

  /// Add a behavior to an entry
  Future<JournalEntry> addBehavior(String entryId, LoggedBehavior behavior);

  /// Remove a behavior from an entry
  Future<JournalEntry> removeBehavior(String entryId, String behaviorLogId);

  /// Update a logged behavior
  Future<JournalEntry> updateBehavior(String entryId, LoggedBehavior behavior);

  /// Get recent entries (last 30 days)
  Future<List<JournalEntrySummary>> getRecentEntries();

  /// Get behavior frequency statistics
  Future<Map<String, int>> getBehaviorFrequency(DateTime start, DateTime end);

  /// Get custom behaviors
  Future<List<JournalBehavior>> getCustomBehaviors();

  /// Add a custom behavior
  Future<JournalBehavior> addCustomBehavior(JournalBehavior behavior);

  /// Delete a custom behavior
  Future<void> deleteCustomBehavior(String id);
}

/// Implementation of journal repository using Drift database
class JournalRepositoryImpl implements JournalRepository {
  final db.AppDatabase _database;
  static const _uuid = Uuid();

  JournalRepositoryImpl(this._database);

  @override
  Future<JournalEntry?> getEntryForDate(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    final result = await (_database.select(_database.journalEntries)
          ..where((e) => e.date.isBiggerOrEqualValue(startOfDay))
          ..where((e) => e.date.isSmallerThanValue(endOfDay)))
        .getSingleOrNull();

    if (result == null) return null;

    return _mapToJournalEntry(result);
  }

  @override
  Future<List<JournalEntry>> getEntriesInRange(
      DateTime start, DateTime end) async {
    final results = await (_database.select(_database.journalEntries)
          ..where((e) => e.date.isBiggerOrEqualValue(start))
          ..where((e) => e.date.isSmallerThanValue(end))
          ..orderBy([(e) => OrderingTerm.desc(e.date)]))
        .get();

    return Future.wait(results.map(_mapToJournalEntry));
  }

  @override
  Future<JournalEntry> createEntry(DateTime date) async {
    final id = _uuid.v4();
    final now = DateTime.now();
    final normalizedDate = DateTime(date.year, date.month, date.day);

    await _database.into(_database.journalEntries).insert(
          db.JournalEntriesCompanion.insert(
            id: id,
            date: normalizedDate,
            createdAt: now,
            updatedAt: now,
            behaviorsJson: '[]',
            tagsJson: '[]',
            isReviewed: const Value(false),
          ),
        );

    return JournalEntry(
      id: id,
      date: normalizedDate,
      createdAt: now,
      updatedAt: now,
      behaviors: [],
      tags: [],
    );
  }

  @override
  Future<void> updateEntry(JournalEntry entry) async {
    final behaviorsJson =
        jsonEncode(entry.behaviors.map((b) => b.toJson()).toList());
    final tagsJson = jsonEncode(entry.tags);

    await (_database.update(_database.journalEntries)
          ..where((e) => e.id.equals(entry.id)))
        .write(
      db.JournalEntriesCompanion(
        updatedAt: Value(DateTime.now()),
        behaviorsJson: Value(behaviorsJson),
        notes: Value(entry.notes),
        moodLevel: Value(entry.moodLevel),
        stressLevel: Value(entry.stressLevel),
        isReviewed: Value(entry.isReviewed),
        tagsJson: Value(tagsJson),
      ),
    );
  }

  @override
  Future<void> deleteEntry(String id) async {
    await (_database.delete(_database.journalEntries)
          ..where((e) => e.id.equals(id)))
        .go();
  }

  @override
  Future<JournalEntry> addBehavior(
      String entryId, LoggedBehavior behavior) async {
    final entry = await _getEntryById(entryId);
    if (entry == null) {
      throw Exception('Journal entry not found');
    }

    final updatedBehaviors = [...entry.behaviors, behavior];
    final updatedEntry = entry.copyWith(
      behaviors: updatedBehaviors,
      updatedAt: DateTime.now(),
    );

    await updateEntry(updatedEntry);
    return updatedEntry;
  }

  @override
  Future<JournalEntry> removeBehavior(
      String entryId, String behaviorLogId) async {
    final entry = await _getEntryById(entryId);
    if (entry == null) {
      throw Exception('Journal entry not found');
    }

    final updatedBehaviors =
        entry.behaviors.where((b) => b.id != behaviorLogId).toList();
    final updatedEntry = entry.copyWith(
      behaviors: updatedBehaviors,
      updatedAt: DateTime.now(),
    );

    await updateEntry(updatedEntry);
    return updatedEntry;
  }

  @override
  Future<JournalEntry> updateBehavior(
      String entryId, LoggedBehavior behavior) async {
    final entry = await _getEntryById(entryId);
    if (entry == null) {
      throw Exception('Journal entry not found');
    }

    final updatedBehaviors = entry.behaviors.map((b) {
      if (b.id == behavior.id) {
        return behavior;
      }
      return b;
    }).toList();

    final updatedEntry = entry.copyWith(
      behaviors: updatedBehaviors,
      updatedAt: DateTime.now(),
    );

    await updateEntry(updatedEntry);
    return updatedEntry;
  }

  @override
  Future<List<JournalEntrySummary>> getRecentEntries() async {
    final thirtyDaysAgo = DateTime.now().subtract(const Duration(days: 30));

    final results = await (_database.select(_database.journalEntries)
          ..where((e) => e.date.isBiggerOrEqualValue(thirtyDaysAgo))
          ..orderBy([(e) => OrderingTerm.desc(e.date)]))
        .get();

    return results.map((row) {
      final behaviors = _parseBehaviors(row.behaviorsJson);
      final categoryCounts = <BehaviorCategory, int>{};

      for (final behavior in behaviors) {
        final def = JournalBehaviors.getById(behavior.behaviorId);
        if (def != null) {
          categoryCounts[def.category] =
              (categoryCounts[def.category] ?? 0) + 1;
        }
      }

      final sortedCategories = categoryCounts.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      final topCategories = sortedCategories
          .take(3)
          .map((e) => e.key.displayName)
          .toList();

      return JournalEntrySummary(
        id: row.id,
        date: row.date,
        behaviorsCount: behaviors.length,
        topCategories: topCategories,
        moodLevel: row.moodLevel,
        stressLevel: row.stressLevel,
      );
    }).toList();
  }

  @override
  Future<Map<String, int>> getBehaviorFrequency(
      DateTime start, DateTime end) async {
    final entries = await getEntriesInRange(start, end);
    final frequency = <String, int>{};

    for (final entry in entries) {
      for (final behavior in entry.behaviors) {
        frequency[behavior.behaviorId] =
            (frequency[behavior.behaviorId] ?? 0) + 1;
      }
    }

    return frequency;
  }

  @override
  Future<List<JournalBehavior>> getCustomBehaviors() async {
    final results = await _database.select(_database.customBehaviors).get();

    return results.map((row) {
      return JournalBehavior(
        id: row.id,
        name: row.name,
        category: BehaviorCategory.values.firstWhere(
          (c) => c.name == row.category,
          orElse: () => BehaviorCategory.wellness,
        ),
        inputType: BehaviorInputType.values.firstWhere(
          (t) => t.name == row.inputType,
          orElse: () => BehaviorInputType.toggle,
        ),
        icon: row.icon,
        unit: row.unit,
        description: row.description,
        isCustom: true,
        isActive: row.isActive,
      );
    }).toList();
  }

  @override
  Future<JournalBehavior> addCustomBehavior(JournalBehavior behavior) async {
    final id = behavior.id.isEmpty ? _uuid.v4() : behavior.id;

    await _database.into(_database.customBehaviors).insert(
          db.CustomBehaviorsCompanion.insert(
            id: id,
            name: behavior.name,
            category: behavior.category.name,
            inputType: behavior.inputType.name,
            icon: Value(behavior.icon),
            unit: Value(behavior.unit),
            description: Value(behavior.description),
            isActive: const Value(true),
            createdAt: DateTime.now(),
          ),
        );

    return behavior.copyWith(id: id);
  }

  @override
  Future<void> deleteCustomBehavior(String id) async {
    await (_database.delete(_database.customBehaviors)
          ..where((b) => b.id.equals(id)))
        .go();
  }

  // Private helper methods

  Future<JournalEntry?> _getEntryById(String id) async {
    final result = await (_database.select(_database.journalEntries)
          ..where((e) => e.id.equals(id)))
        .getSingleOrNull();

    if (result == null) return null;
    return _mapToJournalEntry(result);
  }

  Future<JournalEntry> _mapToJournalEntry(db.JournalEntry row) async {
    final behaviors = _parseBehaviors(row.behaviorsJson);
    final tags = _parseTags(row.tagsJson);

    return JournalEntry(
      id: row.id,
      date: row.date,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      behaviors: behaviors,
      notes: row.notes,
      moodLevel: row.moodLevel,
      stressLevel: row.stressLevel,
      isReviewed: row.isReviewed,
      tags: tags,
    );
  }

  List<LoggedBehavior> _parseBehaviors(String json) {
    try {
      final List<dynamic> decoded = jsonDecode(json);
      return decoded.map((item) => LoggedBehavior.fromJson(item)).toList();
    } catch (e) {
      return [];
    }
  }

  List<String> _parseTags(String json) {
    try {
      final List<dynamic> decoded = jsonDecode(json);
      return decoded.cast<String>();
    } catch (e) {
      return [];
    }
  }
}

/// Provider for journal repository
final journalRepositoryProvider = Provider<JournalRepository>((ref) {
  final database = ref.watch(databaseProvider);
  return JournalRepositoryImpl(database);
});

/// Provider for today's journal entry
final todayJournalEntryProvider = FutureProvider<JournalEntry?>((ref) async {
  final repository = ref.watch(journalRepositoryProvider);
  return repository.getEntryForDate(DateTime.now());
});

/// Provider for journal entry on a specific date
final journalEntryForDateProvider =
    FutureProvider.family<JournalEntry?, DateTime>((ref, date) async {
  final repository = ref.watch(journalRepositoryProvider);
  return repository.getEntryForDate(date);
});

/// Provider for recent journal entries
final recentJournalEntriesProvider =
    FutureProvider<List<JournalEntrySummary>>((ref) async {
  final repository = ref.watch(journalRepositoryProvider);
  return repository.getRecentEntries();
});

/// Provider for custom behaviors
final customBehaviorsProvider =
    FutureProvider<List<JournalBehavior>>((ref) async {
  final repository = ref.watch(journalRepositoryProvider);
  return repository.getCustomBehaviors();
});

/// Provider for all available behaviors (predefined + custom)
final allBehaviorsProvider = FutureProvider<List<JournalBehavior>>((ref) async {
  final customBehaviors = await ref.watch(customBehaviorsProvider.future);
  return [...JournalBehaviors.all, ...customBehaviors];
});

/// State for journal entry editing
class JournalEntryState {
  final JournalEntry? entry;
  final bool isLoading;
  final bool isSaving;
  final String? error;

  const JournalEntryState({
    this.entry,
    this.isLoading = false,
    this.isSaving = false,
    this.error,
  });

  JournalEntryState copyWith({
    JournalEntry? entry,
    bool? isLoading,
    bool? isSaving,
    String? error,
  }) {
    return JournalEntryState(
      entry: entry ?? this.entry,
      isLoading: isLoading ?? this.isLoading,
      isSaving: isSaving ?? this.isSaving,
      error: error,
    );
  }
}

/// Notifier for journal entry editing
class JournalEntryNotifier extends StateNotifier<JournalEntryState> {
  final JournalRepository _repository;
  static const _uuid = Uuid();

  JournalEntryNotifier(this._repository) : super(const JournalEntryState());

  Future<void> loadEntry(DateTime date) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      var entry = await _repository.getEntryForDate(date);
      entry ??= await _repository.createEntry(date);
      state = state.copyWith(entry: entry, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  Future<void> addBehavior({
    required String behaviorId,
    double? value,
    String? unit,
    int? intensity,
    int? durationMinutes,
    String? note,
  }) async {
    if (state.entry == null) return;

    final behavior = LoggedBehavior(
      id: _uuid.v4(),
      behaviorId: behaviorId,
      loggedAt: DateTime.now(),
      value: value,
      unit: unit,
      intensity: intensity,
      durationMinutes: durationMinutes,
      note: note,
    );

    try {
      state = state.copyWith(isSaving: true);
      final updatedEntry =
          await _repository.addBehavior(state.entry!.id, behavior);
      state = state.copyWith(entry: updatedEntry, isSaving: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isSaving: false);
    }
  }

  Future<void> removeBehavior(String behaviorLogId) async {
    if (state.entry == null) return;

    try {
      state = state.copyWith(isSaving: true);
      final updatedEntry =
          await _repository.removeBehavior(state.entry!.id, behaviorLogId);
      state = state.copyWith(entry: updatedEntry, isSaving: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isSaving: false);
    }
  }

  Future<void> updateMood(int? mood) async {
    if (state.entry == null) return;

    final updatedEntry = state.entry!.copyWith(moodLevel: mood);
    try {
      state = state.copyWith(isSaving: true);
      await _repository.updateEntry(updatedEntry);
      state = state.copyWith(entry: updatedEntry, isSaving: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isSaving: false);
    }
  }

  Future<void> updateStress(int? stress) async {
    if (state.entry == null) return;

    final updatedEntry = state.entry!.copyWith(stressLevel: stress);
    try {
      state = state.copyWith(isSaving: true);
      await _repository.updateEntry(updatedEntry);
      state = state.copyWith(entry: updatedEntry, isSaving: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isSaving: false);
    }
  }

  Future<void> updateNotes(String? notes) async {
    if (state.entry == null) return;

    final updatedEntry = state.entry!.copyWith(notes: notes);
    try {
      state = state.copyWith(isSaving: true);
      await _repository.updateEntry(updatedEntry);
      state = state.copyWith(entry: updatedEntry, isSaving: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isSaving: false);
    }
  }

  void clear() {
    state = const JournalEntryState();
  }
}

/// Provider for journal entry editing
final journalEntryNotifierProvider =
    StateNotifierProvider<JournalEntryNotifier, JournalEntryState>((ref) {
  final repository = ref.watch(journalRepositoryProvider);
  return JournalEntryNotifier(repository);
});

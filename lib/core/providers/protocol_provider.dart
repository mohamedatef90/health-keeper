import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../data/database/database.dart';
import 'providers.dart';

const _uuid = Uuid();

/// Watch all protocol rules (stream)
final protocolRulesProvider = StreamProvider<List<ProtocolRule>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.watchProtocolRules();
});

/// Watch protocol rules by category (stream)
final protocolRulesByCategoryProvider =
    StreamProvider.family<List<ProtocolRule>, String>((ref, category) {
  final db = ref.watch(databaseProvider);
  return db.watchProtocolRules(category: category);
});

/// Notifier for protocol CRUD operations
class ProtocolNotifier extends StateNotifier<AsyncValue<void>> {
  final AppDatabase _db;

  ProtocolNotifier(this._db) : super(const AsyncValue.data(null));

  Future<void> addRule({
    required String category,
    required String name,
    required String scheduleJson,
    required String rulesJson,
  }) async {
    state = const AsyncValue.loading();
    try {
      await _db.insertProtocolRule(
        ProtocolRulesCompanion(
          id: Value(_uuid.v4()),
          category: Value(category),
          name: Value(name),
          scheduleJson: Value(scheduleJson),
          rulesJson: Value(rulesJson),
          isActive: const Value(true),
          createdAt: Value(DateTime.now()),
        ),
      );
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateRule({
    required String id,
    required String category,
    required String name,
    required String scheduleJson,
    required String rulesJson,
    required bool isActive,
    required DateTime createdAt,
  }) async {
    state = const AsyncValue.loading();
    try {
      await _db.updateProtocolRule(
        ProtocolRulesCompanion(
          id: Value(id),
          category: Value(category),
          name: Value(name),
          scheduleJson: Value(scheduleJson),
          rulesJson: Value(rulesJson),
          isActive: Value(isActive),
          createdAt: Value(createdAt),
          updatedAt: Value(DateTime.now()),
        ),
      );
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> toggleActive(String id, bool isActive) async {
    try {
      await _db.toggleProtocolRuleActive(id, isActive);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> deleteRule(String id) async {
    try {
      await _db.deleteProtocolRule(id);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

/// Provider for protocol CRUD notifier
final protocolNotifierProvider =
    StateNotifierProvider<ProtocolNotifier, AsyncValue<void>>((ref) {
  final db = ref.watch(databaseProvider);
  return ProtocolNotifier(db);
});

import 'package:drift/drift.dart';
import 'package:health_keeper/core/data/database/database.dart';
import 'package:health_keeper/core/services/healthkit_service.dart';
import 'package:talker/talker.dart';
import 'package:uuid/uuid.dart';

/// Service to sync Apple Health data to Agent system
/// 
/// This bridges HealthKit → AgentContexts table for AI agents
class AgentSyncService {
  final AppDatabase _db;
  final HealthKitService _healthKit;
  final Talker _talker;
  final _uuid = const Uuid();

  AgentSyncService({
    required AppDatabase database,
    required HealthKitService healthKit,
    required Talker talker,
  })  : _db = database,
        _healthKit = healthKit,
        _talker = talker;

  /// Sync today's data to AgentContexts
  /// 
  /// ⚠️ Call this daily (e.g., morning or on app open)
  Future<bool> syncTodayContext() async {
    try {
      _talker.info('🔄 Agent Sync: Starting daily sync...');
      
      final today = DateTime.now();
      final startOfDay = DateTime(today.year, today.month, today.day);
      final endOfDay = startOfDay.add(const Duration(days: 1));

      // Get Apple Health data
      final healthData = await _fetchHealthData(startOfDay, endOfDay);
      
      if (healthData == null) {
        _talker.warning('⚠️  Agent Sync: No health data available');
        return false;
      }

      // Upsert to AgentContexts (using Drift-generated AgentContext type)
      await _upsertAgentContext(today, healthData);

      // Sync detailed metrics to HealthMetricsTimeSeries
      await _syncHealthMetrics(today, healthData);

      _talker.info('✅ Agent Sync: Complete for ${today.toIso8601String().split('T')[0]}');
      return true;
    } catch (e, stackTrace) {
      _talker.error('❌ Agent Sync failed: $e', e, stackTrace);
      return false;
    }
  }

  /// Fetch health data from HealthKit
  Future<_HealthData?> _fetchHealthData(DateTime start, DateTime end) async {
    try {
      // Check permissions first
      final hasPermission = await _healthKit.requestAuthorization();
      if (!hasPermission) {
        _talker.warning('⚠️  HealthKit: No permissions');
        return null;
      }

      // Fetch metrics
      final weight = await _healthKit.getLatestWeight();
      final sleep = await _healthKit.getSleepDuration(start, end);
      final hrv = await _healthKit.getLatestHRV();
      final restingHR = await _healthKit.getLatestRestingHeartRate();
      final steps = await _healthKit.getSteps(start, end);
      final activeCalories = await _healthKit.getActiveCalories(start, end);
      
      return _HealthData(
        weight: weight,
        sleepHours: sleep,
        hrv: hrv,
        restingHeartRate: restingHR,
        steps: steps?.toInt(),
        activeCalories: activeCalories?.toInt(),
      );
    } catch (e) {
      _talker.error('❌ HealthKit fetch failed: $e');
      return null;
    }
  }

  /// Upsert data to AgentContexts table
  /// 
  /// ⚠️ DRIFT RULES:
  /// - AgentContext is the Drift-generated type (not AgentContextData!)
  /// - .insert(): required → raw value, optional → Value<T>
  Future<void> _upsertAgentContext(DateTime date, _HealthData data) async {
    final dateOnly = DateTime(date.year, date.month, date.day);
    
    // Check if context exists for today
    final existing = await _db.getAgentContextForDate(dateOnly);

    if (existing == null) {
      // Insert new
      await _db.insertAgentContext(
        AgentContextsCompanion.insert(
          id: _uuid.v4(),                    // ✅ Required → raw String
          date: dateOnly,                    // ✅ Required → raw DateTime
          weight: Value(data.weight),        // ✅ Optional → Value<double?>
          sleepHours: Value(data.sleepHours), // ✅ Optional → Value<double?>
          hrv: Value(data.hrv),              // ✅ Optional → Value<double?>
          restingHeartRate: Value(data.restingHeartRate), // ✅ Optional → Value<double?>
          steps: Value(data.steps),          // ✅ Optional → Value<int?>
          activeCalories: Value(data.activeCalories), // ✅ Optional → Value<int?>
          createdAt: Value(DateTime.now()),  // ✅ Optional → Value<DateTime>
          updatedAt: Value(DateTime.now()),  // ✅ Optional → Value<DateTime>
        ),
      );
      _talker.debug('✅ Agent Context: Inserted for $dateOnly');
    } else {
      // Update existing
      await _db.updateAgentContext(
        AgentContextsCompanion(
          id: Value(existing.id),
          date: Value(dateOnly),
          weight: Value(data.weight ?? existing.weight),
          sleepHours: Value(data.sleepHours ?? existing.sleepHours),
          hrv: Value(data.hrv ?? existing.hrv),
          restingHeartRate: Value(data.restingHeartRate ?? existing.restingHeartRate),
          steps: Value(data.steps ?? existing.steps),
          activeCalories: Value(data.activeCalories ?? existing.activeCalories),
          updatedAt: Value(DateTime.now()),
        ),
      );
      _talker.debug('✅ Agent Context: Updated for $dateOnly');
    }
  }

  /// Sync detailed health metrics to HealthMetricsTimeSeries
  /// 
  /// ⚠️ DRIFT RULES:
  /// - HealthMetricsTimeSery is the Drift-generated type (not HealthMetricsTimeSeriesData!)
  Future<void> _syncHealthMetrics(DateTime date, _HealthData data) async {
    final metrics = <HealthMetricsTimeSeriesCompanion>[];
    final timestamp = DateTime.now();

    // Add HRV if available
    if (data.hrv != null) {
      metrics.add(
        HealthMetricsTimeSeriesCompanion.insert(
          id: _uuid.v4(),             // ✅ Required → raw String
          metricType: 'hrv',          // ✅ Required → raw String
          timestamp: timestamp,       // ✅ Required → raw DateTime
          value: data.hrv!,           // ✅ Required → raw double
          unit: Value('ms'),          // ✅ Optional → Value<String?>
        ),
      );
    }

    // Add Resting Heart Rate if available
    if (data.restingHeartRate != null) {
      metrics.add(
        HealthMetricsTimeSeriesCompanion.insert(
          id: _uuid.v4(),
          metricType: 'resting-heart-rate',
          timestamp: timestamp,
          value: data.restingHeartRate!,
          unit: Value('bpm'),
        ),
      );
    }

    // Batch insert
    if (metrics.isNotEmpty) {
      await _db.insertHealthMetricsBatch(
        metrics.map((c) => c).toList(),
      );
      _talker.debug('✅ Health Metrics: Inserted ${metrics.length} records');
    }
  }

  /// Get sync status for today
  Future<AgentSyncStatus> getSyncStatus() async {
    final today = DateTime.now();
    final dateOnly = DateTime(today.year, today.month, today.day);
    
    final context = await _db.getAgentContextForDate(dateOnly);
    
    if (context == null) {
      return AgentSyncStatus.notSynced;
    }
    
    // Check if data is recent (within last 6 hours)
    final age = DateTime.now().difference(context.updatedAt);
    if (age.inHours > 6) {
      return AgentSyncStatus.stale;
    }
    
    return AgentSyncStatus.synced;
  }

  /// Force a full re-sync (clear and re-fetch)
  Future<bool> forceSyncAll() async {
    try {
      _talker.info('🔄 Agent Sync: Force re-sync all data...');
      
      // Sync last 7 days
      final today = DateTime.now();
      for (int i = 0; i < 7; i++) {
        final date = today.subtract(Duration(days: i));
        final startOfDay = DateTime(date.year, date.month, date.day);
        final endOfDay = startOfDay.add(const Duration(days: 1));
        
        final healthData = await _fetchHealthData(startOfDay, endOfDay);
        if (healthData != null) {
          await _upsertAgentContext(date, healthData);
        }
      }
      
      _talker.info('✅ Agent Sync: Force sync complete (7 days)');
      return true;
    } catch (e, stackTrace) {
      _talker.error('❌ Force sync failed: $e', e, stackTrace);
      return false;
    }
  }
}

// ============================================================================
// PRIVATE TYPES
// ============================================================================

/// Internal health data container
class _HealthData {
  final double? weight;
  final double? sleepHours;
  final double? hrv;
  final double? restingHeartRate;
  final int? steps;
  final int? activeCalories;

  _HealthData({
    this.weight,
    this.sleepHours,
    this.hrv,
    this.restingHeartRate,
    this.steps,
    this.activeCalories,
  });
}

/// Sync status for today
enum AgentSyncStatus {
  notSynced,  // No data for today
  stale,      // Data exists but old (>6 hours)
  synced,     // Fresh data (<6 hours)
}

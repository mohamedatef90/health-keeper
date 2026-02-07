import 'dart:async';

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
  Timer? _periodicSyncTimer;

  AgentSyncService({
    required AppDatabase database,
    required HealthKitService healthKit,
    required Talker talker,
  })  : _db = database,
        _healthKit = healthKit,
        _talker = talker;

  /// Start periodic sync (every 30 minutes)
  void startPeriodicSync({Duration interval = const Duration(minutes: 30)}) {
    stopPeriodicSync();
    _talker.info('🔄 Agent Sync: Starting periodic sync (every ${interval.inMinutes} min)');
    _periodicSyncTimer = Timer.periodic(interval, (_) async {
      await syncTodayContext();
    });
  }

  /// Stop periodic sync
  void stopPeriodicSync() {
    _periodicSyncTimer?.cancel();
    _periodicSyncTimer = null;
  }

  /// Whether periodic sync is running
  bool get isPeriodicSyncActive => _periodicSyncTimer?.isActive ?? false;

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

  /// Fetch health data from HealthKit using correct method names
  Future<_HealthData?> _fetchHealthData(DateTime start, DateTime end) async {
    try {
      // Check permissions first
      final hasPermission = await _healthKit.requestPermissions();
      if (!hasPermission) {
        _talker.warning('⚠️  HealthKit: No permissions');
        return null;
      }

      // Fetch all categories in parallel for efficiency
      final date = start; // start is startOfDay
      final results = await Future.wait([
        _healthKit.fetchSleepData(date),           // 0
        _healthKit.fetchWorkouts(start, end),       // 1
        _healthKit.fetchBodyMeasurements(date),     // 2
        _healthKit.fetchVitalSigns(date),           // 3
        _healthKit.fetchNutritionData(start, end),  // 4
        _healthKit.fetchHeartMetrics(start, end),   // 5
        _healthKit.fetchRespiratoryMetrics(date),   // 6
        _healthKit.fetchMindfulnessMinutes(start, end), // 7
        _healthKit.fetchActivityMetrics(start, end), // 8
      ]);

      final sleep = results[0] as SleepData?;
      final workouts = results[1] as List<HealthKitWorkout>;
      final body = results[2] as BodyMeasurements;
      final vitals = results[3] as VitalSigns;
      final nutrition = results[4] as NutritionData;
      final heart = results[5] as HeartMetrics;
      final respiratory = results[6] as RespiratoryMetrics;
      final mindfulnessMinutes = results[7] as int?;
      final activity = results[8] as ActivityMetrics;

      // Calculate total exercise minutes from workouts if EXERCISE_TIME unavailable
      final int? effectiveExerciseMinutes = activity.exerciseMinutes ??
          (workouts.isNotEmpty ? workouts.fold<int>(0, (sum, w) => sum + w.duration) : null);

      return _HealthData(
        sleepDuration: sleep?.totalHours,
        sleepQuality: sleep?.quality,
        sleepHRV: heart.hrvSDNN?.toDouble(),
        sleepDeepMinutes: sleep?.deepMinutes,
        sleepRemMinutes: sleep?.remMinutes,
        sleepLightMinutes: sleep?.lightMinutes,
        sleepAwakeMinutes: sleep?.awakeMinutes,
        sleepWristTemperature: sleep?.wristTemperature,
        restingHeartRate: heart.restingHeartRate,
        steps: activity.steps,
        activeCalories: activity.activeEnergy?.toDouble(),
        weight: body.weight,
        exerciseMinutes: effectiveExerciseMinutes,
        bloodOxygen: respiratory.bloodOxygen,
        bodyFatPercentage: body.bodyFatPercentage,
        respiratoryRate: respiratory.respiratoryRate,
        walkingHeartRate: heart.walkingHeartRate,
        // Body
        bmi: body.bmi,
        height: body.height,
        leanBodyMass: body.leanBodyMass,
        waistCircumference: body.waistCircumference,
        bodyWaterMass: body.bodyWaterMass,
        // Vitals
        bloodGlucose: vitals.bloodGlucose,
        bodyTemperature: vitals.bodyTemperature,
        skinTemperature: vitals.skinTemperature,
        waterTemperature: vitals.waterTemperature,
        uvIndex: vitals.uvIndex,
        insulinDelivery: vitals.insulinDelivery,
        peripheralPerfusion: vitals.peripheralPerfusion,
        bloodPressureSystolic: vitals.bloodPressureSystolic,
        bloodPressureDiastolic: vitals.bloodPressureDiastolic,
        // Heart
        heartRate: heart.heartRate,
        hrvRMSSD: heart.hrvRMSSD,
        atrialFibrillationBurden: heart.atrialFibrillationBurden,
        highHeartRateEvents: heart.highHeartRateEvents,
        lowHeartRateEvents: heart.lowHeartRateEvents,
        irregularHeartRateEvents: heart.irregularHeartRateEvents,
        // Respiratory
        forcedExpiratoryVolume: respiratory.forcedExpiratoryVolume,
        // Activity
        mindfulnessMinutes: mindfulnessMinutes,
        basalEnergy: activity.basalEnergy,
        totalCalories: activity.totalCalories,
        flightsClimbed: activity.flightsClimbed,
        distanceWalkingRunning: activity.distanceWalkingRunning,
        distanceCycling: activity.distanceCycling,
        distanceSwimming: activity.distanceSwimming,
        appleStandHours: activity.appleStandHours,
        appleStandMinutes: activity.appleStandMinutes,
        appleMoveMinutes: activity.appleMoveMinutes,
        walkingSpeed: activity.walkingSpeed,
        underwaterDepth: activity.underwaterDepth,
        // Nutrition
        nutritionCalories: nutrition.calories,
        nutritionProtein: nutrition.protein,
        nutritionCarbs: nutrition.carbs,
        nutritionFat: nutrition.totalFat,
        nutritionWater: nutrition.water,
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
  /// - .insert(): required → raw value, optional → `Value<T>`
  Future<void> _upsertAgentContext(DateTime date, _HealthData data) async {
    final dateOnly = DateTime(date.year, date.month, date.day);
    final now = DateTime.now();

    // Check if context exists for today
    final existing = await _db.getAgentContextForDate(dateOnly);

    // Build sleep stages JSON from stage data
    String? sleepStagesJson;
    if (data.sleepDeepMinutes != null || data.sleepRemMinutes != null ||
        data.sleepLightMinutes != null || data.sleepAwakeMinutes != null) {
      sleepStagesJson = '{'
          '"deep": ${data.sleepDeepMinutes ?? 0}, '
          '"rem": ${data.sleepRemMinutes ?? 0}, '
          '"light": ${data.sleepLightMinutes ?? 0}, '
          '"awake": ${data.sleepAwakeMinutes ?? 0}'
          '}';
    }

    if (existing == null) {
      // Insert new
      await _db.insertAgentContext(
        AgentContextsCompanion.insert(
          id: _uuid.v4(),
          date: dateOnly,
          syncedAt: now,
          sleepDuration: Value(data.sleepDuration),
          sleepQuality: Value(data.sleepQuality),
          sleepHRV: Value(data.sleepHRV),
          sleepStagesJson: Value(sleepStagesJson),
          weight: Value(data.weight),
          bodyFat: Value(data.bodyFatPercentage),
          leanMass: Value(data.leanBodyMass),
          steps: Value(data.steps),
          activeCalories: Value(data.activeCalories),
          exerciseMinutes: Value(data.exerciseMinutes),
          caloriesConsumed: Value(data.nutritionCalories),
          protein: Value(data.nutritionProtein),
          carbs: Value(data.nutritionCarbs),
          fats: Value(data.nutritionFat),
          water: Value(data.nutritionWater),
          restingHeartRate: Value(data.restingHeartRate),
        ),
      );
      _talker.debug('✅ Agent Context: Inserted for $dateOnly');
    } else {
      // Update existing — merge new data, keep existing if new is null
      await _db.updateAgentContext(
        AgentContextsCompanion(
          id: Value(existing.id),
          date: Value(dateOnly),
          syncedAt: Value(now),
          sleepDuration: Value(data.sleepDuration ?? existing.sleepDuration),
          sleepQuality: Value(data.sleepQuality ?? existing.sleepQuality),
          sleepHRV: Value(data.sleepHRV ?? existing.sleepHRV),
          sleepStagesJson: Value(sleepStagesJson ?? existing.sleepStagesJson),
          weight: Value(data.weight ?? existing.weight),
          bodyFat: Value(data.bodyFatPercentage ?? existing.bodyFat),
          leanMass: Value(data.leanBodyMass ?? existing.leanMass),
          steps: Value(data.steps ?? existing.steps),
          activeCalories: Value(data.activeCalories ?? existing.activeCalories),
          exerciseMinutes: Value(data.exerciseMinutes ?? existing.exerciseMinutes),
          caloriesConsumed: Value(data.nutritionCalories ?? existing.caloriesConsumed),
          protein: Value(data.nutritionProtein ?? existing.protein),
          carbs: Value(data.nutritionCarbs ?? existing.carbs),
          fats: Value(data.nutritionFat ?? existing.fats),
          water: Value(data.nutritionWater ?? existing.water),
          restingHeartRate: Value(data.restingHeartRate ?? existing.restingHeartRate),
        ),
      );
      _talker.debug('✅ Agent Context: Updated for $dateOnly');
    }
  }

  /// Sync detailed health metrics to HealthMetricsTimeSeries
  Future<void> _syncHealthMetrics(DateTime date, _HealthData data) async {
    final metrics = <HealthMetricsTimeSeriesCompanion>[];
    final timestamp = DateTime.now();

    void addMetric(String type, double value, String unit) {
      metrics.add(
        HealthMetricsTimeSeriesCompanion.insert(
          id: _uuid.v4(),
          metricType: type,
          timestamp: timestamp,
          value: value,
          unit: unit,
          source: 'apple-health',
          syncedAt: timestamp,
        ),
      );
    }

    // Sleep
    if (data.sleepDuration != null) addMetric('sleep-duration', data.sleepDuration!, 'hours');
    if (data.sleepQuality != null) addMetric('sleep-quality', data.sleepQuality!.toDouble(), '%');
    if (data.sleepDeepMinutes != null) addMetric('sleep-deep', data.sleepDeepMinutes!.toDouble(), 'min');
    if (data.sleepRemMinutes != null) addMetric('sleep-rem', data.sleepRemMinutes!.toDouble(), 'min');
    if (data.sleepLightMinutes != null) addMetric('sleep-light', data.sleepLightMinutes!.toDouble(), 'min');
    if (data.sleepAwakeMinutes != null) addMetric('sleep-awake', data.sleepAwakeMinutes!.toDouble(), 'min');
    if (data.sleepWristTemperature != null) addMetric('sleep-wrist-temperature', data.sleepWristTemperature!, '°C');
    // Heart
    if (data.sleepHRV != null) addMetric('hrv-sdnn', data.sleepHRV!, 'ms');
    if (data.hrvRMSSD != null) addMetric('hrv-rmssd', data.hrvRMSSD!.toDouble(), 'ms');
    if (data.restingHeartRate != null) addMetric('resting-heart-rate', data.restingHeartRate!.toDouble(), 'bpm');
    if (data.heartRate != null) addMetric('heart-rate', data.heartRate!.toDouble(), 'bpm');
    if (data.walkingHeartRate != null) addMetric('walking-heart-rate', data.walkingHeartRate!.toDouble(), 'bpm');
    if (data.bloodPressureSystolic != null) addMetric('blood-pressure-systolic', data.bloodPressureSystolic!, 'mmHg');
    if (data.bloodPressureDiastolic != null) addMetric('blood-pressure-diastolic', data.bloodPressureDiastolic!, 'mmHg');
    if (data.atrialFibrillationBurden != null) addMetric('atrial-fibrillation-burden', data.atrialFibrillationBurden!, '%');
    if (data.highHeartRateEvents > 0) addMetric('high-heart-rate-events', data.highHeartRateEvents.toDouble(), 'count');
    if (data.lowHeartRateEvents > 0) addMetric('low-heart-rate-events', data.lowHeartRateEvents.toDouble(), 'count');
    if (data.irregularHeartRateEvents > 0) addMetric('irregular-heart-rate-events', data.irregularHeartRateEvents.toDouble(), 'count');
    // Activity
    if (data.steps != null) addMetric('steps', data.steps!.toDouble(), 'count');
    if (data.activeCalories != null) addMetric('active-calories', data.activeCalories!, 'kcal');
    if (data.basalEnergy != null) addMetric('basal-energy', data.basalEnergy!.toDouble(), 'kcal');
    if (data.totalCalories != null) addMetric('total-calories', data.totalCalories!.toDouble(), 'kcal');
    if (data.exerciseMinutes != null) addMetric('exercise-minutes', data.exerciseMinutes!.toDouble(), 'min');
    if (data.flightsClimbed != null) addMetric('flights-climbed', data.flightsClimbed!.toDouble(), 'count');
    if (data.distanceWalkingRunning != null) addMetric('distance-walking-running', data.distanceWalkingRunning!, 'km');
    if (data.distanceCycling != null) addMetric('distance-cycling', data.distanceCycling!, 'km');
    if (data.distanceSwimming != null) addMetric('distance-swimming', data.distanceSwimming!, 'km');
    if (data.appleStandHours != null) addMetric('apple-stand-hours', data.appleStandHours!.toDouble(), 'count');
    if (data.appleStandMinutes != null) addMetric('apple-stand-minutes', data.appleStandMinutes!.toDouble(), 'min');
    if (data.appleMoveMinutes != null) addMetric('apple-move-minutes', data.appleMoveMinutes!.toDouble(), 'min');
    if (data.walkingSpeed != null) addMetric('walking-speed', data.walkingSpeed!, 'm/s');
    if (data.underwaterDepth != null) addMetric('underwater-depth', data.underwaterDepth!, 'm');
    // Body
    if (data.weight != null) addMetric('weight', data.weight!, 'kg');
    if (data.bodyFatPercentage != null) addMetric('body-fat-percentage', data.bodyFatPercentage!, '%');
    if (data.bmi != null) addMetric('bmi', data.bmi!, 'kg/m2');
    if (data.height != null) addMetric('height', data.height!, 'cm');
    if (data.leanBodyMass != null) addMetric('lean-body-mass', data.leanBodyMass!, 'kg');
    if (data.waistCircumference != null) addMetric('waist-circumference', data.waistCircumference!, 'cm');
    if (data.bodyWaterMass != null) addMetric('body-water-mass', data.bodyWaterMass!, 'kg');
    // Respiratory
    if (data.bloodOxygen != null) addMetric('blood-oxygen', data.bloodOxygen!, '%');
    if (data.respiratoryRate != null) addMetric('respiratory-rate', data.respiratoryRate!, 'breaths/min');
    if (data.forcedExpiratoryVolume != null) addMetric('forced-expiratory-volume', data.forcedExpiratoryVolume!, 'L');
    // Vitals
    if (data.bloodGlucose != null) addMetric('blood-glucose', data.bloodGlucose!, 'mg/dL');
    if (data.bodyTemperature != null) addMetric('body-temperature', data.bodyTemperature!, '°C');
    if (data.skinTemperature != null) addMetric('skin-temperature', data.skinTemperature!, '°C');
    if (data.waterTemperature != null) addMetric('water-temperature', data.waterTemperature!, '°C');
    if (data.uvIndex != null) addMetric('uv-index', data.uvIndex!, 'index');
    if (data.insulinDelivery != null) addMetric('insulin-delivery', data.insulinDelivery!, 'IU');
    if (data.peripheralPerfusion != null) addMetric('peripheral-perfusion', data.peripheralPerfusion!, '%');
    // Mindfulness
    if (data.mindfulnessMinutes != null) addMetric('mindfulness', data.mindfulnessMinutes!.toDouble(), 'min');
    // Nutrition (macros only for time series)
    if (data.nutritionCalories != null) addMetric('nutrition-calories', data.nutritionCalories!, 'kcal');
    if (data.nutritionProtein != null) addMetric('nutrition-protein', data.nutritionProtein!, 'g');
    if (data.nutritionCarbs != null) addMetric('nutrition-carbs', data.nutritionCarbs!, 'g');
    if (data.nutritionFat != null) addMetric('nutrition-fat', data.nutritionFat!, 'g');
    if (data.nutritionWater != null) addMetric('nutrition-water', data.nutritionWater!, 'mL');

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
    final age = DateTime.now().difference(context.syncedAt);
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

/// Internal health data container (matches AgentContexts column types)
class _HealthData {
  // Sleep
  final double? sleepDuration;
  final int? sleepQuality;
  final double? sleepHRV;
  final int? sleepDeepMinutes;
  final int? sleepRemMinutes;
  final int? sleepLightMinutes;
  final int? sleepAwakeMinutes;
  final double? sleepWristTemperature;
  // Heart
  final int? restingHeartRate;
  final int? heartRate;
  final int? walkingHeartRate;
  final int? hrvRMSSD;
  final double? bloodPressureSystolic;
  final double? bloodPressureDiastolic;
  final double? atrialFibrillationBurden;
  final int highHeartRateEvents;
  final int lowHeartRateEvents;
  final int irregularHeartRateEvents;
  // Activity
  final int? steps;
  final double? activeCalories;
  final int? exerciseMinutes;
  final int? basalEnergy;
  final int? totalCalories;
  final int? flightsClimbed;
  final double? distanceWalkingRunning;
  final double? distanceCycling;
  final double? distanceSwimming;
  final int? appleStandHours;
  final int? appleStandMinutes;
  final int? appleMoveMinutes;
  final double? walkingSpeed;
  final double? underwaterDepth;
  // Body
  final double? weight;
  final double? bodyFatPercentage;
  final double? bmi;
  final double? height;
  final double? leanBodyMass;
  final double? waistCircumference;
  final double? bodyWaterMass;
  // Respiratory
  final double? bloodOxygen;
  final double? respiratoryRate;
  final double? forcedExpiratoryVolume;
  // Vitals
  final double? bloodGlucose;
  final double? bodyTemperature;
  final double? skinTemperature;
  final double? waterTemperature;
  final double? uvIndex;
  final double? insulinDelivery;
  final double? peripheralPerfusion;
  // Mindfulness
  final int? mindfulnessMinutes;
  // Nutrition (macros)
  final double? nutritionCalories;
  final double? nutritionProtein;
  final double? nutritionCarbs;
  final double? nutritionFat;
  final double? nutritionWater;

  _HealthData({
    this.sleepDuration,
    this.sleepQuality,
    this.sleepHRV,
    this.sleepDeepMinutes,
    this.sleepRemMinutes,
    this.sleepLightMinutes,
    this.sleepAwakeMinutes,
    this.sleepWristTemperature,
    this.restingHeartRate,
    this.heartRate,
    this.walkingHeartRate,
    this.hrvRMSSD,
    this.bloodPressureSystolic,
    this.bloodPressureDiastolic,
    this.atrialFibrillationBurden,
    this.highHeartRateEvents = 0,
    this.lowHeartRateEvents = 0,
    this.irregularHeartRateEvents = 0,
    this.steps,
    this.activeCalories,
    this.exerciseMinutes,
    this.basalEnergy,
    this.totalCalories,
    this.flightsClimbed,
    this.distanceWalkingRunning,
    this.distanceCycling,
    this.distanceSwimming,
    this.appleStandHours,
    this.appleStandMinutes,
    this.appleMoveMinutes,
    this.walkingSpeed,
    this.underwaterDepth,
    this.weight,
    this.bodyFatPercentage,
    this.bmi,
    this.height,
    this.leanBodyMass,
    this.waistCircumference,
    this.bodyWaterMass,
    this.bloodOxygen,
    this.respiratoryRate,
    this.forcedExpiratoryVolume,
    this.bloodGlucose,
    this.bodyTemperature,
    this.skinTemperature,
    this.waterTemperature,
    this.uvIndex,
    this.insulinDelivery,
    this.peripheralPerfusion,
    this.mindfulnessMinutes,
    this.nutritionCalories,
    this.nutritionProtein,
    this.nutritionCarbs,
    this.nutritionFat,
    this.nutritionWater,
  });
}

/// Sync status for today
enum AgentSyncStatus {
  notSynced,  // No data for today
  stale,      // Data exists but old (>6 hours)
  synced,     // Fresh data (<6 hours)
}

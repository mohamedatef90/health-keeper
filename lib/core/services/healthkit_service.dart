import 'package:health/health.dart';
import 'package:talker/talker.dart';

import '../domain/entities/recovery_metrics.dart';

// ============================================================================
// ABSTRACT SERVICE
// ============================================================================

/// Service for interacting with Apple HealthKit
abstract class HealthKitService {
  /// Request permissions for health data
  Future<bool> requestPermissions();

  /// Check if permissions have been granted
  Future<bool> hasPermissions();

  /// Fetch comprehensive health data for a specific date
  Future<HealthKitData?> fetchRecoveryData(DateTime date);

  // ── Individual Metrics (backward compat) ────────────────────

  Future<int?> fetchSteps(DateTime start, DateTime end);
  Future<SleepData?> fetchSleepData(DateTime date);
  Future<int?> fetchHRV(DateTime date);
  Future<int?> fetchRestingHeartRate(DateTime date);
  Future<int?> fetchActiveEnergy(DateTime start, DateTime end);
  Future<List<HealthKitWorkout>> fetchWorkouts(DateTime start, DateTime end);
  Future<double?> fetchWeight(DateTime date);
  Future<int?> fetchHeartRate(DateTime start, DateTime end);
  Future<int?> fetchExerciseMinutes(DateTime start, DateTime end);
  Future<int?> fetchBasalEnergy(DateTime start, DateTime end);
  Future<double?> fetchDistance(DateTime start, DateTime end);
  Future<int?> fetchFlightsClimbed(DateTime start, DateTime end);
  Future<double?> fetchBloodOxygen(DateTime date);
  Future<double?> fetchBodyFatPercentage(DateTime date);
  Future<double?> fetchRespiratoryRate(DateTime date);
  Future<int?> fetchWalkingHeartRate(DateTime start, DateTime end);

  // ── Category Fetches ────────────────────────────────────────

  Future<BodyMeasurements> fetchBodyMeasurements(DateTime date);
  Future<VitalSigns> fetchVitalSigns(DateTime date);
  Future<NutritionData> fetchNutritionData(DateTime start, DateTime end);
  Future<HeartMetrics> fetchHeartMetrics(DateTime start, DateTime end);
  Future<RespiratoryMetrics> fetchRespiratoryMetrics(DateTime date);
  Future<int?> fetchMindfulnessMinutes(DateTime start, DateTime end);
  Future<ActivityMetrics> fetchActivityMetrics(DateTime start, DateTime end);
}

// ============================================================================
// IMPLEMENTATION
// ============================================================================

class HealthKitServiceImpl implements HealthKitService {
  final Talker _talker;
  final Health _health = Health();

  HealthKitServiceImpl({required Talker talker}) : _talker = talker;

  // ── All types we request READ permission for ────────────────

  static const List<HealthDataType> _readTypes = [
    // Sleep
    HealthDataType.SLEEP_ASLEEP,
    HealthDataType.SLEEP_IN_BED,
    HealthDataType.SLEEP_DEEP,
    HealthDataType.SLEEP_REM,
    HealthDataType.SLEEP_LIGHT,
    HealthDataType.SLEEP_AWAKE,
    HealthDataType.SLEEP_AWAKE_IN_BED,
    HealthDataType.SLEEP_WRIST_TEMPERATURE,

    // Body Measurements
    HealthDataType.WEIGHT,
    HealthDataType.BODY_FAT_PERCENTAGE,
    HealthDataType.BODY_MASS_INDEX,
    HealthDataType.HEIGHT,
    HealthDataType.LEAN_BODY_MASS,
    HealthDataType.WAIST_CIRCUMFERENCE,
    HealthDataType.BODY_WATER_MASS,

    // Heart
    HealthDataType.HEART_RATE,
    HealthDataType.HEART_RATE_VARIABILITY_SDNN,
    HealthDataType.HEART_RATE_VARIABILITY_RMSSD,
    HealthDataType.RESTING_HEART_RATE,
    HealthDataType.WALKING_HEART_RATE,
    HealthDataType.BLOOD_PRESSURE_SYSTOLIC,
    HealthDataType.BLOOD_PRESSURE_DIASTOLIC,
    HealthDataType.HIGH_HEART_RATE_EVENT,
    HealthDataType.LOW_HEART_RATE_EVENT,
    HealthDataType.IRREGULAR_HEART_RATE_EVENT,
    HealthDataType.ATRIAL_FIBRILLATION_BURDEN,
    HealthDataType.ELECTROCARDIOGRAM,

    // Respiratory
    HealthDataType.BLOOD_OXYGEN,
    HealthDataType.RESPIRATORY_RATE,
    HealthDataType.FORCED_EXPIRATORY_VOLUME,

    // Activity
    HealthDataType.STEPS,
    HealthDataType.ACTIVE_ENERGY_BURNED,
    HealthDataType.BASAL_ENERGY_BURNED,
    HealthDataType.TOTAL_CALORIES_BURNED,
    HealthDataType.EXERCISE_TIME,
    HealthDataType.FLIGHTS_CLIMBED,
    HealthDataType.DISTANCE_WALKING_RUNNING,
    HealthDataType.DISTANCE_CYCLING,
    HealthDataType.DISTANCE_SWIMMING,
    HealthDataType.WORKOUT,
    HealthDataType.APPLE_STAND_HOUR,
    HealthDataType.APPLE_STAND_TIME,
    HealthDataType.APPLE_MOVE_TIME,
    HealthDataType.UNDERWATER_DEPTH,
    HealthDataType.WALKING_SPEED,
    HealthDataType.SPEED,
    HealthDataType.ACTIVITY_INTENSITY,

    // Vitals
    HealthDataType.BLOOD_GLUCOSE,
    HealthDataType.BODY_TEMPERATURE,
    HealthDataType.SKIN_TEMPERATURE,
    HealthDataType.INSULIN_DELIVERY,
    HealthDataType.PERIPHERAL_PERFUSION_INDEX,
    HealthDataType.WATER_TEMPERATURE,
    HealthDataType.UV_INDEX,

    // Mindfulness
    HealthDataType.MINDFULNESS,

    // Nutrition
    HealthDataType.DIETARY_ENERGY_CONSUMED,
    HealthDataType.DIETARY_PROTEIN_CONSUMED,
    HealthDataType.DIETARY_CARBS_CONSUMED,
    HealthDataType.DIETARY_FATS_CONSUMED,
    HealthDataType.DIETARY_SUGAR,
    HealthDataType.DIETARY_FIBER,
    HealthDataType.DIETARY_CHOLESTEROL,
    HealthDataType.DIETARY_CAFFEINE,
    HealthDataType.DIETARY_FAT_SATURATED,
    HealthDataType.DIETARY_FAT_MONOUNSATURATED,
    HealthDataType.DIETARY_FAT_POLYUNSATURATED,
    HealthDataType.DIETARY_BIOTIN,
    HealthDataType.DIETARY_VITAMIN_A,
    HealthDataType.DIETARY_VITAMIN_C,
    HealthDataType.DIETARY_VITAMIN_D,
    HealthDataType.DIETARY_VITAMIN_E,
    HealthDataType.DIETARY_VITAMIN_K,
    HealthDataType.DIETARY_THIAMIN,
    HealthDataType.DIETARY_RIBOFLAVIN,
    HealthDataType.DIETARY_NIACIN,
    HealthDataType.DIETARY_PANTOTHENIC_ACID,
    HealthDataType.DIETARY_VITAMIN_B6,
    HealthDataType.DIETARY_VITAMIN_B12,
    HealthDataType.DIETARY_FOLATE,
    HealthDataType.DIETARY_CALCIUM,
    HealthDataType.DIETARY_CHLORIDE,
    HealthDataType.DIETARY_IRON,
    HealthDataType.DIETARY_MAGNESIUM,
    HealthDataType.DIETARY_PHOSPHORUS,
    HealthDataType.DIETARY_POTASSIUM,
    HealthDataType.DIETARY_SODIUM,
    HealthDataType.DIETARY_ZINC,
    HealthDataType.DIETARY_CHROMIUM,
    HealthDataType.DIETARY_COPPER,
    HealthDataType.DIETARY_IODINE,
    HealthDataType.DIETARY_MANGANESE,
    HealthDataType.DIETARY_MOLYBDENUM,
    HealthDataType.DIETARY_SELENIUM,
    HealthDataType.WATER,

    // Headache / Symptoms
    HealthDataType.HEADACHE_NOT_PRESENT,
    HealthDataType.HEADACHE_MILD,
    HealthDataType.HEADACHE_MODERATE,
    HealthDataType.HEADACHE_SEVERE,
    HealthDataType.HEADACHE_UNSPECIFIED,

    // Reproductive
    HealthDataType.MENSTRUATION_FLOW,

    // Other
    HealthDataType.ELECTRODERMAL_ACTIVITY,
  ];

  // ── Permissions ─────────────────────────────────────────────

  @override
  Future<bool> requestPermissions() async {
    try {
      final permissions =
          _readTypes.map((type) => HealthDataAccess.READ).toList();
      final granted =
          await _health.requestAuthorization(_readTypes, permissions: permissions);
      _talker.info('HealthKit permissions granted: $granted');
      return granted;
    } catch (e, st) {
      _talker.error('Failed to request HealthKit permissions', e, st);
      return false;
    }
  }

  @override
  Future<bool> hasPermissions() async {
    try {
      final permissions =
          _readTypes.map((type) => HealthDataAccess.READ).toList();
      return await _health.hasPermissions(_readTypes, permissions: permissions) ??
          false;
    } catch (e) {
      _talker.warning('Failed to check HealthKit permissions: $e');
      return false;
    }
  }

  // ── Helpers ─────────────────────────────────────────────────

  Map<HealthDataType, List<HealthDataPoint>> _groupByType(
      List<HealthDataPoint> data) {
    final grouped = <HealthDataType, List<HealthDataPoint>>{};
    for (final point in data) {
      grouped.putIfAbsent(point.type, () => []).add(point);
    }
    return grouped;
  }

  double? _latestNumeric(List<HealthDataPoint>? points) {
    if (points == null || points.isEmpty) return null;
    final sorted = points.toList()
      ..sort((a, b) => b.dateFrom.compareTo(a.dateFrom));
    final value = sorted.first.value;
    return value is NumericHealthValue ? value.numericValue.toDouble() : null;
  }

  double? _sumNumeric(List<HealthDataPoint>? points) {
    if (points == null || points.isEmpty) return null;
    double total = 0;
    for (final point in points) {
      if (point.value is NumericHealthValue) {
        total += (point.value as NumericHealthValue).numericValue;
      }
    }
    return total;
  }

  double? _avgNumeric(List<HealthDataPoint>? points) {
    if (points == null || points.isEmpty) return null;
    double sum = 0;
    int count = 0;
    for (final point in points) {
      if (point.value is NumericHealthValue) {
        sum += (point.value as NumericHealthValue).numericValue;
        count++;
      }
    }
    return count > 0 ? sum / count : null;
  }

  int _sumDurationMinutes(List<HealthDataPoint>? points) {
    if (points == null || points.isEmpty) return 0;
    int total = 0;
    for (final point in points) {
      total += point.dateTo.difference(point.dateFrom).inMinutes;
    }
    return total;
  }

  // ── Comprehensive Fetch ─────────────────────────────────────

  @override
  Future<HealthKitData?> fetchRecoveryData(DateTime date) async {
    try {
      final startOfDay = DateTime(date.year, date.month, date.day);
      final endOfDay = startOfDay.add(const Duration(days: 1));

      // Fetch all categories in parallel
      final results = await Future.wait([
        fetchSleepData(date), // 0
        fetchWorkouts(startOfDay, endOfDay), // 1
        fetchBodyMeasurements(date), // 2
        fetchVitalSigns(date), // 3
        fetchNutritionData(startOfDay, endOfDay), // 4
        fetchHeartMetrics(startOfDay, endOfDay), // 5
        fetchRespiratoryMetrics(date), // 6
        fetchMindfulnessMinutes(startOfDay, endOfDay), // 7
        fetchActivityMetrics(startOfDay, endOfDay), // 8
      ]);

      return HealthKitData(
        date: date,
        sleep: results[0] as SleepData?,
        workouts: results[1] as List<HealthKitWorkout>,
        body: results[2] as BodyMeasurements,
        vitals: results[3] as VitalSigns,
        nutrition: results[4] as NutritionData,
        heart: results[5] as HeartMetrics,
        respiratory: results[6] as RespiratoryMetrics,
        mindfulnessMinutes: results[7] as int?,
        activity: results[8] as ActivityMetrics,
      );
    } catch (e, st) {
      _talker.error('Failed to fetch recovery data', e, st);
      return null;
    }
  }

  // ── Individual Fetch Methods (backward compat) ──────────────

  @override
  Future<int?> fetchSteps(DateTime start, DateTime end) async {
    try {
      final data = await _health.getHealthDataFromTypes(
        types: [HealthDataType.STEPS],
        startTime: start,
        endTime: end,
      );
      return _sumNumeric(data)?.toInt();
    } catch (e) {
      _talker.warning('Failed to fetch steps: $e');
      return null;
    }
  }

  @override
  Future<SleepData?> fetchSleepData(DateTime date) async {
    try {
      // Sleep data is for the previous night
      final sleepEnd = DateTime(date.year, date.month, date.day, 12);
      final sleepStart = sleepEnd.subtract(const Duration(hours: 18));

      final data = await _health.getHealthDataFromTypes(
        types: [
          HealthDataType.SLEEP_ASLEEP,
          HealthDataType.SLEEP_IN_BED,
          HealthDataType.SLEEP_DEEP,
          HealthDataType.SLEEP_REM,
          HealthDataType.SLEEP_LIGHT,
          HealthDataType.SLEEP_AWAKE,
          HealthDataType.SLEEP_AWAKE_IN_BED,
          HealthDataType.SLEEP_WRIST_TEMPERATURE,
        ],
        startTime: sleepStart,
        endTime: sleepEnd,
      );

      if (data.isEmpty) return null;

      int asleepMinutes = 0;
      int inBedMinutes = 0;
      int deepMinutes = 0;
      int remMinutes = 0;
      int lightMinutes = 0;
      int awakeMinutes = 0;
      double? wristTemp;

      for (final point in data) {
        if (point.type == HealthDataType.SLEEP_WRIST_TEMPERATURE) {
          if (point.value is NumericHealthValue) {
            wristTemp = (point.value as NumericHealthValue).numericValue.toDouble();
          }
          continue;
        }
        final duration = point.dateTo.difference(point.dateFrom).inMinutes;
        switch (point.type) {
          case HealthDataType.SLEEP_ASLEEP:
            asleepMinutes += duration;
          case HealthDataType.SLEEP_IN_BED:
            inBedMinutes += duration;
          case HealthDataType.SLEEP_DEEP:
            deepMinutes += duration;
          case HealthDataType.SLEEP_REM:
            remMinutes += duration;
          case HealthDataType.SLEEP_LIGHT:
            lightMinutes += duration;
          case HealthDataType.SLEEP_AWAKE:
          case HealthDataType.SLEEP_AWAKE_IN_BED:
            awakeMinutes += duration;
          default:
            break;
        }
      }

      final totalHours = asleepMinutes / 60;
      final efficiency = inBedMinutes > 0
          ? (asleepMinutes / inBedMinutes * 100).round()
          : null;

      return SleepData(
        totalHours: totalHours,
        asleepMinutes: asleepMinutes,
        inBedMinutes: inBedMinutes,
        quality: efficiency,
        deepMinutes: deepMinutes,
        remMinutes: remMinutes,
        lightMinutes: lightMinutes,
        awakeMinutes: awakeMinutes,
        wristTemperature: wristTemp,
      );
    } catch (e) {
      _talker.warning('Failed to fetch sleep data: $e');
      return null;
    }
  }

  @override
  Future<int?> fetchHRV(DateTime date) async {
    try {
      final startOfDay = DateTime(date.year, date.month, date.day);
      final endOfDay = startOfDay.add(const Duration(days: 1));
      final data = await _health.getHealthDataFromTypes(
        types: [HealthDataType.HEART_RATE_VARIABILITY_SDNN],
        startTime: startOfDay,
        endTime: endOfDay,
      );
      return _avgNumeric(data)?.round();
    } catch (e) {
      _talker.warning('Failed to fetch HRV: $e');
      return null;
    }
  }

  @override
  Future<int?> fetchRestingHeartRate(DateTime date) async {
    try {
      final startOfDay = DateTime(date.year, date.month, date.day);
      final endOfDay = startOfDay.add(const Duration(days: 1));
      final data = await _health.getHealthDataFromTypes(
        types: [HealthDataType.RESTING_HEART_RATE],
        startTime: startOfDay,
        endTime: endOfDay,
      );
      return _latestNumeric(data)?.round();
    } catch (e) {
      _talker.warning('Failed to fetch resting heart rate: $e');
      return null;
    }
  }

  @override
  Future<int?> fetchActiveEnergy(DateTime start, DateTime end) async {
    try {
      final data = await _health.getHealthDataFromTypes(
        types: [HealthDataType.ACTIVE_ENERGY_BURNED],
        startTime: start,
        endTime: end,
      );
      return _sumNumeric(data)?.round();
    } catch (e) {
      _talker.warning('Failed to fetch active energy: $e');
      return null;
    }
  }

  @override
  Future<double?> fetchWeight(DateTime date) async {
    try {
      final end =
          DateTime(date.year, date.month, date.day).add(const Duration(days: 1));
      final start = end.subtract(const Duration(days: 7));
      final data = await _health.getHealthDataFromTypes(
        types: [HealthDataType.WEIGHT],
        startTime: start,
        endTime: end,
      );
      return _latestNumeric(data);
    } catch (e) {
      _talker.warning('Failed to fetch weight: $e');
      return null;
    }
  }

  @override
  Future<int?> fetchHeartRate(DateTime start, DateTime end) async {
    try {
      final data = await _health.getHealthDataFromTypes(
        types: [HealthDataType.HEART_RATE],
        startTime: start,
        endTime: end,
      );
      return _avgNumeric(data)?.round();
    } catch (e) {
      _talker.warning('Failed to fetch heart rate: $e');
      return null;
    }
  }

  @override
  Future<int?> fetchExerciseMinutes(DateTime start, DateTime end) async {
    try {
      final data = await _health.getHealthDataFromTypes(
        types: [HealthDataType.EXERCISE_TIME],
        startTime: start,
        endTime: end,
      );
      return _sumNumeric(data)?.round();
    } catch (e) {
      _talker.warning('Failed to fetch exercise minutes: $e');
      return null;
    }
  }

  @override
  Future<int?> fetchBasalEnergy(DateTime start, DateTime end) async {
    try {
      final data = await _health.getHealthDataFromTypes(
        types: [HealthDataType.BASAL_ENERGY_BURNED],
        startTime: start,
        endTime: end,
      );
      return _sumNumeric(data)?.round();
    } catch (e) {
      _talker.warning('Failed to fetch basal energy: $e');
      return null;
    }
  }

  @override
  Future<double?> fetchDistance(DateTime start, DateTime end) async {
    try {
      final data = await _health.getHealthDataFromTypes(
        types: [HealthDataType.DISTANCE_WALKING_RUNNING],
        startTime: start,
        endTime: end,
      );
      final meters = _sumNumeric(data);
      return meters != null ? meters / 1000.0 : null;
    } catch (e) {
      _talker.warning('Failed to fetch distance: $e');
      return null;
    }
  }

  @override
  Future<int?> fetchFlightsClimbed(DateTime start, DateTime end) async {
    try {
      final data = await _health.getHealthDataFromTypes(
        types: [HealthDataType.FLIGHTS_CLIMBED],
        startTime: start,
        endTime: end,
      );
      return _sumNumeric(data)?.round();
    } catch (e) {
      _talker.warning('Failed to fetch flights climbed: $e');
      return null;
    }
  }

  @override
  Future<double?> fetchBloodOxygen(DateTime date) async {
    try {
      final startOfDay = DateTime(date.year, date.month, date.day);
      final endOfDay = startOfDay.add(const Duration(days: 1));
      final data = await _health.getHealthDataFromTypes(
        types: [HealthDataType.BLOOD_OXYGEN],
        startTime: startOfDay,
        endTime: endOfDay,
      );
      return _latestNumeric(data);
    } catch (e) {
      _talker.warning('Failed to fetch blood oxygen: $e');
      return null;
    }
  }

  @override
  Future<double?> fetchBodyFatPercentage(DateTime date) async {
    try {
      final end =
          DateTime(date.year, date.month, date.day).add(const Duration(days: 1));
      final start = end.subtract(const Duration(days: 30));
      final data = await _health.getHealthDataFromTypes(
        types: [HealthDataType.BODY_FAT_PERCENTAGE],
        startTime: start,
        endTime: end,
      );
      return _latestNumeric(data);
    } catch (e) {
      _talker.warning('Failed to fetch body fat percentage: $e');
      return null;
    }
  }

  @override
  Future<double?> fetchRespiratoryRate(DateTime date) async {
    try {
      final startOfDay = DateTime(date.year, date.month, date.day);
      final endOfDay = startOfDay.add(const Duration(days: 1));
      final data = await _health.getHealthDataFromTypes(
        types: [HealthDataType.RESPIRATORY_RATE],
        startTime: startOfDay,
        endTime: endOfDay,
      );
      return _avgNumeric(data);
    } catch (e) {
      _talker.warning('Failed to fetch respiratory rate: $e');
      return null;
    }
  }

  @override
  Future<int?> fetchWalkingHeartRate(DateTime start, DateTime end) async {
    try {
      final data = await _health.getHealthDataFromTypes(
        types: [HealthDataType.WALKING_HEART_RATE],
        startTime: start,
        endTime: end,
      );
      return _avgNumeric(data)?.round();
    } catch (e) {
      _talker.warning('Failed to fetch walking heart rate: $e');
      return null;
    }
  }

  @override
  Future<List<HealthKitWorkout>> fetchWorkouts(
      DateTime start, DateTime end) async {
    try {
      final data = await _health.getHealthDataFromTypes(
        types: [HealthDataType.WORKOUT],
        startTime: start,
        endTime: end,
      );

      return data.map((point) {
        final workoutValue = point.value as WorkoutHealthValue;
        return HealthKitWorkout(
          type: workoutValue.workoutActivityType.name,
          duration: point.dateTo.difference(point.dateFrom).inMinutes,
          calories: workoutValue.totalEnergyBurned?.round(),
          startTime: point.dateFrom,
          endTime: point.dateTo,
        );
      }).toList();
    } catch (e) {
      _talker.warning('Failed to fetch workouts: $e');
      return [];
    }
  }

  // ── Category Fetch Methods ──────────────────────────────────

  @override
  Future<BodyMeasurements> fetchBodyMeasurements(DateTime date) async {
    try {
      final end =
          DateTime(date.year, date.month, date.day).add(const Duration(days: 1));
      final start = end.subtract(const Duration(days: 30));

      final data = await _health.getHealthDataFromTypes(
        types: [
          HealthDataType.WEIGHT,
          HealthDataType.BODY_FAT_PERCENTAGE,
          HealthDataType.BODY_MASS_INDEX,
          HealthDataType.HEIGHT,
          HealthDataType.LEAN_BODY_MASS,
          HealthDataType.WAIST_CIRCUMFERENCE,
          HealthDataType.BODY_WATER_MASS,
        ],
        startTime: start,
        endTime: end,
      );

      final grouped = _groupByType(data);

      return BodyMeasurements(
        weight: _latestNumeric(grouped[HealthDataType.WEIGHT]),
        bodyFatPercentage:
            _latestNumeric(grouped[HealthDataType.BODY_FAT_PERCENTAGE]),
        bmi: _latestNumeric(grouped[HealthDataType.BODY_MASS_INDEX]),
        height: _latestNumeric(grouped[HealthDataType.HEIGHT]),
        leanBodyMass: _latestNumeric(grouped[HealthDataType.LEAN_BODY_MASS]),
        waistCircumference:
            _latestNumeric(grouped[HealthDataType.WAIST_CIRCUMFERENCE]),
        bodyWaterMass: _latestNumeric(grouped[HealthDataType.BODY_WATER_MASS]),
      );
    } catch (e) {
      _talker.warning('Failed to fetch body measurements: $e');
      return const BodyMeasurements();
    }
  }

  @override
  Future<VitalSigns> fetchVitalSigns(DateTime date) async {
    try {
      final startOfDay = DateTime(date.year, date.month, date.day);
      final endOfDay = startOfDay.add(const Duration(days: 1));

      final data = await _health.getHealthDataFromTypes(
        types: [
          HealthDataType.BLOOD_GLUCOSE,
          HealthDataType.BODY_TEMPERATURE,
          HealthDataType.SKIN_TEMPERATURE,
          HealthDataType.BLOOD_PRESSURE_SYSTOLIC,
          HealthDataType.BLOOD_PRESSURE_DIASTOLIC,
          HealthDataType.INSULIN_DELIVERY,
          HealthDataType.PERIPHERAL_PERFUSION_INDEX,
          HealthDataType.WATER_TEMPERATURE,
          HealthDataType.UV_INDEX,
        ],
        startTime: startOfDay,
        endTime: endOfDay,
      );

      final grouped = _groupByType(data);

      return VitalSigns(
        bloodGlucose: _latestNumeric(grouped[HealthDataType.BLOOD_GLUCOSE]),
        bodyTemperature:
            _latestNumeric(grouped[HealthDataType.BODY_TEMPERATURE]),
        skinTemperature:
            _latestNumeric(grouped[HealthDataType.SKIN_TEMPERATURE]),
        bloodPressureSystolic:
            _latestNumeric(grouped[HealthDataType.BLOOD_PRESSURE_SYSTOLIC]),
        bloodPressureDiastolic:
            _latestNumeric(grouped[HealthDataType.BLOOD_PRESSURE_DIASTOLIC]),
        insulinDelivery:
            _sumNumeric(grouped[HealthDataType.INSULIN_DELIVERY]),
        peripheralPerfusion:
            _latestNumeric(grouped[HealthDataType.PERIPHERAL_PERFUSION_INDEX]),
        waterTemperature:
            _latestNumeric(grouped[HealthDataType.WATER_TEMPERATURE]),
        uvIndex: _latestNumeric(grouped[HealthDataType.UV_INDEX]),
      );
    } catch (e) {
      _talker.warning('Failed to fetch vital signs: $e');
      return const VitalSigns();
    }
  }

  @override
  Future<NutritionData> fetchNutritionData(
      DateTime start, DateTime end) async {
    try {
      final data = await _health.getHealthDataFromTypes(
        types: [
          HealthDataType.DIETARY_ENERGY_CONSUMED,
          HealthDataType.DIETARY_PROTEIN_CONSUMED,
          HealthDataType.DIETARY_CARBS_CONSUMED,
          HealthDataType.DIETARY_FATS_CONSUMED,
          HealthDataType.DIETARY_SUGAR,
          HealthDataType.DIETARY_FIBER,
          HealthDataType.DIETARY_CHOLESTEROL,
          HealthDataType.DIETARY_CAFFEINE,
          HealthDataType.DIETARY_FAT_SATURATED,
          HealthDataType.DIETARY_FAT_MONOUNSATURATED,
          HealthDataType.DIETARY_FAT_POLYUNSATURATED,
          HealthDataType.DIETARY_BIOTIN,
          HealthDataType.DIETARY_VITAMIN_A,
          HealthDataType.DIETARY_VITAMIN_C,
          HealthDataType.DIETARY_VITAMIN_D,
          HealthDataType.DIETARY_VITAMIN_E,
          HealthDataType.DIETARY_VITAMIN_K,
          HealthDataType.DIETARY_THIAMIN,
          HealthDataType.DIETARY_RIBOFLAVIN,
          HealthDataType.DIETARY_NIACIN,
          HealthDataType.DIETARY_PANTOTHENIC_ACID,
          HealthDataType.DIETARY_VITAMIN_B6,
          HealthDataType.DIETARY_VITAMIN_B12,
          HealthDataType.DIETARY_FOLATE,
          HealthDataType.DIETARY_CALCIUM,
          HealthDataType.DIETARY_CHLORIDE,
          HealthDataType.DIETARY_IRON,
          HealthDataType.DIETARY_MAGNESIUM,
          HealthDataType.DIETARY_PHOSPHORUS,
          HealthDataType.DIETARY_POTASSIUM,
          HealthDataType.DIETARY_SODIUM,
          HealthDataType.DIETARY_ZINC,
          HealthDataType.DIETARY_CHROMIUM,
          HealthDataType.DIETARY_COPPER,
          HealthDataType.DIETARY_IODINE,
          HealthDataType.DIETARY_MANGANESE,
          HealthDataType.DIETARY_MOLYBDENUM,
          HealthDataType.DIETARY_SELENIUM,
          HealthDataType.WATER,
        ],
        startTime: start,
        endTime: end,
      );

      final g = _groupByType(data);

      return NutritionData(
        calories: _sumNumeric(g[HealthDataType.DIETARY_ENERGY_CONSUMED]),
        protein: _sumNumeric(g[HealthDataType.DIETARY_PROTEIN_CONSUMED]),
        carbs: _sumNumeric(g[HealthDataType.DIETARY_CARBS_CONSUMED]),
        totalFat: _sumNumeric(g[HealthDataType.DIETARY_FATS_CONSUMED]),
        saturatedFat: _sumNumeric(g[HealthDataType.DIETARY_FAT_SATURATED]),
        monounsaturatedFat:
            _sumNumeric(g[HealthDataType.DIETARY_FAT_MONOUNSATURATED]),
        polyunsaturatedFat:
            _sumNumeric(g[HealthDataType.DIETARY_FAT_POLYUNSATURATED]),
        sugar: _sumNumeric(g[HealthDataType.DIETARY_SUGAR]),
        fiber: _sumNumeric(g[HealthDataType.DIETARY_FIBER]),
        cholesterol: _sumNumeric(g[HealthDataType.DIETARY_CHOLESTEROL]),
        caffeine: _sumNumeric(g[HealthDataType.DIETARY_CAFFEINE]),
        water: _sumNumeric(g[HealthDataType.WATER]),
        // Vitamins
        vitaminA: _sumNumeric(g[HealthDataType.DIETARY_VITAMIN_A]),
        vitaminC: _sumNumeric(g[HealthDataType.DIETARY_VITAMIN_C]),
        vitaminD: _sumNumeric(g[HealthDataType.DIETARY_VITAMIN_D]),
        vitaminE: _sumNumeric(g[HealthDataType.DIETARY_VITAMIN_E]),
        vitaminK: _sumNumeric(g[HealthDataType.DIETARY_VITAMIN_K]),
        thiamin: _sumNumeric(g[HealthDataType.DIETARY_THIAMIN]),
        riboflavin: _sumNumeric(g[HealthDataType.DIETARY_RIBOFLAVIN]),
        niacin: _sumNumeric(g[HealthDataType.DIETARY_NIACIN]),
        pantothenicAcid:
            _sumNumeric(g[HealthDataType.DIETARY_PANTOTHENIC_ACID]),
        vitaminB6: _sumNumeric(g[HealthDataType.DIETARY_VITAMIN_B6]),
        vitaminB12: _sumNumeric(g[HealthDataType.DIETARY_VITAMIN_B12]),
        biotin: _sumNumeric(g[HealthDataType.DIETARY_BIOTIN]),
        folate: _sumNumeric(g[HealthDataType.DIETARY_FOLATE]),
        // Minerals
        calcium: _sumNumeric(g[HealthDataType.DIETARY_CALCIUM]),
        chloride: _sumNumeric(g[HealthDataType.DIETARY_CHLORIDE]),
        iron: _sumNumeric(g[HealthDataType.DIETARY_IRON]),
        magnesium: _sumNumeric(g[HealthDataType.DIETARY_MAGNESIUM]),
        phosphorus: _sumNumeric(g[HealthDataType.DIETARY_PHOSPHORUS]),
        potassium: _sumNumeric(g[HealthDataType.DIETARY_POTASSIUM]),
        sodium: _sumNumeric(g[HealthDataType.DIETARY_SODIUM]),
        zinc: _sumNumeric(g[HealthDataType.DIETARY_ZINC]),
        chromium: _sumNumeric(g[HealthDataType.DIETARY_CHROMIUM]),
        copper: _sumNumeric(g[HealthDataType.DIETARY_COPPER]),
        iodine: _sumNumeric(g[HealthDataType.DIETARY_IODINE]),
        manganese: _sumNumeric(g[HealthDataType.DIETARY_MANGANESE]),
        molybdenum: _sumNumeric(g[HealthDataType.DIETARY_MOLYBDENUM]),
        selenium: _sumNumeric(g[HealthDataType.DIETARY_SELENIUM]),
      );
    } catch (e) {
      _talker.warning('Failed to fetch nutrition data: $e');
      return const NutritionData();
    }
  }

  @override
  Future<HeartMetrics> fetchHeartMetrics(DateTime start, DateTime end) async {
    try {
      final data = await _health.getHealthDataFromTypes(
        types: [
          HealthDataType.HEART_RATE,
          HealthDataType.HEART_RATE_VARIABILITY_SDNN,
          HealthDataType.HEART_RATE_VARIABILITY_RMSSD,
          HealthDataType.RESTING_HEART_RATE,
          HealthDataType.WALKING_HEART_RATE,
          HealthDataType.BLOOD_PRESSURE_SYSTOLIC,
          HealthDataType.BLOOD_PRESSURE_DIASTOLIC,
          HealthDataType.HIGH_HEART_RATE_EVENT,
          HealthDataType.LOW_HEART_RATE_EVENT,
          HealthDataType.IRREGULAR_HEART_RATE_EVENT,
          HealthDataType.ATRIAL_FIBRILLATION_BURDEN,
        ],
        startTime: start,
        endTime: end,
      );

      final g = _groupByType(data);

      return HeartMetrics(
        heartRate: _avgNumeric(g[HealthDataType.HEART_RATE])?.round(),
        restingHeartRate:
            _latestNumeric(g[HealthDataType.RESTING_HEART_RATE])?.round(),
        walkingHeartRate:
            _avgNumeric(g[HealthDataType.WALKING_HEART_RATE])?.round(),
        hrvSDNN: _avgNumeric(g[HealthDataType.HEART_RATE_VARIABILITY_SDNN])
            ?.round(),
        hrvRMSSD: _avgNumeric(g[HealthDataType.HEART_RATE_VARIABILITY_RMSSD])
            ?.round(),
        bloodPressureSystolic:
            _latestNumeric(g[HealthDataType.BLOOD_PRESSURE_SYSTOLIC]),
        bloodPressureDiastolic:
            _latestNumeric(g[HealthDataType.BLOOD_PRESSURE_DIASTOLIC]),
        highHeartRateEvents:
            g[HealthDataType.HIGH_HEART_RATE_EVENT]?.length ?? 0,
        lowHeartRateEvents:
            g[HealthDataType.LOW_HEART_RATE_EVENT]?.length ?? 0,
        irregularHeartRateEvents:
            g[HealthDataType.IRREGULAR_HEART_RATE_EVENT]?.length ?? 0,
        atrialFibrillationBurden:
            _latestNumeric(g[HealthDataType.ATRIAL_FIBRILLATION_BURDEN]),
      );
    } catch (e) {
      _talker.warning('Failed to fetch heart metrics: $e');
      return const HeartMetrics();
    }
  }

  @override
  Future<RespiratoryMetrics> fetchRespiratoryMetrics(DateTime date) async {
    try {
      final startOfDay = DateTime(date.year, date.month, date.day);
      final endOfDay = startOfDay.add(const Duration(days: 1));

      final data = await _health.getHealthDataFromTypes(
        types: [
          HealthDataType.BLOOD_OXYGEN,
          HealthDataType.RESPIRATORY_RATE,
          HealthDataType.FORCED_EXPIRATORY_VOLUME,
        ],
        startTime: startOfDay,
        endTime: endOfDay,
      );

      final g = _groupByType(data);

      return RespiratoryMetrics(
        bloodOxygen: _latestNumeric(g[HealthDataType.BLOOD_OXYGEN]),
        respiratoryRate: _avgNumeric(g[HealthDataType.RESPIRATORY_RATE]),
        forcedExpiratoryVolume:
            _latestNumeric(g[HealthDataType.FORCED_EXPIRATORY_VOLUME]),
      );
    } catch (e) {
      _talker.warning('Failed to fetch respiratory metrics: $e');
      return const RespiratoryMetrics();
    }
  }

  @override
  Future<int?> fetchMindfulnessMinutes(DateTime start, DateTime end) async {
    try {
      final data = await _health.getHealthDataFromTypes(
        types: [HealthDataType.MINDFULNESS],
        startTime: start,
        endTime: end,
      );
      if (data.isEmpty) return null;
      return _sumDurationMinutes(data);
    } catch (e) {
      _talker.warning('Failed to fetch mindfulness: $e');
      return null;
    }
  }

  @override
  Future<ActivityMetrics> fetchActivityMetrics(
      DateTime start, DateTime end) async {
    try {
      final data = await _health.getHealthDataFromTypes(
        types: [
          HealthDataType.STEPS,
          HealthDataType.ACTIVE_ENERGY_BURNED,
          HealthDataType.BASAL_ENERGY_BURNED,
          HealthDataType.TOTAL_CALORIES_BURNED,
          HealthDataType.EXERCISE_TIME,
          HealthDataType.FLIGHTS_CLIMBED,
          HealthDataType.DISTANCE_WALKING_RUNNING,
          HealthDataType.DISTANCE_CYCLING,
          HealthDataType.DISTANCE_SWIMMING,
          HealthDataType.APPLE_STAND_HOUR,
          HealthDataType.APPLE_STAND_TIME,
          HealthDataType.APPLE_MOVE_TIME,
          HealthDataType.WALKING_SPEED,
          HealthDataType.UNDERWATER_DEPTH,
        ],
        startTime: start,
        endTime: end,
      );

      final g = _groupByType(data);

      return ActivityMetrics(
        steps: _sumNumeric(g[HealthDataType.STEPS])?.round(),
        activeEnergy:
            _sumNumeric(g[HealthDataType.ACTIVE_ENERGY_BURNED])?.round(),
        basalEnergy:
            _sumNumeric(g[HealthDataType.BASAL_ENERGY_BURNED])?.round(),
        totalCalories:
            _sumNumeric(g[HealthDataType.TOTAL_CALORIES_BURNED])?.round(),
        exerciseMinutes:
            _sumNumeric(g[HealthDataType.EXERCISE_TIME])?.round(),
        flightsClimbed:
            _sumNumeric(g[HealthDataType.FLIGHTS_CLIMBED])?.round(),
        distanceWalkingRunning: _sumNumeric(
                    g[HealthDataType.DISTANCE_WALKING_RUNNING]) !=
                null
            ? _sumNumeric(g[HealthDataType.DISTANCE_WALKING_RUNNING])! / 1000.0
            : null,
        distanceCycling:
            _sumNumeric(g[HealthDataType.DISTANCE_CYCLING]) != null
                ? _sumNumeric(g[HealthDataType.DISTANCE_CYCLING])! / 1000.0
                : null,
        distanceSwimming:
            _sumNumeric(g[HealthDataType.DISTANCE_SWIMMING]) != null
                ? _sumNumeric(g[HealthDataType.DISTANCE_SWIMMING])! / 1000.0
                : null,
        appleStandHours:
            _sumNumeric(g[HealthDataType.APPLE_STAND_HOUR])?.round(),
        appleStandMinutes:
            _sumNumeric(g[HealthDataType.APPLE_STAND_TIME])?.round(),
        appleMoveMinutes:
            _sumNumeric(g[HealthDataType.APPLE_MOVE_TIME])?.round(),
        walkingSpeed: _avgNumeric(g[HealthDataType.WALKING_SPEED]),
        underwaterDepth: _latestNumeric(g[HealthDataType.UNDERWATER_DEPTH]),
      );
    } catch (e) {
      _talker.warning('Failed to fetch activity metrics: $e');
      return const ActivityMetrics();
    }
  }
}

// ============================================================================
// DATA CLASSES
// ============================================================================

/// Comprehensive health data from HealthKit
class HealthKitData {
  final DateTime date;
  final SleepData? sleep;
  final List<HealthKitWorkout> workouts;
  final BodyMeasurements body;
  final VitalSigns vitals;
  final NutritionData nutrition;
  final HeartMetrics heart;
  final RespiratoryMetrics respiratory;
  final int? mindfulnessMinutes;
  final ActivityMetrics activity;

  HealthKitData({
    required this.date,
    this.sleep,
    this.workouts = const [],
    this.body = const BodyMeasurements(),
    this.vitals = const VitalSigns(),
    this.nutrition = const NutritionData(),
    this.heart = const HeartMetrics(),
    this.respiratory = const RespiratoryMetrics(),
    this.mindfulnessMinutes,
    this.activity = const ActivityMetrics(),
  });

  // ── Backward-compat getters ─────────────────────────────────

  double? get sleepDuration => sleep?.totalHours;
  int? get sleepQuality => sleep?.quality;
  int? get hrv => heart.hrvSDNN;
  int? get restingHR => heart.restingHeartRate;
  int? get steps => activity.steps;
  int? get activeEnergy => activity.activeEnergy;
  int get workoutsCount => workouts.length;
  double? get weight => body.weight;
  int? get exerciseMinutes => activity.exerciseMinutes;
  int? get heartRate => heart.heartRate;
  double? get distance => activity.distanceWalkingRunning;
  int? get flightsClimbed => activity.flightsClimbed;
  int? get basalEnergy => activity.basalEnergy;
  double? get bloodOxygen => respiratory.bloodOxygen;
  double? get bodyFatPercentage => body.bodyFatPercentage;
  double? get respiratoryRate => respiratory.respiratoryRate;
  int? get walkingHeartRate => heart.walkingHeartRate;

  /// Convert to RecoveryMetrics entity
  RecoveryMetrics toRecoveryMetrics(String id, String dailyLogId) {
    return RecoveryMetrics(
      id: id,
      dailyLogId: dailyLogId,
      date: date,
      fetchedAt: DateTime.now(),
      sleepDuration: sleepDuration,
      sleepQuality: sleepQuality,
      hrv: hrv,
      restingHR: restingHR,
      steps: steps,
      activeEnergy: activeEnergy,
      workoutsCount: workoutsCount,
      dataSource: DataSource.healthkit,
    );
  }
}

/// Sleep data with stage breakdown
class SleepData {
  final double totalHours;
  final int asleepMinutes;
  final int inBedMinutes;
  final int? quality; // Sleep efficiency percentage
  final int deepMinutes;
  final int remMinutes;
  final int lightMinutes;
  final int awakeMinutes;

  final double? wristTemperature; // °C (sleep wrist temp deviation)

  SleepData({
    required this.totalHours,
    required this.asleepMinutes,
    required this.inBedMinutes,
    this.quality,
    this.deepMinutes = 0,
    this.remMinutes = 0,
    this.lightMinutes = 0,
    this.awakeMinutes = 0,
    this.wristTemperature,
  });

  double get deepHours => deepMinutes / 60.0;
  double get remHours => remMinutes / 60.0;
  double get lightHours => lightMinutes / 60.0;
  double get awakeHours => awakeMinutes / 60.0;
}

/// Workout data from HealthKit
class HealthKitWorkout {
  final String type;
  final int duration; // in minutes
  final int? calories;
  final DateTime startTime;
  final DateTime endTime;

  HealthKitWorkout({
    required this.type,
    required this.duration,
    this.calories,
    required this.startTime,
    required this.endTime,
  });
}

/// Body measurements from HealthKit
class BodyMeasurements {
  final double? weight; // kg
  final double? bodyFatPercentage; // %
  final double? bmi;
  final double? height; // cm
  final double? leanBodyMass; // kg
  final double? waistCircumference; // cm
  final double? bodyWaterMass; // kg

  const BodyMeasurements({
    this.weight,
    this.bodyFatPercentage,
    this.bmi,
    this.height,
    this.leanBodyMass,
    this.waistCircumference,
    this.bodyWaterMass,
  });
}

/// Vital signs from HealthKit
class VitalSigns {
  final double? bloodGlucose; // mg/dL
  final double? bodyTemperature; // °C
  final double? skinTemperature; // °C
  final double? wristTemperature; // °C (sleep wrist temp)
  final double? bloodPressureSystolic; // mmHg
  final double? bloodPressureDiastolic; // mmHg
  final double? insulinDelivery; // IU
  final double? peripheralPerfusion; // %
  final double? waterTemperature; // °C
  final double? uvIndex;

  const VitalSigns({
    this.bloodGlucose,
    this.bodyTemperature,
    this.skinTemperature,
    this.wristTemperature,
    this.bloodPressureSystolic,
    this.bloodPressureDiastolic,
    this.insulinDelivery,
    this.peripheralPerfusion,
    this.waterTemperature,
    this.uvIndex,
  });
}

/// Nutrition data from HealthKit (daily totals)
class NutritionData {
  // Macros
  final double? calories; // kcal
  final double? protein; // g
  final double? carbs; // g
  final double? totalFat; // g
  final double? saturatedFat; // g
  final double? monounsaturatedFat; // g
  final double? polyunsaturatedFat; // g
  final double? sugar; // g
  final double? fiber; // g
  final double? cholesterol; // mg
  final double? caffeine; // mg
  final double? water; // mL
  // Vitamins
  final double? vitaminA;
  final double? vitaminC;
  final double? vitaminD;
  final double? vitaminE;
  final double? vitaminK;
  final double? thiamin;
  final double? riboflavin;
  final double? niacin;
  final double? pantothenicAcid;
  final double? vitaminB6;
  final double? vitaminB12;
  final double? biotin;
  final double? folate;
  // Minerals
  final double? calcium;
  final double? chloride;
  final double? iron;
  final double? magnesium;
  final double? phosphorus;
  final double? potassium;
  final double? sodium;
  final double? zinc;
  final double? chromium;
  final double? copper;
  final double? iodine;
  final double? manganese;
  final double? molybdenum;
  final double? selenium;

  const NutritionData({
    this.calories,
    this.protein,
    this.carbs,
    this.totalFat,
    this.saturatedFat,
    this.monounsaturatedFat,
    this.polyunsaturatedFat,
    this.sugar,
    this.fiber,
    this.cholesterol,
    this.caffeine,
    this.water,
    this.vitaminA,
    this.vitaminC,
    this.vitaminD,
    this.vitaminE,
    this.vitaminK,
    this.thiamin,
    this.riboflavin,
    this.niacin,
    this.pantothenicAcid,
    this.vitaminB6,
    this.vitaminB12,
    this.biotin,
    this.folate,
    this.calcium,
    this.chloride,
    this.iron,
    this.magnesium,
    this.phosphorus,
    this.potassium,
    this.sodium,
    this.zinc,
    this.chromium,
    this.copper,
    this.iodine,
    this.manganese,
    this.molybdenum,
    this.selenium,
  });
}

/// Heart metrics from HealthKit
class HeartMetrics {
  final int? heartRate; // avg bpm
  final int? restingHeartRate; // bpm
  final int? walkingHeartRate; // avg bpm
  final int? hrvSDNN; // ms
  final int? hrvRMSSD; // ms
  final double? bloodPressureSystolic; // mmHg
  final double? bloodPressureDiastolic; // mmHg
  final int highHeartRateEvents;
  final int lowHeartRateEvents;
  final int irregularHeartRateEvents;
  final double? atrialFibrillationBurden; // %

  const HeartMetrics({
    this.heartRate,
    this.restingHeartRate,
    this.walkingHeartRate,
    this.hrvSDNN,
    this.hrvRMSSD,
    this.bloodPressureSystolic,
    this.bloodPressureDiastolic,
    this.highHeartRateEvents = 0,
    this.lowHeartRateEvents = 0,
    this.irregularHeartRateEvents = 0,
    this.atrialFibrillationBurden,
  });
}

/// Respiratory metrics from HealthKit
class RespiratoryMetrics {
  final double? bloodOxygen; // %
  final double? respiratoryRate; // breaths/min
  final double? forcedExpiratoryVolume; // L

  const RespiratoryMetrics({
    this.bloodOxygen,
    this.respiratoryRate,
    this.forcedExpiratoryVolume,
  });
}

/// Activity metrics from HealthKit (daily totals)
class ActivityMetrics {
  final int? steps;
  final int? activeEnergy; // kcal
  final int? basalEnergy; // kcal
  final int? totalCalories; // kcal
  final int? exerciseMinutes;
  final int? flightsClimbed;
  final double? distanceWalkingRunning; // km
  final double? distanceCycling; // km
  final double? distanceSwimming; // km
  final int? appleStandHours; // count
  final int? appleStandMinutes; // minutes
  final int? appleMoveMinutes; // minutes
  final double? walkingSpeed; // m/s
  final double? underwaterDepth; // m

  const ActivityMetrics({
    this.steps,
    this.activeEnergy,
    this.basalEnergy,
    this.totalCalories,
    this.exerciseMinutes,
    this.flightsClimbed,
    this.distanceWalkingRunning,
    this.distanceCycling,
    this.distanceSwimming,
    this.appleStandHours,
    this.appleStandMinutes,
    this.appleMoveMinutes,
    this.walkingSpeed,
    this.underwaterDepth,
  });
}

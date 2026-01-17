import 'package:health/health.dart';
import 'package:talker/talker.dart';

import '../domain/entities/recovery_metrics.dart';

/// Service for interacting with Apple HealthKit
abstract class HealthKitService {
  /// Request permissions for health data
  Future<bool> requestPermissions();

  /// Check if permissions have been granted
  Future<bool> hasPermissions();

  /// Fetch recovery metrics for a specific date
  Future<HealthKitData?> fetchRecoveryData(DateTime date);

  /// Fetch step count for a date range
  Future<int?> fetchSteps(DateTime start, DateTime end);

  /// Fetch sleep data for a specific night
  Future<SleepData?> fetchSleepData(DateTime date);

  /// Fetch heart rate variability
  Future<int?> fetchHRV(DateTime date);

  /// Fetch resting heart rate
  Future<int?> fetchRestingHeartRate(DateTime date);

  /// Fetch active energy burned
  Future<int?> fetchActiveEnergy(DateTime start, DateTime end);

  /// Fetch workouts from HealthKit
  Future<List<HealthKitWorkout>> fetchWorkouts(DateTime start, DateTime end);
}

class HealthKitServiceImpl implements HealthKitService {
  final Talker _talker;
  final Health _health = Health();

  // Types we need to read
  static const List<HealthDataType> _readTypes = [
    HealthDataType.STEPS,
    HealthDataType.SLEEP_ASLEEP,
    HealthDataType.SLEEP_IN_BED,
    HealthDataType.HEART_RATE_VARIABILITY_SDNN,
    HealthDataType.RESTING_HEART_RATE,
    HealthDataType.ACTIVE_ENERGY_BURNED,
    HealthDataType.WORKOUT,
    HealthDataType.WEIGHT,
  ];

  HealthKitServiceImpl({required Talker talker}) : _talker = talker;

  @override
  Future<bool> requestPermissions() async {
    try {
      final permissions = _readTypes.map((type) => HealthDataAccess.READ).toList();
      final granted = await _health.requestAuthorization(_readTypes, permissions: permissions);
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
      final permissions = _readTypes.map((type) => HealthDataAccess.READ).toList();
      return await _health.hasPermissions(_readTypes, permissions: permissions) ?? false;
    } catch (e) {
      _talker.warning('Failed to check HealthKit permissions: $e');
      return false;
    }
  }

  @override
  Future<HealthKitData?> fetchRecoveryData(DateTime date) async {
    try {
      final startOfDay = DateTime(date.year, date.month, date.day);
      final endOfDay = startOfDay.add(const Duration(days: 1));

      // Fetch all metrics in parallel
      final results = await Future.wait([
        fetchSleepData(date),
        fetchHRV(date),
        fetchRestingHeartRate(date),
        fetchSteps(startOfDay, endOfDay),
        fetchActiveEnergy(startOfDay, endOfDay),
        fetchWorkouts(startOfDay, endOfDay),
      ]);

      final sleepData = results[0] as SleepData?;
      final hrv = results[1] as int?;
      final restingHR = results[2] as int?;
      final steps = results[3] as int?;
      final activeEnergy = results[4] as int?;
      final workouts = results[5] as List<HealthKitWorkout>;

      return HealthKitData(
        date: date,
        sleepDuration: sleepData?.totalHours,
        sleepQuality: sleepData?.quality,
        hrv: hrv,
        restingHR: restingHR,
        steps: steps,
        activeEnergy: activeEnergy,
        workoutsCount: workouts.length,
        workouts: workouts,
      );
    } catch (e, st) {
      _talker.error('Failed to fetch recovery data', e, st);
      return null;
    }
  }

  @override
  Future<int?> fetchSteps(DateTime start, DateTime end) async {
    try {
      final data = await _health.getHealthDataFromTypes(
        types: [HealthDataType.STEPS],
        startTime: start,
        endTime: end,
      );

      if (data.isEmpty) return null;

      int totalSteps = 0;
      for (final point in data) {
        if (point.value is NumericHealthValue) {
          totalSteps += (point.value as NumericHealthValue).numericValue.toInt();
        }
      }

      return totalSteps;
    } catch (e) {
      _talker.warning('Failed to fetch steps: $e');
      return null;
    }
  }

  @override
  Future<SleepData?> fetchSleepData(DateTime date) async {
    try {
      // Sleep data is for the previous night
      final sleepEnd = DateTime(date.year, date.month, date.day, 12); // noon
      final sleepStart = sleepEnd.subtract(const Duration(hours: 18)); // 6pm previous day

      final data = await _health.getHealthDataFromTypes(
        types: [HealthDataType.SLEEP_ASLEEP, HealthDataType.SLEEP_IN_BED],
        startTime: sleepStart,
        endTime: sleepEnd,
      );

      if (data.isEmpty) return null;

      double totalAsleepMinutes = 0;
      double totalInBedMinutes = 0;

      for (final point in data) {
        final duration = point.dateTo.difference(point.dateFrom).inMinutes;
        if (point.type == HealthDataType.SLEEP_ASLEEP) {
          totalAsleepMinutes += duration;
        } else if (point.type == HealthDataType.SLEEP_IN_BED) {
          totalInBedMinutes += duration;
        }
      }

      final totalHours = totalAsleepMinutes / 60;
      final efficiency = totalInBedMinutes > 0
          ? (totalAsleepMinutes / totalInBedMinutes * 100).round()
          : null;

      return SleepData(
        totalHours: totalHours,
        asleepMinutes: totalAsleepMinutes.round(),
        inBedMinutes: totalInBedMinutes.round(),
        quality: efficiency,
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

      if (data.isEmpty) return null;

      // Get the most recent HRV reading
      final sortedData = data.toList()
        ..sort((a, b) => b.dateFrom.compareTo(a.dateFrom));

      final latestValue = sortedData.first.value;
      if (latestValue is NumericHealthValue) {
        return latestValue.numericValue.round();
      }

      return null;
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

      if (data.isEmpty) return null;

      final sortedData = data.toList()
        ..sort((a, b) => b.dateFrom.compareTo(a.dateFrom));

      final latestValue = sortedData.first.value;
      if (latestValue is NumericHealthValue) {
        return latestValue.numericValue.round();
      }

      return null;
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

      if (data.isEmpty) return null;

      double totalEnergy = 0;
      for (final point in data) {
        if (point.value is NumericHealthValue) {
          totalEnergy += (point.value as NumericHealthValue).numericValue;
        }
      }

      return totalEnergy.round();
    } catch (e) {
      _talker.warning('Failed to fetch active energy: $e');
      return null;
    }
  }

  @override
  Future<List<HealthKitWorkout>> fetchWorkouts(DateTime start, DateTime end) async {
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
}

/// Data class for HealthKit recovery data
class HealthKitData {
  final DateTime date;
  final double? sleepDuration;
  final int? sleepQuality;
  final int? hrv;
  final int? restingHR;
  final int? steps;
  final int? activeEnergy;
  final int workoutsCount;
  final List<HealthKitWorkout> workouts;

  HealthKitData({
    required this.date,
    this.sleepDuration,
    this.sleepQuality,
    this.hrv,
    this.restingHR,
    this.steps,
    this.activeEnergy,
    this.workoutsCount = 0,
    this.workouts = const [],
  });

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

/// Sleep data from HealthKit
class SleepData {
  final double totalHours;
  final int asleepMinutes;
  final int inBedMinutes;
  final int? quality; // Sleep efficiency percentage

  SleepData({
    required this.totalHours,
    required this.asleepMinutes,
    required this.inBedMinutes,
    this.quality,
  });
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

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/entities/strain_score.dart';
import '../domain/services/strain_calculator.dart';
import 'providers.dart';

/// Provider for the strain calculator service
final strainCalculatorProvider = Provider<StrainCalculator>((ref) {
  return StrainCalculatorImpl();
});

/// Provider for today's strain score
final todayStrainScoreProvider = FutureProvider<StrainScore?>((ref) async {
  final healthKitService = ref.watch(healthKitServiceProvider);
  final calculator = ref.watch(strainCalculatorProvider);
  final database = ref.watch(databaseProvider);

  // Get user profile for age-based max HR calculation
  final userProfile = await database.getUserProfile();
  final age = userProfile?.age ?? 30; // Default to 30 if not set
  final maxHeartRate = calculator.calculateMaxHeartRate(age);

  // Get today's date
  final today = DateTime.now();
  // Fetch health data
  final healthData = await healthKitService.fetchRecoveryData(today);

  if (healthData == null) {
    return null;
  }

  // For now, estimate zone data from workouts and active energy
  // In a full implementation, you'd have actual HR samples
  final estimatedZoneData = _estimateZoneDataFromActivity(
    workoutsCount: healthData.workoutsCount,
    activeEnergy: healthData.activeEnergy ?? 0,
    steps: healthData.steps ?? 0,
  );

  return calculator.calculateFromZoneData(
    date: today,
    maxHeartRate: maxHeartRate,
    zoneData: estimatedZoneData,
    workoutCount: healthData.workoutsCount,
    caloriesBurned: healthData.activeEnergy,
    dataSource: StrainDataSource.healthkit,
  );
});

/// Provider for strain score for a specific date
final strainScoreForDateProvider =
    FutureProvider.family<StrainScore?, DateTime>((ref, date) async {
  final healthKitService = ref.watch(healthKitServiceProvider);
  final calculator = ref.watch(strainCalculatorProvider);
  final database = ref.watch(databaseProvider);

  final userProfile = await database.getUserProfile();
  final age = userProfile?.age ?? 30;
  final maxHeartRate = calculator.calculateMaxHeartRate(age);

  final healthData = await healthKitService.fetchRecoveryData(date);

  if (healthData == null) {
    return null;
  }

  final estimatedZoneData = _estimateZoneDataFromActivity(
    workoutsCount: healthData.workoutsCount,
    activeEnergy: healthData.activeEnergy ?? 0,
    steps: healthData.steps ?? 0,
  );

  return calculator.calculateFromZoneData(
    date: date,
    maxHeartRate: maxHeartRate,
    zoneData: estimatedZoneData,
    workoutCount: healthData.workoutsCount,
    caloriesBurned: healthData.activeEnergy,
    dataSource: StrainDataSource.healthkit,
  );
});

/// Provider for weekly strain history
final weeklyStrainHistoryProvider =
    FutureProvider<List<StrainScore>>((ref) async {
  final today = DateTime.now();
  final scores = <StrainScore>[];

  for (int i = 6; i >= 0; i--) {
    final date = today.subtract(Duration(days: i));
    final score = await ref.watch(strainScoreForDateProvider(date).future);
    if (score != null) {
      scores.add(score);
    }
  }

  return scores;
});

/// Provider for strain recommendation based on current recovery
final strainRecommendationProvider = Provider<StrainRecommendation>((ref) {
  // Default to moderate recommendation
  // This will be enhanced when recovery provider is implemented
  return StrainRecommendation.forRecoveryScore(70);
});

/// Provider for max heart rate based on user's age
final maxHeartRateProvider = FutureProvider<int>((ref) async {
  final calculator = ref.watch(strainCalculatorProvider);
  final database = ref.watch(databaseProvider);

  final userProfile = await database.getUserProfile();
  final age = userProfile?.age ?? 30;

  return calculator.calculateMaxHeartRate(age);
});

/// Provider for heart rate zone boundaries
final heartRateZoneBoundariesProvider =
    FutureProvider<HeartRateZoneBoundaries>((ref) async {
  final maxHeartRate = await ref.watch(maxHeartRateProvider.future);
  final calculator = ref.watch(strainCalculatorProvider);

  return calculator.getZoneBoundaries(maxHeartRate);
});

/// State class for manual strain input
class ManualStrainState {
  final HRZoneData zoneData;
  final bool isSubmitting;
  final String? error;

  const ManualStrainState({
    this.zoneData = const HRZoneData(),
    this.isSubmitting = false,
    this.error,
  });

  ManualStrainState copyWith({
    HRZoneData? zoneData,
    bool? isSubmitting,
    String? error,
  }) {
    return ManualStrainState(
      zoneData: zoneData ?? this.zoneData,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      error: error,
    );
  }
}

/// Notifier for manual strain input
class ManualStrainNotifier extends StateNotifier<ManualStrainState> {
  final StrainCalculator _calculator;

  ManualStrainNotifier(this._calculator)
      : super(const ManualStrainState());

  void updateZone1(int minutes) {
    state = state.copyWith(
      zoneData: HRZoneData(
        zone1Minutes: minutes,
        zone2Minutes: state.zoneData.zone2Minutes,
        zone3Minutes: state.zoneData.zone3Minutes,
        zone4Minutes: state.zoneData.zone4Minutes,
        zone5Minutes: state.zoneData.zone5Minutes,
      ),
    );
  }

  void updateZone2(int minutes) {
    state = state.copyWith(
      zoneData: HRZoneData(
        zone1Minutes: state.zoneData.zone1Minutes,
        zone2Minutes: minutes,
        zone3Minutes: state.zoneData.zone3Minutes,
        zone4Minutes: state.zoneData.zone4Minutes,
        zone5Minutes: state.zoneData.zone5Minutes,
      ),
    );
  }

  void updateZone3(int minutes) {
    state = state.copyWith(
      zoneData: HRZoneData(
        zone1Minutes: state.zoneData.zone1Minutes,
        zone2Minutes: state.zoneData.zone2Minutes,
        zone3Minutes: minutes,
        zone4Minutes: state.zoneData.zone4Minutes,
        zone5Minutes: state.zoneData.zone5Minutes,
      ),
    );
  }

  void updateZone4(int minutes) {
    state = state.copyWith(
      zoneData: HRZoneData(
        zone1Minutes: state.zoneData.zone1Minutes,
        zone2Minutes: state.zoneData.zone2Minutes,
        zone3Minutes: state.zoneData.zone3Minutes,
        zone4Minutes: minutes,
        zone5Minutes: state.zoneData.zone5Minutes,
      ),
    );
  }

  void updateZone5(int minutes) {
    state = state.copyWith(
      zoneData: HRZoneData(
        zone1Minutes: state.zoneData.zone1Minutes,
        zone2Minutes: state.zoneData.zone2Minutes,
        zone3Minutes: state.zoneData.zone3Minutes,
        zone4Minutes: state.zoneData.zone4Minutes,
        zone5Minutes: minutes,
      ),
    );
  }

  StrainScore calculateCurrentStrain(int maxHeartRate) {
    return _calculator.calculateFromZoneData(
      date: DateTime.now(),
      maxHeartRate: maxHeartRate,
      zoneData: state.zoneData,
      dataSource: StrainDataSource.manual,
    );
  }

  void reset() {
    state = const ManualStrainState();
  }
}

/// Provider for manual strain input
final manualStrainProvider =
    StateNotifierProvider<ManualStrainNotifier, ManualStrainState>((ref) {
  final calculator = ref.watch(strainCalculatorProvider);
  return ManualStrainNotifier(calculator);
});

/// Helper function to estimate zone data from activity metrics
/// This is an approximation when actual HR data is not available
HRZoneData _estimateZoneDataFromActivity({
  required int workoutsCount,
  required int activeEnergy,
  required int steps,
}) {
  // Estimate based on activity level
  // These are rough approximations for demonstration

  // Steps contribute mainly to Zone 1-2
  final stepsMinutes = (steps / 100).round(); // ~100 steps per minute of walking
  final zone1FromSteps = (stepsMinutes * 0.4).round();
  final zone2FromSteps = (stepsMinutes * 0.3).round();

  // Workouts contribute to higher zones
  final workoutMinutes = workoutsCount * 30; // Assume 30 min avg per workout
  final zone3FromWorkouts = (workoutMinutes * 0.3).round();
  final zone4FromWorkouts = (workoutMinutes * 0.2).round();
  final zone5FromWorkouts = (workoutMinutes * 0.1).round();

  // Active energy adds to overall activity
  final energyBonus = (activeEnergy / 50).round(); // Additional minutes based on energy

  return HRZoneData(
    zone1Minutes: zone1FromSteps + (energyBonus * 0.2).round(),
    zone2Minutes: zone2FromSteps + (energyBonus * 0.3).round(),
    zone3Minutes: zone3FromWorkouts + (energyBonus * 0.2).round(),
    zone4Minutes: zone4FromWorkouts + (energyBonus * 0.2).round(),
    zone5Minutes: zone5FromWorkouts + (energyBonus * 0.1).round(),
  );
}

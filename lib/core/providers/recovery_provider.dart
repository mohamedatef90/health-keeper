import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/entities/recovery_score.dart';
import '../domain/services/recovery_calculator.dart';
import 'providers.dart';

/// Provider for the recovery calculator service
final recoveryCalculatorProvider = Provider<RecoveryCalculator>((ref) {
  return RecoveryCalculatorImpl();
});

/// Provider for today's recovery score
final todayRecoveryScoreProvider = FutureProvider<RecoveryScore?>((ref) async {
  final healthKitService = ref.watch(healthKitServiceProvider);
  final calculator = ref.watch(recoveryCalculatorProvider);
  final database = ref.watch(databaseProvider);

  final today = DateTime.now();

  // Fetch today's health data
  final healthData = await healthKitService.fetchRecoveryData(today);

  if (healthData == null) {
    return null;
  }

  // Fetch historical data for baseline (last 7 days)
  final historicalMetrics = <DailyMetrics>[];
  for (int i = 1; i <= 7; i++) {
    final date = today.subtract(Duration(days: i));
    final data = await healthKitService.fetchRecoveryData(date);
    if (data != null) {
      historicalMetrics.add(DailyMetrics(
        date: date,
        hrv: data.hrv,
        restingHeartRate: data.restingHR,
        sleepDuration: data.sleepDuration,
        sleepQuality: data.sleepQuality,
      ));
    }
  }

  // Get yesterday's strain for sleep need calculation
  final yesterday = today.subtract(const Duration(days: 1));
  final yesterdayStrain = await ref.watch(strainScoreForDateProvider(yesterday).future);

  // Create today's metrics
  final todayMetrics = DailyMetrics(
    date: today,
    hrv: healthData.hrv,
    restingHeartRate: healthData.restingHR,
    sleepDuration: healthData.sleepDuration,
    sleepQuality: healthData.sleepQuality,
  );

  return calculator.calculate(
    date: today,
    todayMetrics: todayMetrics,
    historicalMetrics: historicalMetrics,
    previousDayStrain: yesterdayStrain?.score,
  );
});

/// Provider for recovery score for a specific date
final recoveryScoreForDateProvider =
    FutureProvider.family<RecoveryScore?, DateTime>((ref, date) async {
  final healthKitService = ref.watch(healthKitServiceProvider);
  final calculator = ref.watch(recoveryCalculatorProvider);

  final healthData = await healthKitService.fetchRecoveryData(date);

  if (healthData == null) {
    return null;
  }

  // Fetch historical data for baseline
  final historicalMetrics = <DailyMetrics>[];
  for (int i = 1; i <= 7; i++) {
    final histDate = date.subtract(Duration(days: i));
    final data = await healthKitService.fetchRecoveryData(histDate);
    if (data != null) {
      historicalMetrics.add(DailyMetrics(
        date: histDate,
        hrv: data.hrv,
        restingHeartRate: data.restingHR,
        sleepDuration: data.sleepDuration,
        sleepQuality: data.sleepQuality,
      ));
    }
  }

  // Get previous day's strain
  final previousDay = date.subtract(const Duration(days: 1));
  final previousStrain =
      await ref.watch(strainScoreForDateProvider(previousDay).future);

  final todayMetrics = DailyMetrics(
    date: date,
    hrv: healthData.hrv,
    restingHeartRate: healthData.restingHR,
    sleepDuration: healthData.sleepDuration,
    sleepQuality: healthData.sleepQuality,
  );

  return calculator.calculate(
    date: date,
    todayMetrics: todayMetrics,
    historicalMetrics: historicalMetrics,
    previousDayStrain: previousStrain?.score,
  );
});

/// Provider for weekly recovery history
final weeklyRecoveryHistoryProvider =
    FutureProvider<List<RecoveryScore>>((ref) async {
  final today = DateTime.now();
  final scores = <RecoveryScore>[];

  for (int i = 6; i >= 0; i--) {
    final date = today.subtract(Duration(days: i));
    final score = await ref.watch(recoveryScoreForDateProvider(date).future);
    if (score != null) {
      scores.add(score);
    }
  }

  return scores;
});

/// Provider for current baseline metrics
final baselineMetricsProvider = FutureProvider<BaselineMetrics>((ref) async {
  final healthKitService = ref.watch(healthKitServiceProvider);
  final calculator = ref.watch(recoveryCalculatorProvider);

  final today = DateTime.now();
  final historicalMetrics = <DailyMetrics>[];

  for (int i = 1; i <= 7; i++) {
    final date = today.subtract(Duration(days: i));
    final data = await healthKitService.fetchRecoveryData(date);
    if (data != null) {
      historicalMetrics.add(DailyMetrics(
        date: date,
        hrv: data.hrv,
        restingHeartRate: data.restingHR,
        sleepDuration: data.sleepDuration,
        sleepQuality: data.sleepQuality,
      ));
    }
  }

  return calculator.calculateBaseline(historicalMetrics);
});

/// Provider for sleep need calculation
final sleepNeedProvider = FutureProvider<double>((ref) async {
  final calculator = ref.watch(recoveryCalculatorProvider);
  final database = ref.watch(databaseProvider);

  // Get user age
  final userProfile = await database.getUserProfile();
  final age = userProfile?.age ?? 30;

  // Get previous day strain
  final yesterday = DateTime.now().subtract(const Duration(days: 1));
  final yesterdayStrain =
      await ref.watch(strainScoreForDateProvider(yesterday).future);

  // Get previous recovery score
  final previousRecovery =
      await ref.watch(recoveryScoreForDateProvider(yesterday).future);

  return calculator.calculateSleepNeed(
    previousDayStrain: yesterdayStrain?.score ?? 10.0,
    age: age,
    previousRecoveryScore: previousRecovery?.score,
  );
});

/// Provider for recovery insights
final recoveryInsightsProvider = FutureProvider<RecoveryInsights?>((ref) async {
  final recovery = await ref.watch(todayRecoveryScoreProvider.future);
  if (recovery == null) return null;

  final yesterday = DateTime.now().subtract(const Duration(days: 1));
  final yesterdayStrain =
      await ref.watch(strainScoreForDateProvider(yesterday).future);

  return RecoveryInsights(
    recovery,
    previousDayStrain: yesterdayStrain?.score,
  );
});

/// Provider for recommended max strain based on recovery
final recommendedMaxStrainProvider = FutureProvider<double>((ref) async {
  final insights = await ref.watch(recoveryInsightsProvider.future);
  return insights?.recommendedMaxStrain ?? 14.0;
});

/// Provider for recovery state
final recoveryStateProvider = FutureProvider<RecoveryState>((ref) async {
  final recovery = await ref.watch(todayRecoveryScoreProvider.future);
  return recovery?.state ?? RecoveryState.moderate;
});

/// State class for manual recovery input
class ManualRecoveryState {
  final int? hrv;
  final int? restingHeartRate;
  final double? sleepHours;
  final int? sleepQuality;
  final bool isSubmitting;
  final String? error;

  const ManualRecoveryState({
    this.hrv,
    this.restingHeartRate,
    this.sleepHours,
    this.sleepQuality,
    this.isSubmitting = false,
    this.error,
  });

  ManualRecoveryState copyWith({
    int? hrv,
    int? restingHeartRate,
    double? sleepHours,
    int? sleepQuality,
    bool? isSubmitting,
    String? error,
  }) {
    return ManualRecoveryState(
      hrv: hrv ?? this.hrv,
      restingHeartRate: restingHeartRate ?? this.restingHeartRate,
      sleepHours: sleepHours ?? this.sleepHours,
      sleepQuality: sleepQuality ?? this.sleepQuality,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      error: error,
    );
  }

  bool get isValid =>
      hrv != null || restingHeartRate != null || sleepHours != null;
}

/// Notifier for manual recovery input
class ManualRecoveryNotifier extends StateNotifier<ManualRecoveryState> {
  final RecoveryCalculator _calculator;

  ManualRecoveryNotifier(this._calculator)
      : super(const ManualRecoveryState());

  void updateHrv(int? value) {
    state = state.copyWith(hrv: value);
  }

  void updateRestingHeartRate(int? value) {
    state = state.copyWith(restingHeartRate: value);
  }

  void updateSleepHours(double? value) {
    state = state.copyWith(sleepHours: value);
  }

  void updateSleepQuality(int? value) {
    state = state.copyWith(sleepQuality: value);
  }

  RecoveryScore calculateRecovery(
    List<DailyMetrics> historicalMetrics, {
    double? previousDayStrain,
  }) {
    final todayMetrics = DailyMetrics(
      date: DateTime.now(),
      hrv: state.hrv,
      restingHeartRate: state.restingHeartRate,
      sleepDuration: state.sleepHours,
      sleepQuality: state.sleepQuality,
    );

    return _calculator.calculate(
      date: DateTime.now(),
      todayMetrics: todayMetrics,
      historicalMetrics: historicalMetrics,
      previousDayStrain: previousDayStrain,
    );
  }

  void reset() {
    state = const ManualRecoveryState();
  }
}

/// Provider for manual recovery input
final manualRecoveryProvider =
    StateNotifierProvider<ManualRecoveryNotifier, ManualRecoveryState>((ref) {
  final calculator = ref.watch(recoveryCalculatorProvider);
  return ManualRecoveryNotifier(calculator);
});

/// Combined dashboard state for home screen
class DashboardState {
  final RecoveryScore? recovery;
  final double? strainScore;
  final double sleepNeed;
  final double recommendedMaxStrain;
  final List<String> recommendations;
  final bool isLoading;
  final String? error;

  const DashboardState({
    this.recovery,
    this.strainScore,
    this.sleepNeed = 7.5,
    this.recommendedMaxStrain = 14.0,
    this.recommendations = const [],
    this.isLoading = false,
    this.error,
  });
}

/// Provider for combined dashboard data
final dashboardStateProvider = FutureProvider<DashboardState>((ref) async {
  try {
    final recovery = await ref.watch(todayRecoveryScoreProvider.future);
    final strain = await ref.watch(todayStrainScoreProvider.future);
    final sleepNeed = await ref.watch(sleepNeedProvider.future);
    final insights = await ref.watch(recoveryInsightsProvider.future);

    return DashboardState(
      recovery: recovery,
      strainScore: strain?.score,
      sleepNeed: sleepNeed,
      recommendedMaxStrain: insights?.recommendedMaxStrain ?? 14.0,
      recommendations: insights?.recommendations ?? [],
    );
  } catch (e) {
    return DashboardState(
      error: e.toString(),
    );
  }
});

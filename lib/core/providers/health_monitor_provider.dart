import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/entities/health_prediction.dart';
import '../services/health_prediction_service.dart';
import 'providers.dart';

/// Provider for HealthKit permission status
///
/// Returns true if HealthKit permissions have been granted.
/// Use this to show a "Connect Health" banner when permissions are missing.
final healthKitPermissionStatusProvider = FutureProvider<bool>((ref) async {
  final healthKitService = ref.watch(healthKitServiceProvider);
  return healthKitService.hasPermissions();
});

/// Provider for the current health prediction
///
/// Automatically refreshes every 4 hours or when manually triggered.
/// Caches results to minimize API calls.
final healthPredictionProvider = FutureProvider<HealthPrediction>((ref) async {
  final predictionService = ref.watch(healthPredictionServiceProvider);
  final healthKitService = ref.watch(healthKitServiceProvider);

  final today = DateTime.now();

  // Build health context from available data
  final context = await _buildHealthContext(ref, today, healthKitService);

  // Get prediction (will use cache if valid)
  return predictionService.predictHealth(context);
});

/// Provider for active health alerts
///
/// Returns alerts sorted by severity (highest first).
/// Limited to top 5 most important alerts.
final healthAlertsProvider = FutureProvider<List<HealthAlert>>((ref) async {
  final predictionService = ref.watch(healthPredictionServiceProvider);
  final healthKitService = ref.watch(healthKitServiceProvider);

  final today = DateTime.now();
  final history = <DailyMetrics>[];

  // Fetch last 14 days of data
  for (int i = 0; i < 14; i++) {
    final date = today.subtract(Duration(days: i));
    final data = await healthKitService.fetchRecoveryData(date);
    if (data != null) {
      history.add(DailyMetrics(
        date: date,
        hrv: data.hrv,
        rhr: data.restingHR,
        sleepHours: data.sleepDuration,
        sleepQuality: data.sleepQuality,
        strainScore: null, // Would come from strain provider
        recoveryScore: null, // Would come from recovery provider
      ));
    }
  }

  final alerts = await predictionService.analyzePatterns(history);
  return alerts.take(5).toList();
});

/// Provider for proactive nudges
///
/// Returns 1-3 contextual nudges based on current state.
/// Refreshes based on time of day.
final proactiveNudgesProvider = FutureProvider<List<ProactiveNudge>>((ref) async {
  final predictionService = ref.watch(healthPredictionServiceProvider);
  final healthKitService = ref.watch(healthKitServiceProvider);

  final today = DateTime.now();
  final context = await _buildHealthContext(ref, today, healthKitService);

  return predictionService.getProactiveNudges(context);
});

/// Provider for pattern insights
///
/// Analyzes 30 days of data to find correlations.
/// Updates weekly or on-demand.
final patternInsightsProvider = FutureProvider<TrendAnalysis>((ref) async {
  final predictionService = ref.watch(healthPredictionServiceProvider);
  final healthKitService = ref.watch(healthKitServiceProvider);

  final today = DateTime.now();
  final metrics = <DailyMetrics>[];

  // Fetch last 30 days of data
  for (int i = 0; i < 30; i++) {
    final date = today.subtract(Duration(days: i));
    final data = await healthKitService.fetchRecoveryData(date);
    if (data != null) {
      metrics.add(DailyMetrics(
        date: date,
        hrv: data.hrv,
        rhr: data.restingHR,
        sleepHours: data.sleepDuration,
        sleepQuality: data.sleepQuality,
      ));
    }
  }

  return predictionService.analyzeTrends(metrics);
});

/// Provider for illness risk specifically
final illnessRiskProvider = FutureProvider<IllnessRisk>((ref) async {
  final prediction = await ref.watch(healthPredictionProvider.future);
  return prediction.illnessRisk;
});

/// Provider for overtraining risk specifically
final overtrainingRiskProvider = FutureProvider<OvertrainingRisk>((ref) async {
  final prediction = await ref.watch(healthPredictionProvider.future);
  return prediction.overtrainingRisk;
});

/// Provider for sleep debt assessment specifically
final sleepDebtProvider = FutureProvider<SleepDebtAssessment>((ref) async {
  final prediction = await ref.watch(healthPredictionProvider.future);
  return prediction.sleepDebt;
});

/// Provider for overall health score
final healthScoreProvider = FutureProvider<int>((ref) async {
  final prediction = await ref.watch(healthPredictionProvider.future);
  return prediction.overallScore;
});

/// Provider for checking if there are any urgent alerts
final hasUrgentAlertsProvider = FutureProvider<bool>((ref) async {
  final alerts = await ref.watch(healthAlertsProvider.future);
  return alerts.any((alert) =>
      alert.severity == AlertSeverity.high ||
      alert.severity == AlertSeverity.critical);
});

/// Provider for alert badge count
final alertBadgeCountProvider = FutureProvider<int>((ref) async {
  final alerts = await ref.watch(healthAlertsProvider.future);
  return alerts.where((alert) =>
      alert.severity == AlertSeverity.high ||
      alert.severity == AlertSeverity.critical).length;
});

/// State notifier for health monitor UI state
class HealthMonitorState {
  final bool isRefreshing;
  final DateTime? lastRefreshed;
  final String? error;
  final bool showRescueDayPrompt;

  const HealthMonitorState({
    this.isRefreshing = false,
    this.lastRefreshed,
    this.error,
    this.showRescueDayPrompt = false,
  });

  HealthMonitorState copyWith({
    bool? isRefreshing,
    DateTime? lastRefreshed,
    String? error,
    bool? showRescueDayPrompt,
  }) {
    return HealthMonitorState(
      isRefreshing: isRefreshing ?? this.isRefreshing,
      lastRefreshed: lastRefreshed ?? this.lastRefreshed,
      error: error,
      showRescueDayPrompt: showRescueDayPrompt ?? this.showRescueDayPrompt,
    );
  }
}

/// Notifier for health monitor actions
class HealthMonitorNotifier extends StateNotifier<HealthMonitorState> {
  final Ref _ref;

  HealthMonitorNotifier(this._ref) : super(const HealthMonitorState());

  /// Refresh all health predictions
  Future<void> refresh() async {
    if (state.isRefreshing) return;

    state = state.copyWith(isRefreshing: true, error: null);

    try {
      // Clear cache first
      final predictionService = _ref.read(healthPredictionServiceProvider);
      await predictionService.clearCache();

      // Invalidate all providers
      _ref.invalidate(healthPredictionProvider);
      _ref.invalidate(healthAlertsProvider);
      _ref.invalidate(proactiveNudgesProvider);
      _ref.invalidate(patternInsightsProvider);

      state = state.copyWith(
        isRefreshing: false,
        lastRefreshed: DateTime.now(),
      );
    } catch (e) {
      state = state.copyWith(
        isRefreshing: false,
        error: 'Failed to refresh health data: $e',
      );
    }
  }

  /// Trigger rescue day mode
  void triggerRescueDay() {
    state = state.copyWith(showRescueDayPrompt: true);
  }

  /// Dismiss rescue day prompt
  void dismissRescueDayPrompt() {
    state = state.copyWith(showRescueDayPrompt: false);
  }

  /// Clear error
  void clearError() {
    state = state.copyWith(error: null);
  }
}

/// Provider for health monitor state
final healthMonitorStateProvider =
    StateNotifierProvider<HealthMonitorNotifier, HealthMonitorState>((ref) {
  return HealthMonitorNotifier(ref);
});

/// Combined health dashboard state
class HealthDashboardData {
  final HealthPrediction? prediction;
  final List<HealthAlert> alerts;
  final List<ProactiveNudge> nudges;
  final TrendAnalysis? trends;
  final bool isLoading;
  final String? error;

  const HealthDashboardData({
    this.prediction,
    this.alerts = const [],
    this.nudges = const [],
    this.trends,
    this.isLoading = false,
    this.error,
  });

  bool get hasAlerts => alerts.isNotEmpty;
  bool get hasUrgentAlerts => alerts.any((a) =>
      a.severity == AlertSeverity.high || a.severity == AlertSeverity.critical);
  int get urgentAlertCount => alerts.where((a) =>
      a.severity == AlertSeverity.high || a.severity == AlertSeverity.critical).length;
}

/// Provider for combined health dashboard data
final healthDashboardProvider = FutureProvider<HealthDashboardData>((ref) async {
  try {
    // Fetch all data in parallel with proper error handling
    HealthPrediction? prediction;
    List<HealthAlert> alerts = [];
    List<ProactiveNudge> nudges = [];
    TrendAnalysis? trends;

    try {
      prediction = await ref.watch(healthPredictionProvider.future);
    } catch (_) {
      prediction = null;
    }

    try {
      alerts = await ref.watch(healthAlertsProvider.future);
    } catch (_) {
      alerts = [];
    }

    try {
      nudges = await ref.watch(proactiveNudgesProvider.future);
    } catch (_) {
      nudges = [];
    }

    try {
      trends = await ref.watch(patternInsightsProvider.future);
    } catch (_) {
      trends = null;
    }

    return HealthDashboardData(
      prediction: prediction,
      alerts: alerts,
      nudges: nudges,
      trends: trends,
    );
  } catch (e) {
    return HealthDashboardData(error: e.toString());
  }
});

/// Helper function to build health context from available data
Future<HealthContext> _buildHealthContext(
  Ref ref,
  DateTime date,
  dynamic healthKitService,
) async {
  // Fetch today's data
  final todayData = await healthKitService.fetchRecoveryData(date);

  // Fetch historical data
  final hrvLast7Days = <int>[];
  final rhrLast7Days = <int>[];
  final sleepLast7Days = <double>[];
  final sleepQualityLast7Days = <int>[];
  final respiratoryRateLast7Days = <double>[];
  final spo2Last7Days = <double>[];
  final strainLast7Days = <double>[];
  final recoveryLast7Days = <int>[];

  for (int i = 0; i < 7; i++) {
    final histDate = date.subtract(Duration(days: i));
    final data = await healthKitService.fetchRecoveryData(histDate);
    if (data != null) {
      if (data.hrv != null) hrvLast7Days.add(data.hrv!);
      if (data.restingHR != null) rhrLast7Days.add(data.restingHR!);
      if (data.sleepDuration != null) sleepLast7Days.add(data.sleepDuration!);
      if (data.sleepQuality != null) sleepQualityLast7Days.add(data.sleepQuality!);
    }

    // Get strain and recovery scores
    try {
      final strain = await ref.read(strainScoreForDateProvider(histDate).future);
      if (strain != null) strainLast7Days.add(strain.score);
    } catch (_) {}

    try {
      final recovery = await ref.read(recoveryScoreForDateProvider(histDate).future);
      if (recovery != null) recoveryLast7Days.add(recovery.score);
    } catch (_) {}
  }

  // Calculate baselines (average of days 4-7)
  int? baselineHrv;
  int? baselineRhr;
  if (hrvLast7Days.length >= 4) {
    final baselineValues = hrvLast7Days.skip(3).toList();
    if (baselineValues.isNotEmpty) {
      baselineHrv = (baselineValues.reduce((a, b) => a + b) / baselineValues.length).round();
    }
  }
  if (rhrLast7Days.length >= 4) {
    final baselineValues = rhrLast7Days.skip(3).toList();
    if (baselineValues.isNotEmpty) {
      baselineRhr = (baselineValues.reduce((a, b) => a + b) / baselineValues.length).round();
    }
  }

  return HealthContext(
    userId: 'current_user', // Would come from auth
    date: date,
    currentHrv: todayData?.hrv,
    baselineHrv: baselineHrv,
    hrvLast7Days: hrvLast7Days,
    currentRhr: todayData?.restingHR,
    baselineRhr: baselineRhr,
    rhrLast7Days: rhrLast7Days,
    lastNightSleep: todayData?.sleepDuration,
    sleepQuality: todayData?.sleepQuality,
    sleepLast7Days: sleepLast7Days,
    sleepQualityLast7Days: sleepQualityLast7Days,
    respiratoryRateLast7Days: respiratoryRateLast7Days,
    spo2Last7Days: spo2Last7Days,
    strainLast7Days: strainLast7Days,
    recoveryLast7Days: recoveryLast7Days,
    strainScore: strainLast7Days.isNotEmpty ? strainLast7Days.first : null,
    recoveryScore: recoveryLast7Days.isNotEmpty ? recoveryLast7Days.first : null,
    currentSymptoms: [], // Would come from journal
    recentBehaviors: [], // Would come from journal
    moodEnergy: null, // Would come from daily log
    stressLevel: null, // Would come from daily log
  );
}

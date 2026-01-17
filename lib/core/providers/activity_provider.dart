import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/workouts/domain/entities/activity_recommendation.dart';
import '../services/activity_recommendation_service.dart';
import 'providers.dart';

/// Provider for today's activity recommendation
///
/// Automatically generates a recommendation based on current recovery score.
final todayActivityRecommendationProvider =
    FutureProvider.autoDispose<ActivityRecommendation>((ref) async {
  final service = ref.watch(activityRecommendationServiceProvider);
  final recoveryScore = await ref.watch(todayRecoveryScoreProvider.future);

  // Get yesterday's strain
  final yesterday = DateTime.now().subtract(const Duration(days: 1));
  final yesterdayStrain = await ref.watch(strainScoreForDateProvider(yesterday).future);

  return service.getRecommendation(
    ActivityRecommendationContext(
      recoveryScore: recoveryScore?.score.toDouble() ?? 50,
      strainScore: yesterdayStrain?.score ?? 10,
      recentWorkouts: [],
      constraints: [],
      isRamadan: _isRamadan(),
    ),
  );
});

/// Provider for AI-enhanced activity recommendation
final aiActivityRecommendationProvider =
    FutureProvider.autoDispose<ActivityRecommendation>((ref) async {
  final service = ref.watch(activityRecommendationServiceProvider);
  final recoveryScore = await ref.watch(todayRecoveryScoreProvider.future);

  final yesterday = DateTime.now().subtract(const Duration(days: 1));
  final yesterdayStrain = await ref.watch(strainScoreForDateProvider(yesterday).future);

  return service.getAiEnhancedRecommendation(
    ActivityRecommendationContext(
      recoveryScore: recoveryScore?.score.toDouble() ?? 50,
      strainScore: yesterdayStrain?.score ?? 10,
      recentWorkouts: [],
      constraints: [],
      isRamadan: _isRamadan(),
    ),
  );
});

/// Provider for workout approval check
final workoutApprovalProvider = FutureProvider.autoDispose.family<
    WorkoutApprovalResult,
    ({
      String workoutType,
      int plannedDuration,
      int plannedIntensity,
    })>(
  (ref, params) async {
    final service = ref.watch(activityRecommendationServiceProvider);
    final recoveryScore = await ref.watch(todayRecoveryScoreProvider.future);

    return service.approveWorkout(
      recoveryScore: recoveryScore?.score.toDouble() ?? 50,
      workoutType: params.workoutType,
      plannedDuration: params.plannedDuration,
      plannedIntensity: params.plannedIntensity,
    );
  },
);

/// Provider for recovery protocols
final recoveryProtocolsProvider =
    FutureProvider.autoDispose<List<RecoveryProtocol>>((ref) async {
  final service = ref.watch(activityRecommendationServiceProvider);
  final recoveryScore = await ref.watch(todayRecoveryScoreProvider.future);

  return service.getRecoveryProtocols(
    ActivityRecommendationContext(
      recoveryScore: recoveryScore?.score.toDouble() ?? 50,
      strainScore: 10,
      recentWorkouts: [],
      constraints: [],
      isRamadan: _isRamadan(),
    ),
  );
});

/// State for activity recommendation UI
class ActivityRecommendationState {
  final ActivityRecommendation? recommendation;
  final bool isLoading;
  final String? error;
  final bool isAiEnhanced;

  const ActivityRecommendationState({
    this.recommendation,
    this.isLoading = false,
    this.error,
    this.isAiEnhanced = false,
  });

  ActivityRecommendationState copyWith({
    ActivityRecommendation? recommendation,
    bool? isLoading,
    String? error,
    bool? isAiEnhanced,
  }) {
    return ActivityRecommendationState(
      recommendation: recommendation ?? this.recommendation,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isAiEnhanced: isAiEnhanced ?? this.isAiEnhanced,
    );
  }
}

/// Notifier for activity recommendation
class ActivityRecommendationNotifier
    extends StateNotifier<ActivityRecommendationState> {
  final ActivityRecommendationService _service;

  ActivityRecommendationNotifier(this._service)
      : super(const ActivityRecommendationState());

  /// Load recommendation for given context
  Future<void> loadRecommendation(ActivityRecommendationContext context) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final recommendation = await _service.getRecommendation(context);
      state = state.copyWith(
        recommendation: recommendation,
        isLoading: false,
        isAiEnhanced: false,
      );
    } catch (e) {
      state = state.copyWith(
        error: 'Failed to load recommendation: $e',
        isLoading: false,
      );
    }
  }

  /// Load AI-enhanced recommendation
  Future<void> loadAiRecommendation(
      ActivityRecommendationContext context) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final recommendation = await _service.getAiEnhancedRecommendation(context);
      state = state.copyWith(
        recommendation: recommendation,
        isLoading: false,
        isAiEnhanced: true,
      );
    } catch (e) {
      state = state.copyWith(
        error: 'Failed to load AI recommendation: $e',
        isLoading: false,
      );
    }
  }

  /// Clear recommendation
  void clear() {
    state = const ActivityRecommendationState();
  }
}

/// Provider for activity recommendation notifier
final activityRecommendationNotifierProvider = StateNotifierProvider<
    ActivityRecommendationNotifier, ActivityRecommendationState>((ref) {
  final service = ref.watch(activityRecommendationServiceProvider);
  return ActivityRecommendationNotifier(service);
});

/// Helper function to check if it's currently Ramadan
bool _isRamadan() {
  // Approximate Ramadan dates for 2024-2026
  // In production, use a proper Hijri calendar library
  final now = DateTime.now();

  // 2024: March 10 - April 9
  // 2025: Feb 28 - March 29
  // 2026: Feb 17 - March 18

  if (now.year == 2024) {
    final ramadanStart = DateTime(2024, 3, 10);
    final ramadanEnd = DateTime(2024, 4, 9);
    return now.isAfter(ramadanStart) && now.isBefore(ramadanEnd);
  } else if (now.year == 2025) {
    final ramadanStart = DateTime(2025, 2, 28);
    final ramadanEnd = DateTime(2025, 3, 29);
    return now.isAfter(ramadanStart) && now.isBefore(ramadanEnd);
  } else if (now.year == 2026) {
    final ramadanStart = DateTime(2026, 2, 17);
    final ramadanEnd = DateTime(2026, 3, 18);
    return now.isAfter(ramadanStart) && now.isBefore(ramadanEnd);
  }

  return false;
}

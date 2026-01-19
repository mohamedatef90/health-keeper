import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/entities/ai_brain_context.dart';
import '../domain/entities/ai_brain_decision.dart';
import '../domain/entities/user_autonomy_settings.dart';
import '../services/ai_brain_service.dart';
import 'providers.dart';

// ============================================================================
// AI BRAIN SERVICE PROVIDER
// ============================================================================

/// Provider for the AI Brain service implementation
final aiBrainServiceProvider = Provider<AiBrainService>((ref) {
  final database = ref.watch(databaseProvider);
  final geminiService = ref.watch(geminiCoachServiceProvider);
  final healthKitService = ref.watch(healthKitServiceProvider);
  final notificationService = ref.watch(notificationServiceProvider);
  final talker = ref.watch(talkerProvider);

  return AiBrainServiceImpl(
    database: database,
    geminiService: geminiService,
    healthKitService: healthKitService,
    notificationService: notificationService,
    talker: talker,
    ref: ref,
  );
});

// ============================================================================
// CONTEXT PROVIDERS
// ============================================================================

/// Provider for the current AI Brain context
/// Auto-refreshes when invalidated
final aiBrainContextProvider = FutureProvider<AiBrainContext>((ref) async {
  final brainService = ref.watch(aiBrainServiceProvider);
  return brainService.getContext();
});

/// Provider for the lightweight context summary
final aiBrainContextSummaryProvider =
    FutureProvider<AiBrainContextSummary>((ref) async {
  final brainService = ref.watch(aiBrainServiceProvider);
  return brainService.getContextSummary();
});

// ============================================================================
// AUTONOMY SETTINGS PROVIDERS
// ============================================================================

/// Provider for user autonomy settings
final userAutonomySettingsProvider =
    FutureProvider<UserAutonomySettings>((ref) async {
  final brainService = ref.watch(aiBrainServiceProvider);
  return brainService.getAutonomySettings();
});

/// State notifier for autonomy settings management
class UserAutonomySettingsNotifier extends StateNotifier<AsyncValue<UserAutonomySettings>> {
  final AiBrainService _brainService;
  final Ref _ref;

  UserAutonomySettingsNotifier(this._brainService, this._ref)
      : super(const AsyncValue.loading()) {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    try {
      final settings = await _brainService.getAutonomySettings();
      state = AsyncValue.data(settings);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateSettings(UserAutonomySettings settings) async {
    try {
      await _brainService.updateAutonomySettings(settings);
      state = AsyncValue.data(settings);
      // Invalidate related providers
      _ref.invalidate(userAutonomySettingsProvider);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> setAutoApplyLevel(AutoApplyLevel level) async {
    final current = state.valueOrNull;
    if (current == null) return;

    await updateSettings(current.copyWith(
      autoApplyLevel: level,
      updatedAt: DateTime.now(),
    ));
  }

  Future<void> setNotificationFrequency(NotificationFrequency frequency) async {
    final current = state.valueOrNull;
    if (current == null) return;

    await updateSettings(current.copyWith(
      notificationFrequency: frequency,
      updatedAt: DateTime.now(),
    ));
  }

  Future<void> setQuietHours({
    bool? enabled,
    int? start,
    int? end,
  }) async {
    final current = state.valueOrNull;
    if (current == null) return;

    await updateSettings(current.copyWith(
      quietHoursEnabled: enabled ?? current.quietHoursEnabled,
      quietHoursStart: start ?? current.quietHoursStart,
      quietHoursEnd: end ?? current.quietHoursEnd,
      updatedAt: DateTime.now(),
    ));
  }

  /// Convenience method to update auto-apply level
  Future<void> updateAutoApplyLevel(AutoApplyLevel level) async {
    await setAutoApplyLevel(level);
  }

  /// Convenience method to update notification frequency
  Future<void> updateNotificationFrequency(NotificationFrequency frequency) async {
    await setNotificationFrequency(frequency);
  }

  /// Generic method to update a single setting by name
  Future<void> updateSetting(String settingName, dynamic value) async {
    final current = state.valueOrNull;
    if (current == null) return;

    UserAutonomySettings updated;
    switch (settingName) {
      case 'canAutoAdjustCalories':
        updated = current.copyWith(canAutoAdjustCalories: value as bool, updatedAt: DateTime.now());
        break;
      case 'canAutoAdjustProtein':
        updated = current.copyWith(canAutoAdjustProtein: value as bool, updatedAt: DateTime.now());
        break;
      case 'canAutoAddRestDay':
        updated = current.copyWith(canAutoAddRestDay: value as bool, updatedAt: DateTime.now());
        break;
      case 'canAutoRemoveWorkout':
        updated = current.copyWith(canAutoRemoveWorkout: value as bool, updatedAt: DateTime.now());
        break;
      case 'canAutoAdjustIntensity':
        updated = current.copyWith(canAutoAdjustIntensity: value as bool, updatedAt: DateTime.now());
        break;
      case 'canAutoAdjustMealTiming':
        updated = current.copyWith(canAutoAdjustMealTiming: value as bool, updatedAt: DateTime.now());
        break;
      case 'canAutoSendNotifications':
        updated = current.copyWith(canAutoSendNotifications: value as bool, updatedAt: DateTime.now());
        break;
      case 'quietHoursEnabled':
        updated = current.copyWith(quietHoursEnabled: value as bool, updatedAt: DateTime.now());
        break;
      case 'quietHoursStart':
        updated = current.copyWith(quietHoursStart: value as int, updatedAt: DateTime.now());
        break;
      case 'quietHoursEnd':
        updated = current.copyWith(quietHoursEnd: value as int, updatedAt: DateTime.now());
        break;
      case 'showAiReasoning':
        updated = current.copyWith(showAiReasoning: value as bool, updatedAt: DateTime.now());
        break;
      case 'enableExperimentalFeatures':
        updated = current.copyWith(enableExperimentalFeatures: value as bool, updatedAt: DateTime.now());
        break;
      case 'minRecoveryForIntensityIncrease':
        updated = current.copyWith(minRecoveryForIntensityIncrease: value as int, updatedAt: DateTime.now());
        break;
      case 'maxCalorieAdjustmentPerDay':
        updated = current.copyWith(maxCalorieAdjustmentPerDay: value as int, updatedAt: DateTime.now());
        break;
      case 'maxProteinAdjustmentPerDay':
        updated = current.copyWith(maxProteinAdjustmentPerDay: value as int, updatedAt: DateTime.now());
        break;
      default:
        return;
    }

    await updateSettings(updated);
  }
}

final userAutonomySettingsNotifierProvider =
    StateNotifierProvider<UserAutonomySettingsNotifier, AsyncValue<UserAutonomySettings>>(
  (ref) {
    final brainService = ref.watch(aiBrainServiceProvider);
    return UserAutonomySettingsNotifier(brainService, ref);
  },
);

// ============================================================================
// DECISIONS PROVIDERS
// ============================================================================

/// Provider for pending decisions awaiting approval
final pendingDecisionsProvider =
    FutureProvider<List<AiBrainDecision>>((ref) async {
  final brainService = ref.watch(aiBrainServiceProvider);
  return brainService.getPendingDecisions();
});

/// Provider for decision history
final decisionHistoryProvider =
    FutureProvider.family<List<AiBrainDecision>, int>((ref, days) async {
  final brainService = ref.watch(aiBrainServiceProvider);
  return brainService.getDecisionHistory(days: days);
});

/// State notifier for managing decisions
class AiBrainDecisionsNotifier extends StateNotifier<AsyncValue<List<AiBrainDecision>>> {
  final AiBrainService _brainService;
  final Ref _ref;

  AiBrainDecisionsNotifier(this._brainService, this._ref)
      : super(const AsyncValue.loading()) {
    _loadPendingDecisions();
  }

  Future<void> _loadPendingDecisions() async {
    try {
      final decisions = await _brainService.getPendingDecisions();
      state = AsyncValue.data(decisions);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    await _loadPendingDecisions();
    _ref.invalidate(pendingDecisionsProvider);
  }

  Future<bool> approveDecision(String decisionId, {String? feedback}) async {
    try {
      final result = await _brainService.approveDecision(decisionId, feedback: feedback);
      if (result) {
        await _loadPendingDecisions();
        _ref.invalidate(aiBrainContextProvider);
      }
      return result;
    } catch (e) {
      return false;
    }
  }

  Future<bool> rejectDecision(String decisionId, {String? reason}) async {
    try {
      final result = await _brainService.rejectDecision(decisionId, reason: reason);
      if (result) {
        await _loadPendingDecisions();
      }
      return result;
    } catch (e) {
      return false;
    }
  }
}

final aiBrainDecisionsNotifierProvider =
    StateNotifierProvider<AiBrainDecisionsNotifier, AsyncValue<List<AiBrainDecision>>>(
  (ref) {
    final brainService = ref.watch(aiBrainServiceProvider);
    return AiBrainDecisionsNotifier(brainService, ref);
  },
);

// ============================================================================
// AUTONOMOUS CYCLE PROVIDER
// ============================================================================

/// Provider for running the autonomous cycle
/// Call this on app launch/resume
final runAutonomousCycleProvider = FutureProvider<AiBrainCycleResult>((ref) async {
  final brainService = ref.watch(aiBrainServiceProvider);
  return brainService.runAutonomousCycle();
});

// ============================================================================
// CHAT INTEGRATION PROVIDER
// ============================================================================

/// State for AI Brain chat
class AiBrainChatState {
  final bool isProcessing;
  final AiBrainChatResponse? lastResponse;
  final String? error;
  final ChatAction? pendingAction;

  const AiBrainChatState({
    this.isProcessing = false,
    this.lastResponse,
    this.error,
    this.pendingAction,
  });

  AiBrainChatState copyWith({
    bool? isProcessing,
    AiBrainChatResponse? lastResponse,
    String? error,
    ChatAction? pendingAction,
  }) {
    return AiBrainChatState(
      isProcessing: isProcessing ?? this.isProcessing,
      lastResponse: lastResponse ?? this.lastResponse,
      error: error,
      pendingAction: pendingAction,
    );
  }
}

/// State notifier for AI Brain chat
class AiBrainChatNotifier extends StateNotifier<AiBrainChatState> {
  final AiBrainService _brainService;
  final Ref _ref;

  AiBrainChatNotifier(this._brainService, this._ref)
      : super(const AiBrainChatState());

  Future<AiBrainChatResponse?> processMessage({
    required String message,
    String? threadId,
    String? contextTag,
  }) async {
    state = state.copyWith(isProcessing: true, error: null);

    try {
      final response = await _brainService.processChat(
        message: message,
        threadId: threadId,
        contextTag: contextTag,
      );

      state = state.copyWith(
        isProcessing: false,
        lastResponse: response,
        pendingAction: response.suggestedAction,
      );

      return response;
    } catch (e) {
      state = state.copyWith(
        isProcessing: false,
        error: e.toString(),
      );
      return null;
    }
  }

  Future<bool> executePendingAction({bool confirmed = false}) async {
    final action = state.pendingAction;
    if (action == null) return false;

    try {
      final result = await _brainService.executeChatAction(action, confirmed: confirmed);
      if (result) {
        state = state.copyWith(pendingAction: null);
        // Invalidate context after action execution
        _ref.invalidate(aiBrainContextProvider);
      }
      return result;
    } catch (e) {
      state = state.copyWith(error: e.toString());
      return false;
    }
  }

  void clearPendingAction() {
    state = state.copyWith(pendingAction: null);
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

final aiBrainChatNotifierProvider =
    StateNotifierProvider<AiBrainChatNotifier, AiBrainChatState>((ref) {
  final brainService = ref.watch(aiBrainServiceProvider);
  return AiBrainChatNotifier(brainService, ref);
});

// ============================================================================
// PLACEHOLDER IMPLEMENTATION (to be replaced with real implementation)
// ============================================================================

/// Placeholder implementation of AiBrainService
/// TODO: Replace with real implementation in ai_brain_service_impl.dart
class AiBrainServiceImpl implements AiBrainService {
  final dynamic database;
  final dynamic geminiService;
  final dynamic healthKitService;
  final dynamic notificationService;
  final dynamic talker;
  final Ref ref;

  AiBrainContext? _cachedContext;
  DateTime? _lastContextRefresh;

  AiBrainServiceImpl({
    required this.database,
    required this.geminiService,
    required this.healthKitService,
    required this.notificationService,
    required this.talker,
    required this.ref,
  });

  @override
  Future<AiBrainContext> getContext({bool forceRefresh = false}) async {
    // Check cache validity (4 hours)
    if (!forceRefresh &&
        _cachedContext != null &&
        _lastContextRefresh != null &&
        DateTime.now().difference(_lastContextRefresh!).inHours < 4) {
      return _cachedContext!;
    }

    // TODO: Implement real context aggregation
    final context = AiBrainContext(
      generatedAt: DateTime.now(),
      syncStatus: AiBrainSyncStatus(
        lastHealthKitSync: DateTime.now(),
      ),
    );

    _cachedContext = context;
    _lastContextRefresh = DateTime.now();
    return context;
  }

  @override
  Future<AiBrainContextSummary> getContextSummary() async {
    return AiBrainContextSummary(
      recoveryScore: 50,
      strainScore: 0,
      caloriesConsumed: 0,
      caloriesTarget: 2000,
      proteinConsumed: 0,
      proteinTarget: 120,
      hasActiveWorkoutPlan: false,
      hasActiveMealPlan: false,
      pendingDecisionsCount: 0,
      generatedAt: DateTime.now(),
    );
  }

  @override
  void invalidateContext() {
    _cachedContext = null;
    _lastContextRefresh = null;
  }

  @override
  Future<AiBrainChatResponse> processChat({
    required String message,
    String? threadId,
    String? contextTag,
  }) async {
    // TODO: Implement real chat processing with Gemini
    return AiBrainChatResponse(
      content: 'AI Brain chat processing will be implemented in Phase 2.',
      quickReplies: ['Got it', 'Tell me more'],
    );
  }

  @override
  Future<bool> executeChatAction(ChatAction action, {bool confirmed = false}) async {
    // TODO: Implement real action execution
    return true;
  }

  @override
  Future<List<AiBrainDecision>> generateDecisions() async {
    // TODO: Implement real decision generation
    return [];
  }

  @override
  Future<bool> executeDecision(AiBrainDecision decision) async {
    // TODO: Implement real decision execution
    return true;
  }

  @override
  Future<bool> approveDecision(String decisionId, {String? feedback}) async {
    // TODO: Implement real approval
    return true;
  }

  @override
  Future<bool> rejectDecision(String decisionId, {String? reason}) async {
    // TODO: Implement real rejection
    return true;
  }

  @override
  Future<List<AiBrainDecision>> getPendingDecisions() async {
    // TODO: Implement real pending decisions fetch
    return [];
  }

  @override
  Future<List<AiBrainDecision>> getDecisionHistory({int days = 7}) async {
    // TODO: Implement real history fetch
    return [];
  }

  @override
  Future<AiBrainCycleResult> runAutonomousCycle() async {
    final stopwatch = Stopwatch()..start();
    // TODO: Implement real autonomous cycle
    stopwatch.stop();

    return AiBrainCycleResult(
      decisionsGenerated: 0,
      decisionsAutoExecuted: 0,
      decisionsPendingApproval: 0,
      notificationsScheduled: 0,
      actions: [],
      errors: [],
      processingTime: stopwatch.elapsed,
    );
  }

  @override
  Future<UserAutonomySettings> getAutonomySettings() async {
    // TODO: Load from database
    return UserAutonomySettings.defaults(id: 'default');
  }

  @override
  Future<void> updateAutonomySettings(UserAutonomySettings settings) async {
    // TODO: Save to database
  }

  @override
  Future<void> scheduleDailyNotifications() async {
    // TODO: Implement notification scheduling
  }

  @override
  Future<void> cancelScheduledNotifications() async {
    // TODO: Implement notification cancellation
  }
}

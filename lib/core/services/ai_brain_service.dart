import '../domain/entities/ai_brain_context.dart';
import '../domain/entities/ai_brain_decision.dart';
import '../domain/entities/user_autonomy_settings.dart';

/// Central AI Brain Service - the main intelligence layer
///
/// This service acts as the central decision-making hub for the AI coach.
/// It aggregates context from multiple sources, generates decisions,
/// handles chat interactions, and coordinates with other services.
abstract class AiBrainService {
  // ============================================================================
  // CONTEXT MANAGEMENT
  // ============================================================================

  /// Get the current unified AI Brain context
  ///
  /// Aggregates data from:
  /// - User profile & protocol
  /// - HealthKit metrics (recovery, strain, sleep, HRV, RHR, steps)
  /// - 7-day trends for all metrics
  /// - Today's nutrition (calories, protein consumed vs targets)
  /// - Active plans (meal plan, workout plan, pending changes)
  /// - Recent chat messages (last 5)
  /// - Active alerts and nudges
  Future<AiBrainContext> getContext({bool forceRefresh = false});

  /// Get a lightweight context summary (for quick operations)
  Future<AiBrainContextSummary> getContextSummary();

  /// Invalidate cached context (force refresh on next get)
  void invalidateContext();

  // ============================================================================
  // CHAT PROCESSING
  // ============================================================================

  /// Process a chat message and generate AI response
  ///
  /// [message] - The user's message
  /// [threadId] - Optional thread ID for conversation continuity
  /// [contextTag] - Optional context tag (e.g., 'home', 'nutrition', 'workouts')
  ///
  /// Returns an [AiBrainChatResponse] with:
  /// - Response content (possibly bilingual)
  /// - Quick reply suggestions
  /// - Optional suggested action
  Future<AiBrainChatResponse> processChat({
    required String message,
    String? threadId,
    String? contextTag,
  });

  /// Execute a chat-suggested action
  ///
  /// [action] - The action to execute
  /// [confirmed] - Whether user has confirmed the action
  ///
  /// Returns true if action was executed successfully
  Future<bool> executeChatAction(ChatAction action, {bool confirmed = false});

  // ============================================================================
  // DECISION ENGINE
  // ============================================================================

  /// Generate proactive decisions based on current context
  ///
  /// Analyzes:
  /// - Health anomalies (HRV drops, RHR elevation, sleep debt)
  /// - Recovery/strain imbalance
  /// - Nutrition progress
  /// - Plan adherence
  ///
  /// Returns a list of [AiBrainDecision] sorted by urgency
  Future<List<AiBrainDecision>> generateDecisions();

  /// Execute a specific decision
  ///
  /// [decision] - The decision to execute
  ///
  /// Returns true if decision was executed successfully
  /// Respects user autonomy settings (may require approval)
  Future<bool> executeDecision(AiBrainDecision decision);

  /// Approve a pending decision
  Future<bool> approveDecision(String decisionId, {String? feedback});

  /// Reject a pending decision
  Future<bool> rejectDecision(String decisionId, {String? reason});

  /// Get pending decisions awaiting approval
  Future<List<AiBrainDecision>> getPendingDecisions();

  /// Get decision history (last N days)
  Future<List<AiBrainDecision>> getDecisionHistory({int days = 7});

  // ============================================================================
  // AUTONOMOUS CYCLE
  // ============================================================================

  /// Run the autonomous decision cycle
  ///
  /// Should be called on:
  /// - App launch
  /// - App resume from background
  /// - After significant data changes
  ///
  /// This method:
  /// 1. Refreshes context
  /// 2. Generates decisions
  /// 3. Auto-executes decisions based on autonomy settings
  /// 4. Queues notifications for user review
  Future<AiBrainCycleResult> runAutonomousCycle();

  // ============================================================================
  // USER SETTINGS
  // ============================================================================

  /// Get current user autonomy settings
  Future<UserAutonomySettings> getAutonomySettings();

  /// Update user autonomy settings
  Future<void> updateAutonomySettings(UserAutonomySettings settings);

  // ============================================================================
  // NOTIFICATION SCHEDULING
  // ============================================================================

  /// Schedule proactive notifications for the day
  ///
  /// Schedules:
  /// - Morning brief (7-8am)
  /// - Midday nutrition check (12-1pm)
  /// - Pre-workout reminder (1hr before scheduled workout)
  /// - Evening summary (8-9pm)
  Future<void> scheduleDailyNotifications();

  /// Cancel all scheduled AI notifications
  Future<void> cancelScheduledNotifications();
}

/// Lightweight context summary for quick operations
class AiBrainContextSummary {
  final int recoveryScore;
  final double strainScore;
  final double? sleepHours;
  final int caloriesConsumed;
  final int caloriesTarget;
  final int proteinConsumed;
  final int proteinTarget;
  final bool hasActiveWorkoutPlan;
  final bool hasActiveMealPlan;
  final int pendingDecisionsCount;
  final DateTime generatedAt;

  AiBrainContextSummary({
    required this.recoveryScore,
    required this.strainScore,
    this.sleepHours,
    required this.caloriesConsumed,
    required this.caloriesTarget,
    required this.proteinConsumed,
    required this.proteinTarget,
    required this.hasActiveWorkoutPlan,
    required this.hasActiveMealPlan,
    required this.pendingDecisionsCount,
    required this.generatedAt,
  });

  /// Check if context is stale
  bool get isStale => DateTime.now().difference(generatedAt).inMinutes > 30;

  /// Get calorie progress (0.0 to 1.0+)
  double get calorieProgress =>
      caloriesTarget > 0 ? caloriesConsumed / caloriesTarget : 0;

  /// Get protein progress (0.0 to 1.0+)
  double get proteinProgress =>
      proteinTarget > 0 ? proteinConsumed / proteinTarget : 0;
}

/// Result of running the autonomous cycle
class AiBrainCycleResult {
  final int decisionsGenerated;
  final int decisionsAutoExecuted;
  final int decisionsPendingApproval;
  final int notificationsScheduled;
  final List<String> actions;
  final List<String> errors;
  final Duration processingTime;

  AiBrainCycleResult({
    required this.decisionsGenerated,
    required this.decisionsAutoExecuted,
    required this.decisionsPendingApproval,
    required this.notificationsScheduled,
    required this.actions,
    required this.errors,
    required this.processingTime,
  });

  bool get hasErrors => errors.isNotEmpty;
  bool get hasActions => actions.isNotEmpty;
}

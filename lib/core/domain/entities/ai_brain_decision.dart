import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_brain_decision.freezed.dart';
part 'ai_brain_decision.g.dart';

/// Type of AI Brain decision
@JsonEnum()
enum DecisionType {
  /// Modify workout or meal plan
  @JsonValue('adjust_plan')
  adjustPlan,

  /// Send a proactive notification
  @JsonValue('send_notification')
  sendNotification,

  /// Generate a health alert
  @JsonValue('generate_alert')
  generateAlert,

  /// Chat response is ready
  @JsonValue('respond_to_chat')
  respondToChat,

  /// Auto-log detected activity
  @JsonValue('log_data')
  logData,

  /// Activate rescue day mode
  @JsonValue('trigger_rescue_mode')
  triggerRescueMode,

  /// Suggest a behavior change
  @JsonValue('suggest_behavior')
  suggestBehavior,

  /// Schedule a reminder
  @JsonValue('schedule_reminder')
  scheduleReminder,
}

/// Urgency level for AI Brain decisions
@JsonEnum()
enum DecisionUrgency {
  /// Execute immediately
  @JsonValue('immediate')
  immediate,

  /// Execute within 1 hour
  @JsonValue('soon')
  soon,

  /// Execute at specific scheduled time
  @JsonValue('scheduled')
  scheduled,

  /// Execute when convenient (background)
  @JsonValue('background')
  background,
}

/// Status of a decision
@JsonEnum()
enum DecisionStatus {
  /// Decision is pending execution
  @JsonValue('pending')
  pending,

  /// Decision requires user approval
  @JsonValue('awaiting_approval')
  awaitingApproval,

  /// Decision was approved by user
  @JsonValue('approved')
  approved,

  /// Decision was rejected by user
  @JsonValue('rejected')
  rejected,

  /// Decision was executed
  @JsonValue('executed')
  executed,

  /// Decision execution failed
  @JsonValue('failed')
  failed,

  /// Decision was cancelled
  @JsonValue('cancelled')
  cancelled,
}

/// Domain affected by the decision
@JsonEnum()
enum DecisionDomain {
  /// Workout/exercise related
  @JsonValue('workout')
  workout,

  /// Nutrition/meal related
  @JsonValue('nutrition')
  nutrition,

  /// Sleep related
  @JsonValue('sleep')
  sleep,

  /// Recovery related
  @JsonValue('recovery')
  recovery,

  /// General health
  @JsonValue('health')
  health,

  /// Protocol/schedule related
  @JsonValue('protocol')
  protocol,

  /// Chat/communication related
  @JsonValue('chat')
  chat,
}

/// AI Brain decision entity
@freezed
class AiBrainDecision with _$AiBrainDecision {
  const AiBrainDecision._();

  const factory AiBrainDecision({
    required String id,
    required DecisionType type,
    required DecisionUrgency urgency,
    required DecisionDomain domain,

    /// Description of the decision (English)
    required String description,

    /// Description of the decision (Arabic)
    String? descriptionAr,

    /// Detailed reasoning for the decision
    String? reasoning,
    String? reasoningAr,

    /// JSON payload with decision-specific data
    required Map<String, dynamic> payload,

    /// Whether this decision requires user approval
    required bool requiresApproval,

    /// Confidence score (0-100)
    @Default(80) int confidence,

    /// Impact score (0-100) - how much this affects the plan
    @Default(50) int impactScore,

    /// Current status
    @Default(DecisionStatus.pending) DecisionStatus status,

    /// Timestamps
    required DateTime createdAt,
    DateTime? scheduledAt,
    DateTime? executedAt,
    DateTime? approvedAt,
    DateTime? rejectedAt,

    /// User feedback on the decision
    String? userFeedback,

    /// Source context that triggered this decision
    String? triggerSource,

    /// Related entity IDs (plan ID, message ID, etc.)
    @Default({}) Map<String, String> relatedIds,
  }) = _AiBrainDecision;

  factory AiBrainDecision.fromJson(Map<String, dynamic> json) =>
      _$AiBrainDecisionFromJson(json);

  /// Check if decision is pending
  bool get isPending => status == DecisionStatus.pending;

  /// Check if decision is awaiting approval
  bool get isAwaitingApproval => status == DecisionStatus.awaitingApproval;

  /// Check if decision was executed
  bool get wasExecuted => status == DecisionStatus.executed;

  /// Check if decision is actionable (can be executed)
  bool get isActionable =>
      status == DecisionStatus.pending ||
      status == DecisionStatus.approved ||
      status == DecisionStatus.awaitingApproval;

  /// Get localized description based on language
  String getDescription(String language) =>
      language == 'ar' && descriptionAr != null ? descriptionAr! : description;

  /// Get localized reasoning based on language
  String? getReasoning(String language) =>
      language == 'ar' && reasoningAr != null ? reasoningAr : reasoning;
}

/// Chat action that can be executed by AI through conversation
@freezed
class ChatAction with _$ChatAction {
  const ChatAction._();

  const factory ChatAction({
    required String type,
    required String description,
    String? descriptionAr,
    required Map<String, dynamic> parameters,
    @Default(80) int confidence,
    @Default(false) bool requiresConfirmation,
  }) = _ChatAction;

  factory ChatAction.fromJson(Map<String, dynamic> json) =>
      _$ChatActionFromJson(json);

  /// Get localized description
  String getDescription(String language) =>
      language == 'ar' && descriptionAr != null ? descriptionAr! : description;
}

/// Chat action types that AI can execute
class ChatActionType {
  static const String modifyMealPlan = 'modify_meal_plan';
  static const String modifyWorkoutPlan = 'modify_workout_plan';
  static const String logMeal = 'log_meal';
  static const String logWorkout = 'log_workout';
  static const String addRestDay = 'add_rest_day';
  static const String triggerRescueMode = 'trigger_rescue_mode';
  static const String adjustCalories = 'adjust_calories';
  static const String adjustProtein = 'adjust_protein';
  static const String scheduleReminder = 'schedule_reminder';
  static const String showStats = 'show_stats';
  static const String explainMetric = 'explain_metric';
}

/// AI Brain chat response with optional action
@freezed
class AiBrainChatResponse with _$AiBrainChatResponse {
  const factory AiBrainChatResponse({
    required String content,
    String? contentAr,
    @Default([]) List<String> quickReplies,
    @Default([]) List<String> quickRepliesAr,
    ChatAction? suggestedAction,
    @Default(false) bool requiresActionConfirmation,
    String? reasoning,
    @Default(0) int processingTimeMs,
  }) = _AiBrainChatResponse;

  factory AiBrainChatResponse.fromJson(Map<String, dynamic> json) =>
      _$AiBrainChatResponseFromJson(json);
}

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/agents/router/agent_router.dart';
import '../../../../core/services/agent_chat_adapter.dart';
import '../../../../core/providers/providers.dart';
import 'coach_chat_repository.dart';

/// Notifier for managing chat with Agent system (instead of AI Brain)
/// 
/// This uses AgentChatAdapter → AgentFactory → 4 specialized agents
class AgentCoachChatNotifier extends StateNotifier<CoachChatState> {
  final CoachChatRepository _repository;
  final AgentChatAdapter _agentAdapter;
  final Future<String> Function() _getUserLanguage;

  /// The forced agent type for per-agent chats (null = auto-route/smart chat)
  AgentType? _forcedAgentType;

  AgentCoachChatNotifier({
    required CoachChatRepository repository,
    required AgentChatAdapter agentAdapter,
    required Future<String> Function() getUserLanguage,
  })  : _repository = repository,
        _agentAdapter = agentAdapter,
        _getUserLanguage = getUserLanguage,
        super(const CoachChatState());

  /// Initialize or load a chat for a specific context
  Future<void> initChat({String? contextTag}) async {
    // Reset state fully when switching to a different context
    state = const CoachChatState(isLoading: true);

    // Determine forced agent type from contextTag (e.g., "agent:fitness")
    _forcedAgentType = _parseAgentType(contextTag);

    try {
      final thread = await _repository.getOrCreateThread(contextTag);
      final messages = await _repository.getMessages(thread.id);

      // Extract quick replies from the last assistant message
      List<String> quickReplies = [];
      if (messages.isNotEmpty) {
        final lastMessage = messages.last;
        if (lastMessage.isAssistantMessage) {
          quickReplies = lastMessage.quickReplies;
        }
      }

      // If no messages, generate initial greeting with quick replies
      if (messages.isEmpty) {
        try {
          final language = await _getUserLanguage();

          final greeting = _agentAdapter.getGreeting(language, forceAgentType: _forcedAgentType);
          quickReplies = _agentAdapter.getInitialQuickReplies(language, forceAgentType: _forcedAgentType);

          // Add greeting as system message
          final greetingMessage = await _repository.addAssistantMessage(
            threadId: thread.id,
            content: greeting,
            quickReplies: quickReplies,
            contextTag: contextTag,
          );

          state = state.copyWith(
            activeThread: thread,
            messages: [greetingMessage],
            isLoading: false,
            quickReplies: quickReplies,
          );
          return;
        } catch (e) {
          // If greeting generation fails, show a fallback greeting
          final fallbackGreeting = await _repository.addAssistantMessage(
            threadId: thread.id,
            content: _forcedAgentType != null
                ? 'مرحباً! كيف أقدر أساعدك؟ 👋'
                : '👋 مرحباً! أنا مساعدك الصحي. إزاي أقدر أساعدك النهاردة؟',
            quickReplies: [],
            contextTag: contextTag,
          );

          state = state.copyWith(
            activeThread: thread,
            messages: [fallbackGreeting],
            isLoading: false,
          );
          return;
        }
      }

      state = state.copyWith(
        activeThread: thread,
        messages: messages,
        isLoading: false,
        quickReplies: quickReplies,
      );
    } catch (e) {
      state = state.copyWith(
        error: e.toString(),
        isLoading: false,
      );
    }
  }

  /// Send a user message
  Future<void> sendMessage(String content) async {
    if (state.activeThread == null) return;
    if (content.trim().isEmpty) return;

    state = state.copyWith(isSending: true, error: null, quickReplies: []);

    try {
      // Add user message
      final userMessage = await _repository.addUserMessage(
        threadId: state.activeThread!.id,
        content: content.trim(),
        contextTag: state.activeThread!.contextTag,
      );

      state = state.copyWith(
        messages: [...state.messages, userMessage],
      );

      // Generate agent response
      await _generateAgentReply(content.trim());
    } catch (e) {
      state = state.copyWith(
        error: e.toString(),
        isSending: false,
      );
    }
  }

  /// Generate agent reply using AgentChatAdapter
  Future<void> _generateAgentReply(String userMessage) async {
    if (state.activeThread == null) return;

    try {
      // Get language
      final language = await _getUserLanguage();

      // Process message with agent system (force to specific agent if in per-agent chat)
      final response = await _agentAdapter.processMessage(
        message: userMessage,
        language: language,
        forceAgentType: _forcedAgentType,
      );

      // Add agent response to thread
      final assistantMessage = await _repository.addAssistantMessage(
        threadId: state.activeThread!.id,
        content: response.content,
        quickReplies: response.quickReplies,
        contextTag: '${response.agentEmoji}${response.agentName}', // Store agent info
      );

      state = state.copyWith(
        messages: [...state.messages, assistantMessage],
        quickReplies: response.quickReplies,
        isSending: false,
      );
    } catch (e) {
      // Add error message
      final errorMessage = await _repository.addErrorMessage(
        threadId: state.activeThread!.id,
        content: 'Sorry, an error occurred: ${e.toString()}',
      );

      state = state.copyWith(
        messages: [...state.messages, errorMessage],
        isSending: false,
        error: e.toString(),
      );
    }
  }

  /// Start a new chat thread
  Future<void> startNewChat() async {
    state = state.copyWith(isLoading: true);
    try {
      final thread = await _repository.createThread();
      final language = await _getUserLanguage();

      final greeting = _agentAdapter.getGreeting(language);
      final quickReplies = _agentAdapter.getInitialQuickReplies(language);

      final greetingMessage = await _repository.addAssistantMessage(
        threadId: thread.id,
        content: greeting,
        quickReplies: quickReplies,
      );

      state = state.copyWith(
        activeThread: thread,
        messages: [greetingMessage],
        isLoading: false,
        quickReplies: quickReplies,
      );
    } catch (e) {
      state = state.copyWith(
        error: e.toString(),
        isLoading: false,
      );
    }
  }

  /// Delete current thread
  Future<void> deleteThread() async {
    if (state.activeThread == null) return;

    try {
      await _repository.deleteThread(state.activeThread!.id);
      state = const CoachChatState();
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  /// Clear error state
  void clearError() {
    state = state.copyWith(error: null);
  }

  /// Parse agent type from contextTag (e.g., "agent:fitness" → AgentType.fitness)
  AgentType? _parseAgentType(String? contextTag) {
    if (contextTag == null || !contextTag.startsWith('agent:')) return null;
    final typeStr = contextTag.replaceFirst('agent:', '');
    try {
      return AgentType.values.firstWhere((t) => t.id == typeStr);
    } catch (_) {
      return null;
    }
  }
}

// ============================================================================
// PROVIDER
// ============================================================================

/// Provider for Agent-based coach chat (replaces AI Brain chat)
final agentCoachChatNotifierProvider =
    StateNotifierProvider<AgentCoachChatNotifier, CoachChatState>((ref) {
  final repository = ref.watch(coachChatRepositoryProvider);
  final agentAdapter = ref.watch(agentChatAdapterProvider);

  return AgentCoachChatNotifier(
    repository: repository,
    agentAdapter: agentAdapter,
    getUserLanguage: () async {
      // TODO: Get from user settings
      // For now, default to Arabic
      return 'ar';
    },
  );
});

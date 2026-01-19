import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/data/database/database.dart' as db;
import '../../../../core/domain/entities/ai_brain_context.dart';
import '../../../../core/domain/entities/ai_brain_decision.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/services/ai_brain_chat_handler.dart';
import '../../domain/entities/chat_message.dart';
import '../../domain/entities/chat_thread.dart';

// ============================================================================
// REPOSITORY INTERFACE
// ============================================================================

/// Repository for coach chat data operations
abstract class CoachChatRepository {
  /// Get all chat threads
  Future<List<ChatThread>> getThreads({bool activeOnly = true});

  /// Get a specific thread by ID
  Future<ChatThread?> getThread(String id);

  /// Get or create thread for a specific context
  Future<ChatThread> getOrCreateThread(String? contextTag);

  /// Create a new chat thread
  Future<ChatThread> createThread({String? contextTag, String? title});

  /// Update a chat thread
  Future<void> updateThread(ChatThread thread);

  /// Delete a chat thread and all its messages
  Future<void> deleteThread(String id);

  /// Get all messages in a thread
  Future<List<ChatMessage>> getMessages(String threadId);

  /// Watch messages in a thread (real-time updates)
  Stream<List<ChatMessage>> watchMessages(String threadId);

  /// Add a user message to a thread
  Future<ChatMessage> addUserMessage({
    required String threadId,
    required String content,
    String? contextTag,
  });

  /// Add an assistant message to a thread
  Future<ChatMessage> addAssistantMessage({
    required String threadId,
    required String content,
    List<String>? quickReplies,
    String? proposalId,
    String? contextTag,
  });

  /// Add an error message to a thread
  Future<ChatMessage> addErrorMessage({
    required String threadId,
    required String content,
  });

  /// Delete a message
  Future<void> deleteMessage(String id);

  /// Get the last message in a thread
  Future<ChatMessage?> getLastMessage(String threadId);
}

// ============================================================================
// REPOSITORY IMPLEMENTATION
// ============================================================================

class CoachChatRepositoryImpl implements CoachChatRepository {
  final db.AppDatabase _database;
  static const _uuid = Uuid();

  CoachChatRepositoryImpl(this._database);

  @override
  Future<List<ChatThread>> getThreads({bool activeOnly = true}) async {
    final rows = await _database.getChatThreads(activeOnly: activeOnly);
    return rows.map(_mapToThread).toList();
  }

  @override
  Future<ChatThread?> getThread(String id) async {
    final row = await _database.getChatThread(id);
    if (row == null) return null;
    return _mapToThread(row);
  }

  @override
  Future<ChatThread> getOrCreateThread(String? contextTag) async {
    // Try to find an existing active thread for this context
    if (contextTag != null) {
      final existing = await _database.getActiveThreadByContext(contextTag);
      if (existing != null) {
        return _mapToThread(existing);
      }
    }

    // Create a new thread
    return createThread(contextTag: contextTag);
  }

  @override
  Future<ChatThread> createThread({String? contextTag, String? title}) async {
    final now = DateTime.now();
    final id = _uuid.v4();

    await _database.insertChatThread(
      db.ChatThreadsCompanion(
        id: Value(id),
        title: Value(title),
        contextTag: Value(contextTag),
        createdAt: Value(now),
        updatedAt: Value(now),
        lastMessageAt: const Value.absent(),
        isActive: const Value(true),
      ),
    );

    return ChatThread(
      id: id,
      title: title,
      contextTag: contextTag,
      createdAt: now,
      updatedAt: now,
      isActive: true,
    );
  }

  @override
  Future<void> updateThread(ChatThread thread) async {
    await _database.updateChatThread(
      db.ChatThreadsCompanion(
        id: Value(thread.id),
        title: Value(thread.title),
        contextTag: Value(thread.contextTag),
        createdAt: Value(thread.createdAt),
        updatedAt: Value(DateTime.now()),
        lastMessageAt: Value(thread.lastMessageAt),
        isActive: Value(thread.isActive),
      ),
    );
  }

  @override
  Future<void> deleteThread(String id) async {
    // Delete all messages first (foreign key constraint)
    await _database.deleteAllMessagesInThread(id);
    await _database.deleteChatThread(id);
  }

  @override
  Future<List<ChatMessage>> getMessages(String threadId) async {
    final rows = await _database.getChatMessages(threadId);
    return rows.map(_mapToMessage).toList();
  }

  @override
  Stream<List<ChatMessage>> watchMessages(String threadId) {
    return _database.watchChatMessages(threadId).map(
          (rows) => rows.map(_mapToMessage).toList(),
        );
  }

  @override
  Future<ChatMessage> addUserMessage({
    required String threadId,
    required String content,
    String? contextTag,
  }) async {
    return _addMessage(
      threadId: threadId,
      role: MessageRole.user,
      content: content,
      contextTag: contextTag,
    );
  }

  @override
  Future<ChatMessage> addAssistantMessage({
    required String threadId,
    required String content,
    List<String>? quickReplies,
    String? proposalId,
    String? contextTag,
  }) async {
    String? metadataJson;
    if (quickReplies != null && quickReplies.isNotEmpty) {
      metadataJson = jsonEncode(
        ChatMessageMetadata(quickReplies: quickReplies).toJson(),
      );
    }

    return _addMessage(
      threadId: threadId,
      role: MessageRole.assistant,
      content: content,
      contextTag: contextTag,
      metadataJson: metadataJson,
      proposalId: proposalId,
    );
  }

  @override
  Future<ChatMessage> addErrorMessage({
    required String threadId,
    required String content,
  }) async {
    return _addMessage(
      threadId: threadId,
      role: MessageRole.assistant,
      content: content,
      isError: true,
    );
  }

  @override
  Future<void> deleteMessage(String id) async {
    await _database.deleteChatMessage(id);
  }

  @override
  Future<ChatMessage?> getLastMessage(String threadId) async {
    final row = await _database.getLastMessage(threadId);
    if (row == null) return null;
    return _mapToMessage(row);
  }

  // ============================================================================
  // PRIVATE HELPERS
  // ============================================================================

  Future<ChatMessage> _addMessage({
    required String threadId,
    required MessageRole role,
    required String content,
    String? contextTag,
    String? metadataJson,
    String? proposalId,
    bool isError = false,
  }) async {
    final now = DateTime.now();
    final id = _uuid.v4();

    await _database.insertChatMessage(
      db.ChatMessagesCompanion(
        id: Value(id),
        threadId: Value(threadId),
        role: Value(role.name),
        content: Value(content),
        createdAt: Value(now),
        contextTag: Value(contextTag),
        metadataJson: Value(metadataJson),
        proposalId: Value(proposalId),
        isError: Value(isError),
      ),
    );

    // Update thread's last message time
    await _database.updateThreadLastMessageAt(threadId, now);

    return ChatMessage(
      id: id,
      threadId: threadId,
      role: role,
      content: content,
      createdAt: now,
      contextTag: contextTag,
      metadataJson: metadataJson,
      proposalId: proposalId,
      isError: isError,
    );
  }

  ChatThread _mapToThread(db.ChatThread row) {
    return ChatThread(
      id: row.id,
      title: row.title,
      contextTag: row.contextTag,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      lastMessageAt: row.lastMessageAt,
      isActive: row.isActive,
    );
  }

  ChatMessage _mapToMessage(db.ChatMessage row) {
    return ChatMessage(
      id: row.id,
      threadId: row.threadId,
      role: _parseRole(row.role),
      content: row.content,
      createdAt: row.createdAt,
      contextTag: row.contextTag,
      metadataJson: row.metadataJson,
      proposalId: row.proposalId,
      isError: row.isError,
    );
  }

  MessageRole _parseRole(String role) {
    switch (role) {
      case 'user':
        return MessageRole.user;
      case 'assistant':
        return MessageRole.assistant;
      case 'system':
        return MessageRole.system;
      default:
        return MessageRole.assistant;
    }
  }
}

// ============================================================================
// PROVIDERS
// ============================================================================

/// Repository provider
final coachChatRepositoryProvider = Provider<CoachChatRepository>((ref) {
  final database = ref.watch(databaseProvider);
  return CoachChatRepositoryImpl(database);
});

/// Provider for all chat threads
final chatThreadsProvider = FutureProvider<List<ChatThread>>((ref) async {
  final repository = ref.watch(coachChatRepositoryProvider);
  return repository.getThreads();
});

/// Provider for a specific thread
final chatThreadProvider =
    FutureProvider.family<ChatThread?, String>((ref, threadId) async {
  final repository = ref.watch(coachChatRepositoryProvider);
  return repository.getThread(threadId);
});

/// Provider for messages in a thread (real-time stream)
final chatMessagesProvider =
    StreamProvider.family<List<ChatMessage>, String>((ref, threadId) {
  final repository = ref.watch(coachChatRepositoryProvider);
  return repository.watchMessages(threadId);
});

// ============================================================================
// STATE MANAGEMENT
// ============================================================================

/// State for the active chat session
class CoachChatState {
  final ChatThread? activeThread;
  final List<ChatMessage> messages;
  final bool isLoading;
  final bool isSending;
  final String? error;
  final List<String> quickReplies;

  const CoachChatState({
    this.activeThread,
    this.messages = const [],
    this.isLoading = false,
    this.isSending = false,
    this.error,
    this.quickReplies = const [],
  });

  CoachChatState copyWith({
    ChatThread? activeThread,
    List<ChatMessage>? messages,
    bool? isLoading,
    bool? isSending,
    String? error,
    List<String>? quickReplies,
  }) {
    return CoachChatState(
      activeThread: activeThread ?? this.activeThread,
      messages: messages ?? this.messages,
      isLoading: isLoading ?? this.isLoading,
      isSending: isSending ?? this.isSending,
      error: error,
      quickReplies: quickReplies ?? this.quickReplies,
    );
  }
}

/// Notifier for managing active chat state with AI Brain integration
class CoachChatNotifier extends StateNotifier<CoachChatState> {
  final CoachChatRepository _repository;
  final AiBrainChatHandler _chatHandler;
  final Future<AiBrainContext> Function() _getContext;
  final Future<String> Function() _getUserLanguage;
  ChatAction? _pendingAction;

  CoachChatNotifier({
    required CoachChatRepository repository,
    required AiBrainChatHandler chatHandler,
    required Future<AiBrainContext> Function() getContext,
    required Future<String> Function() getUserLanguage,
  })  : _repository = repository,
        _chatHandler = chatHandler,
        _getContext = getContext,
        _getUserLanguage = getUserLanguage,
        super(const CoachChatState());

  /// Get the pending action (if any)
  ChatAction? get pendingAction => _pendingAction;

  /// Initialize or load a chat for a specific context
  Future<void> initChat({String? contextTag}) async {
    state = state.copyWith(isLoading: true, error: null);
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
          final context = await _getContext();
          final language = await _getUserLanguage();

          final greeting = _chatHandler.getContextualGreeting(
            context: context,
            language: language,
          );

          quickReplies = _chatHandler.getContextualQuickReplies(
            context: context,
            language: language,
          );

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
        } catch (_) {
          // If context fetch fails, continue without greeting
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
    _pendingAction = null;

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

      // Generate real AI response
      await _generateAiReply(content.trim());
    } catch (e) {
      state = state.copyWith(
        error: e.toString(),
        isSending: false,
      );
    }
  }

  /// Generate real AI reply using AI Brain chat handler
  Future<void> _generateAiReply(String userMessage) async {
    if (state.activeThread == null) return;

    try {
      // Get current context
      final context = await _getContext();
      final language = await _getUserLanguage();

      // Build conversation history from recent messages
      final recentMessages = state.messages.take(10).map((msg) => {
        'role': msg.role.name,
        'content': msg.content,
      }).toList();

      // Process message with AI Brain
      final response = await _chatHandler.processMessage(
        message: userMessage,
        context: context,
        conversationHistory: recentMessages,
        language: language,
      );

      // Store pending action if any
      _pendingAction = response.suggestedAction;

      // Get quick replies (use language-appropriate ones)
      final quickReplies = language == 'ar'
          ? (response.quickRepliesAr.isNotEmpty
              ? response.quickRepliesAr
              : response.quickReplies)
          : response.quickReplies;

      // Get content (use language-appropriate one)
      final content = language == 'ar'
          ? (response.contentAr ?? response.content)
          : response.content;

      // Add AI response to thread
      final assistantMessage = await _repository.addAssistantMessage(
        threadId: state.activeThread!.id,
        content: content,
        quickReplies: quickReplies,
        contextTag: state.activeThread!.contextTag,
      );

      state = state.copyWith(
        messages: [...state.messages, assistantMessage],
        isSending: false,
        quickReplies: quickReplies,
      );
    } catch (e) {
      // On error, add a fallback error message
      final language = await _getUserLanguage();
      final errorContent = language == 'ar'
          ? 'عذراً، حدث خطأ في معالجة رسالتك. حاول مرة أخرى.'
          : 'Sorry, there was an error processing your message. Please try again.';

      final errorReplies = language == 'ar'
          ? ['حاول مرة أخرى', 'أخبرني المزيد']
          : ['Try again', 'Tell me more'];

      final errorMessage = await _repository.addErrorMessage(
        threadId: state.activeThread!.id,
        content: errorContent,
      );

      state = state.copyWith(
        messages: [...state.messages, errorMessage],
        isSending: false,
        quickReplies: errorReplies,
        error: e.toString(),
      );
    }
  }

  /// Confirm and execute the pending action
  Future<bool> confirmPendingAction() async {
    if (_pendingAction == null) return false;

    // TODO: Implement action execution through AI Brain service
    // For now, just clear the pending action
    _pendingAction = null;
    return true;
  }

  /// Cancel the pending action
  void cancelPendingAction() {
    _pendingAction = null;
  }

  /// Send a quick reply
  Future<void> sendQuickReply(String reply) async {
    await sendMessage(reply);
  }

  /// Clear the current chat state
  void clearChat() {
    state = const CoachChatState();
    _pendingAction = null;
  }

  /// Delete the current thread
  Future<void> deleteCurrentThread() async {
    if (state.activeThread == null) return;

    try {
      await _repository.deleteThread(state.activeThread!.id);
      state = const CoachChatState();
      _pendingAction = null;
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }
}

/// Provider for the AI Brain chat handler
final aiBrainChatHandlerProvider = Provider<AiBrainChatHandler>((ref) {
  final geminiService = ref.watch(geminiCoachServiceProvider);
  final talker = ref.watch(talkerProvider);
  return AiBrainChatHandler(
    geminiService: geminiService,
    talker: talker,
  );
});

/// Provider for user language preference
final userLanguageProvider = FutureProvider<String>((ref) async {
  final db = ref.watch(databaseProvider);
  final profile = await db.getUserProfile();
  if (profile != null) {
    try {
      final prefs = jsonDecode(profile.aiPreferencesJson) as Map<String, dynamic>;
      return prefs['language'] as String? ?? 'ar';
    } catch (_) {}
  }
  return 'ar';
});

/// Provider for the coach chat notifier with AI Brain integration
final coachChatNotifierProvider =
    StateNotifierProvider<CoachChatNotifier, CoachChatState>((ref) {
  final repository = ref.watch(coachChatRepositoryProvider);
  final chatHandler = ref.watch(aiBrainChatHandlerProvider);
  final brainService = ref.watch(aiBrainServiceProvider);

  return CoachChatNotifier(
    repository: repository,
    chatHandler: chatHandler,
    getContext: () => brainService.getContext(),
    getUserLanguage: () async {
      final langAsync = await ref.read(userLanguageProvider.future);
      return langAsync;
    },
  );
});

import 'package:health_keeper/core/data/database/database.dart';
import 'package:health_keeper/core/agents/context/agent_context.dart';
import 'package:health_keeper/core/agents/context/shared_context_builder.dart';
import 'package:health_keeper/core/agents/router/agent_router.dart';
import 'package:health_keeper/core/services/gemini_coach_service.dart';
import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart';

/// Base class for all specialized agents
abstract class BaseAgent {
  final AppDatabase db;
  final GeminiCoachService geminiService;
  final SharedContextBuilder contextBuilder;
  final _uuid = const Uuid();

  BaseAgent({
    required this.db,
    required this.geminiService,
  }) : contextBuilder = SharedContextBuilder(db);

  /// Agent type (fitness, nutrition, health, general)
  AgentType get agentType;

  /// Agent personality/tone
  String get personality;

  /// System prompt for this agent
  String buildSystemPrompt({String language = 'ar'});

  /// Generate response to user message
  Future<String> generateResponse({
    required String userMessage,
    String language = 'ar',
  }) async {
    // 1. Build context
    final context = await contextBuilder.buildContext(
      agentType: agentType.id,
    );

    // 2. Build full prompt
    final systemPrompt = buildSystemPrompt(language: language);
    final contextSummary = context.buildSummary(language: language);
    final conversationHistory = _buildConversationHistory(
      context.conversationHistory,
    );

    final fullPrompt = '''
$systemPrompt

$contextSummary

$conversationHistory

المستخدم: $userMessage

الرد:''';

    // 3. Send to AI (Gemini 2.5)
    // TODO: Replace with actual Gemini call
    final aiResponse = await _callAI(fullPrompt);

    // 4. Save conversation
    await _saveConversation(
      context: context,
      userMessage: userMessage,
      assistantResponse: aiResponse,
    );

    return aiResponse;
  }

  /// Build conversation history string
  String _buildConversationHistory(List<AgentConversation> history) {
    if (history.isEmpty) return '';

    final buffer = StringBuffer();
    buffer.writeln('## المحادثات السابقة:');

    // Show last 10 messages
    final recentHistory = history.take(10).toList().reversed.toList();

    for (final message in recentHistory) {
      if (message.role == 'user') {
        buffer.writeln('المستخدم: ${message.content}');
      } else if (message.role == 'assistant') {
        buffer.writeln('أنت: ${message.content}');
      }
    }

    buffer.writeln();
    return buffer.toString();
  }

  /// Save conversation to database
  Future<void> _saveConversation({
    required AgentContext context,
    required String userMessage,
    required String assistantResponse,
  }) async {
    final now = DateTime.now();
    final contextSnapshot = context.buildSnapshot();

    // Save user message
    await db.insertAgentConversation(
      AgentConversationsCompanion.insert(
        id: Value(_uuid.v4()),
        agentType: agentType.id,
        role: 'user',
        content: userMessage,
        contextSnapshotJson: Value(contextSnapshot.toString()),
        timestamp: now,
      ),
    );

    // Save assistant response
    await db.insertAgentConversation(
      AgentConversationsCompanion.insert(
        id: Value(_uuid.v4()),
        agentType: agentType.id,
        role: 'assistant',
        content: assistantResponse,
        contextSnapshotJson: Value(contextSnapshot.toString()),
        timestamp: now.add(const Duration(seconds: 1)),
      ),
    );
  }

  /// Call AI service (Gemini 2.5)
  Future<String> _callAI(String prompt) async {
    try {
      final response = await geminiService.generateContent(prompt);
      
      if (response == null || response.isEmpty) {
        return 'عذراً، حصل خطأ في الاتصال بالـAI. حاول مرة تانية.';
      }
      
      return response;
    } catch (e) {
      return 'عذراً، حصل خطأ: ${e.toString()}';
    }
  }

  /// Agent-specific greeting
  String get greeting {
    return AgentRouter.buildGreeting(agentType);
  }

  /// Agent display name
  String get displayName {
    return AgentRouter.getAgentName(agentType, withEmoji: true);
  }
}

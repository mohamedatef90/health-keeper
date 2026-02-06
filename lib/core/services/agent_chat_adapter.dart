import 'package:health_keeper/core/agents/services/agent_factory.dart';
import 'package:health_keeper/core/agents/router/agent_router.dart';

/// Adapter to use Agent system in chat UI
/// 
/// This bridges AgentFactory → Chat UI (preserving chat interface)
class AgentChatAdapter {
  final AgentFactory _agentFactory;

  AgentChatAdapter({
    required AgentFactory agentFactory,
  }) : _agentFactory = agentFactory;

  /// Process a user message and get agent response
  /// 
  /// Returns: AgentChatResponse with content, agent info, quick replies
  Future<AgentChatResponse> processMessage({
    required String message,
    String language = 'ar',
  }) async {
    try {
      // Route message to appropriate agent
      final response = await _agentFactory.routeMessage(message);

      // Generate quick replies based on agent type
      final quickReplies = _getQuickRepliesForAgent(
        response.agentType,
        language,
      );

      return AgentChatResponse(
        content: response.message,
        agentType: response.agentType,
        agentName: response.agentName,
        agentEmoji: _getAgentEmoji(response.agentType),
        quickReplies: quickReplies,
      );
    } catch (e) {
      // Fallback to general agent
      return AgentChatResponse(
        content: language == 'ar' 
            ? 'عذراً، حصل خطأ. ممكن تعيد السؤال؟'
            : 'Sorry, an error occurred. Can you try again?',
        agentType: AgentType.general,
        agentName: language == 'ar' ? '🤖 المساعد العام' : '🤖 General Assistant',
        agentEmoji: '🤖',
        quickReplies: [],
        hasError: true,
      );
    }
  }

  /// Get contextual greeting (on first open)
  String getGreeting(String language) {
    if (language == 'ar') {
      return '''👋 مرحباً! أنا مساعدك الصحي.

عندي 4 متخصصين جاهزين لمساعدتك:
🏋️ **وكيل اللياقة** - تمارين، استشفاء، HRV
🍽️ **وكيل التغذية** - وجبات، سعرات، وصفات
🩺 **وكيل الصحة** - أدوية، نوم، فحوصات
🤖 **المساعد العام** - خطط أسبوعية، ملخصات

إزاي أقدر أساعدك النهاردة؟''';
    } else {
      return '''👋 Hi! I'm your health assistant.

I have 4 specialists ready to help:
🏋️ **Fitness Agent** - workouts, recovery, HRV
🍽️ **Nutrition Agent** - meals, calories, recipes
🩺 **Health Agent** - medications, sleep, check-ups
🤖 **General Assistant** - weekly plans, summaries

How can I help you today?''';
    }
  }

  /// Get initial quick replies
  List<String> getInitialQuickReplies(String language) {
    if (language == 'ar') {
      return [
        'إيه أحسن تمرين النهاردة؟',
        'اقترحلي وجبة غدا',
        'امتى أخد موونجارو؟',
        'خطة الأسبوع',
      ];
    } else {
      return [
        'Best workout for today?',
        'Suggest a lunch meal',
        'When to take Mounjaro?',
        'Weekly plan',
      ];
    }
  }

  // ==========================================================================
  // PRIVATE HELPERS
  // ==========================================================================

  String _getAgentEmoji(AgentType type) {
    switch (type) {
      case AgentType.fitness:
        return '🏋️';
      case AgentType.nutrition:
        return '🍽️';
      case AgentType.health:
        return '🩺';
      case AgentType.general:
        return '🤖';
    }
  }

  List<String> _getQuickRepliesForAgent(AgentType type, String language) {
    if (language == 'ar') {
      switch (type) {
        case AgentType.fitness:
          return [
            'تمرين تاني؟',
            'إزاي أحسّن استشفائي؟',
            'إيه الـ HRV بتاعي؟',
          ];
        case AgentType.nutrition:
          return [
            'وجبة خفيفة؟',
            'كام سعر أكلت؟',
            'وصفة عالية بروتين؟',
          ];
        case AgentType.health:
          return [
            'إيه جدول الموونجارو؟',
            'نومي كويس؟',
            'ضغطي طبيعي؟',
          ];
        case AgentType.general:
          return [
            'خطة الأسبوع الجاي',
            'ملخص تقدمي',
            'إيه اللي فات؟',
          ];
      }
    } else {
      switch (type) {
        case AgentType.fitness:
          return [
            'Another workout?',
            'How to improve recovery?',
            'What\'s my HRV?',
          ];
        case AgentType.nutrition:
          return [
            'Light snack idea?',
            'Calories eaten today?',
            'High protein recipe?',
          ];
        case AgentType.health:
          return [
            'Mounjaro schedule?',
            'How\'s my sleep?',
            'Is my BP normal?',
          ];
        case AgentType.general:
          return [
            'Next week plan',
            'Progress summary',
            'What did I miss?',
          ];
      }
    }
  }
}

/// Response from agent system (adapted for chat UI)
class AgentChatResponse {
  final String content;
  final AgentType agentType;
  final String agentName;
  final String agentEmoji;
  final List<String> quickReplies;
  final bool hasError;

  AgentChatResponse({
    required this.content,
    required this.agentType,
    required this.agentName,
    required this.agentEmoji,
    this.quickReplies = const [],
    this.hasError = false,
  });
}

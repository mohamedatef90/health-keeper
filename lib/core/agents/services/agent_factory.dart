import 'package:health_keeper/core/data/database/database.dart';
import 'package:health_keeper/core/agents/services/base_agent.dart';
import 'package:health_keeper/core/agents/services/fitness_agent.dart';
import 'package:health_keeper/core/agents/services/nutrition_agent.dart';
import 'package:health_keeper/core/agents/services/health_agent.dart';
import 'package:health_keeper/core/agents/services/general_agent.dart';
import 'package:health_keeper/core/agents/router/agent_router.dart';
import 'package:health_keeper/core/services/gemini_coach_service.dart';

/// Factory for creating specialized agents
class AgentFactory {
  final AppDatabase db;
  final GeminiCoachService geminiService;

  // Singleton instances (reuse agents)
  FitnessAgent? _fitnessAgent;
  NutritionAgent? _nutritionAgent;
  HealthAgent? _healthAgent;
  GeneralAgent? _generalAgent;

  AgentFactory({
    required this.db,
    required this.geminiService,
  });

  /// Get agent by type
  BaseAgent getAgent(AgentType type) {
    switch (type) {
      case AgentType.fitness:
        return _fitnessAgent ??= FitnessAgent(
          db: db,
          geminiService: geminiService,
        );
      case AgentType.nutrition:
        return _nutritionAgent ??= NutritionAgent(
          db: db,
          geminiService: geminiService,
        );
      case AgentType.health:
        return _healthAgent ??= HealthAgent(
          db: db,
          geminiService: geminiService,
        );
      case AgentType.general:
        return _generalAgent ??= GeneralAgent(
          db: db,
          geminiService: geminiService,
        );
    }
  }

  /// Get agent by id string
  BaseAgent getAgentById(String agentId) {
    final type = AgentType.values.firstWhere(
      (t) => t.id == agentId,
      orElse: () => AgentType.general,
    );
    return getAgent(type);
  }

  /// Route message to appropriate agent and get response
  Future<AgentResponse> routeMessage(String userMessage) async {
    // 1. Detect intent
    final agentType = AgentRouter.detectIntent(userMessage);

    // 2. Get appropriate agent
    final agent = getAgent(agentType);

    // 3. Generate response
    final response = await agent.generateResponse(userMessage: userMessage);

    return AgentResponse(
      agentType: agentType,
      agentName: agent.displayName,
      message: response,
    );
  }

  /// Get all available agents
  List<BaseAgent> getAllAgents() {
    return [
      getAgent(AgentType.fitness),
      getAgent(AgentType.nutrition),
      getAgent(AgentType.health),
      getAgent(AgentType.general),
    ];
  }

  /// Clear cached agents (for testing)
  void clearCache() {
    _fitnessAgent = null;
    _nutritionAgent = null;
    _healthAgent = null;
    _generalAgent = null;
  }
}

/// Response from an agent
class AgentResponse {
  final AgentType agentType;
  final String agentName;
  final String message;

  AgentResponse({
    required this.agentType,
    required this.agentName,
    required this.message,
  });

  @override
  String toString() {
    return '$agentName:\n$message';
  }
}

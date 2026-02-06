import 'package:health_keeper/core/data/database/database.dart';
import 'package:health_keeper/core/agents/services/agent_factory.dart';
import 'package:health_keeper/core/agents/memory/memory_manager.dart';

/// Example usage of the multi-agent system
/// 
/// Copy-paste this into your UI code to integrate the agents
void main() async {
  // Initialize database
  final db = AppDatabase();

  // Create agent factory
  final agentFactory = AgentFactory(db);

  // Create memory manager
  final memoryManager = MemoryManager(db);

  // ============================================================================
  // EXAMPLE 1: Simple user query
  // ============================================================================

  final userQuery = 'إيه أحسن تمرين النهاردة؟';

  // Route and get response
  final response = await agentFactory.routeMessage(userQuery);

  print('${response.agentName}:');
  print(response.message);
  // Output:
  // 🏋️ وكيل اللياقة:
  // نومك امبارح 7.5 ساعة وHRV 55، استشفاءك 65%. 
  // النهاردة راحة خفيفة: مشي 20 دقيقة أو تمدد. 
  // عندك ماتش بكرة، خلي جسمك يرتاح 💪

  // ============================================================================
  // EXAMPLE 2: Voice command
  // ============================================================================

  final voiceCommand = 'وزني 75.3';
  final voiceResponse = await memoryManager.processVoiceCommand(voiceCommand);

  print(voiceResponse);
  // Output: تمام! سجلت وزنك: 75.3 كيلو (↓ 0.2) 💪

  // ============================================================================
  // EXAMPLE 3: Specific agent
  // ============================================================================

  final nutritionAgent = agentFactory.getAgentById('nutrition');
  final nutritionResponse = await nutritionAgent.generateResponse(
    userMessage: 'اقترحلي وجبة غدا',
  );

  print(nutritionResponse);

  // ============================================================================
  // EXAMPLE 4: Multiple queries in conversation
  // ============================================================================

  final queries = [
    'مرحبا',
    'إيه خطتي للأسبوع؟',
    'كام سعرة أكلت النهاردة؟',
    'امتى أخد موونجارو؟',
  ];

  for (final query in queries) {
    final resp = await agentFactory.routeMessage(query);
    print('\nUser: $query');
    print('${resp.agentName}: ${resp.message}');
  }

  // ============================================================================
  // EXAMPLE 5: Get agent greeting
  // ============================================================================

  final allAgents = agentFactory.getAllAgents();

  print('\n=== Available Agents ===');
  for (final agent in allAgents) {
    print('${agent.displayName}:');
    print(agent.greeting);
    print('');
  }

  // ============================================================================
  // EXAMPLE 6: Integration with chat UI
  // ============================================================================

  // In your chat widget:
  void onUserMessage(String message) async {
    // 1. Check if it's a voice command
    if (isVoiceCommand(message)) {
      final response = await memoryManager.processVoiceCommand(message);
      displayMessage(response, isSystem: true);
      return;
    }

    // 2. Route to appropriate agent
    final response = await agentFactory.routeMessage(message);

    // 3. Display response with agent info
    displayMessage(
      response.message,
      agentName: response.agentName,
      agentType: response.agentType,
    );
  }

  bool isVoiceCommand(String message) {
    return message.toLowerCase().contains('وزني') ||
        message.toLowerCase().contains('خدت موونجارو') ||
        message.toLowerCase().contains('أكلت');
  }

  void displayMessage(
    String message, {
    String? agentName,
    AgentType? agentType,
    bool isSystem = false,
  }) {
    // Your UI code here
    // Show message with agent emoji and name
  }

  // Clean up
  await db.close();
}

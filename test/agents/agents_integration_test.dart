import 'package:flutter_test/flutter_test.dart';
import 'package:health_keeper/core/data/database/database.dart';
import 'package:health_keeper/core/agents/services/agent_factory.dart';
import 'package:health_keeper/core/agents/router/agent_router.dart';
import 'package:health_keeper/core/services/gemini_coach_service.dart';
import 'package:talker/talker.dart';

void main() {
  late AppDatabase db;
  late GeminiCoachService geminiService;
  late AgentFactory agentFactory;

  setUp(() {
    db = AppDatabase();
    geminiService = GeminiCoachServiceImpl(talker: Talker());
    agentFactory = AgentFactory(
      db: db,
      geminiService: geminiService,
    );
  });

  tearDown(() async {
    await db.close();
  });

  group('Agent Router Tests', () {
    test('Routes fitness queries to FitnessAgent', () {
      expect(
        AgentRouter.detectIntent('إيه أحسن تمرين النهاردة؟'),
        AgentType.fitness,
      );
      expect(
        AgentRouter.detectIntent('workout plan for today'),
        AgentType.fitness,
      );
    });

    test('Routes nutrition queries to NutritionAgent', () {
      expect(
        AgentRouter.detectIntent('اقترحلي وجبة غدا'),
        AgentType.nutrition,
      );
      expect(
        AgentRouter.detectIntent('how many calories should I eat'),
        AgentType.nutrition,
      );
    });

    test('Routes health queries to HealthAgent', () {
      expect(
        AgentRouter.detectIntent('إيه حالتي الصحية النهاردة؟'),
        AgentType.health,
      );
      expect(
        AgentRouter.detectIntent('when should I take mounjaro'),
        AgentType.health,
      );
    });

    test('Routes general queries to GeneralAgent', () {
      expect(
        AgentRouter.detectIntent('إيه خطتي للأسبوع؟'),
        AgentType.general,
      );
      expect(
        AgentRouter.detectIntent('مرحبا'),
        AgentType.general,
      );
    });
  });

  group('Agent Factory Tests', () {
    test('Can create all 4 agents', () {
      final fitness = agentFactory.getAgentById('fitness');
      final nutrition = agentFactory.getAgentById('nutrition');
      final health = agentFactory.getAgentById('health');
      final general = agentFactory.getAgentById('general');

      expect(fitness, isNotNull);
      expect(nutrition, isNotNull);
      expect(health, isNotNull);
      expect(general, isNotNull);
    });

    test('Agent display names are correct', () {
      final agents = agentFactory.getAllAgents();

      expect(agents.length, 4);
      expect(agents.any((a) => a.displayName.contains('🏋️')), true);
      expect(agents.any((a) => a.displayName.contains('🍽️')), true);
      expect(agents.any((a) => a.displayName.contains('🩺')), true);
      expect(agents.any((a) => a.displayName.contains('🤖')), true);
    });
  });

  group('Agent Integration Tests', () {
    test('Can route and get response (integration)', () async {
      // This test will call real Gemini API if GEMINI_API_KEY is set
      // Skip if no API key
      if (!geminiService._isInitialized) {
        print('⚠️  Skipping integration test - no GEMINI_API_KEY');
        return;
      }

      final response = await agentFactory.routeMessage('مرحبا');

      expect(response, isNotNull);
      expect(response.agentType, AgentType.general);
      expect(response.message, isNotEmpty);
      print('✅ Response: ${response.message}');
    }, skip: 'Requires GEMINI_API_KEY and real API call');
  });
}

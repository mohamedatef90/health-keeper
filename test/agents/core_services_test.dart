import 'package:flutter_test/flutter_test.dart';
import 'package:health_keeper/core/data/database/database.dart';
import 'package:health_keeper/core/agents/context/shared_context_builder.dart';
import 'package:health_keeper/core/agents/router/agent_router.dart';
import 'package:health_keeper/core/agents/memory/memory_manager.dart';

void main() {
  late AppDatabase db;
  late SharedContextBuilder contextBuilder;
  late MemoryManager memoryManager;

  setUp(() {
    db = AppDatabase();
    contextBuilder = SharedContextBuilder(db);
    memoryManager = MemoryManager(db);
  });

  tearDown(() async {
    await db.close();
  });

  // ============================================================================
  // AGENT ROUTER TESTS
  // ============================================================================

  group('AgentRouter - Intent Detection', () {
    test('Detects fitness intent (Arabic)', () {
      expect(
        AgentRouter.detectIntent('إيه أحسن تمرين النهاردة؟'),
        AgentType.fitness,
      );
      expect(
        AgentRouter.detectIntent('عايز أروح الجيم'),
        AgentType.fitness,
      );
      expect(
        AgentRouter.detectIntent('تمرين قوة ولا كارديو؟'),
        AgentType.fitness,
      );
    });

    test('Detects fitness intent (English)', () {
      expect(
        AgentRouter.detectIntent('workout plan for today'),
        AgentType.fitness,
      );
      expect(
        AgentRouter.detectIntent('should I do cardio or strength?'),
        AgentType.fitness,
      );
    });

    test('Detects nutrition intent (Arabic)', () {
      expect(
        AgentRouter.detectIntent('اقترحلي وجبة غدا'),
        AgentType.nutrition,
      );
      expect(
        AgentRouter.detectIntent('كام سعرة أكلت النهاردة؟'),
        AgentType.nutrition,
      );
      expect(
        AgentRouter.detectIntent('محتاج كام جرام بروتين؟'),
        AgentType.nutrition,
      );
    });

    test('Detects nutrition intent (English)', () {
      expect(
        AgentRouter.detectIntent('how many calories should I eat'),
        AgentType.nutrition,
      );
      expect(
        AgentRouter.detectIntent('meal plan for weight loss'),
        AgentType.nutrition,
      );
    });

    test('Detects health intent (Arabic)', () {
      expect(
        AgentRouter.detectIntent('إيه حالتي الصحية النهاردة؟'),
        AgentType.health,
      );
      expect(
        AgentRouter.detectIntent('امتى أخد موونجارو؟'),
        AgentType.health,
      );
      expect(
        AgentRouter.detectIntent('HRV بتاعي واطي ليه؟'),
        AgentType.health,
      );
    });

    test('Detects health intent (English)', () {
      expect(
        AgentRouter.detectIntent('when should I take mounjaro'),
        AgentType.health,
      );
      expect(
        AgentRouter.detectIntent('my sleep quality is bad'),
        AgentType.health,
      );
    });

    test('Defaults to general for ambiguous queries', () {
      expect(
        AgentRouter.detectIntent('إيه خطتي للأسبوع؟'),
        AgentType.general,
      );
      expect(
        AgentRouter.detectIntent('عامل إيه؟'),
        AgentType.general,
      );
      expect(
        AgentRouter.detectIntent('hello'),
        AgentType.general,
      );
    });

    test('General orchestrates multi-domain queries', () {
      final agents = AgentRouter.detectMultiIntent(
        'خطة الأسبوع للأكل والرياضة',
      );
      expect(agents, contains(AgentType.general));
    });
  });

  // ============================================================================
  // MEMORY MANAGER TESTS
  // ============================================================================

  group('MemoryManager - Voice Commands', () {
    test('Processes weight command with value', () async {
      final response = await memoryManager.processVoiceCommand('وزني 75.3');
      
      expect(response, contains('75.3'));
      expect(response, contains('كيلو'));

      // Verify it was saved to database
      final context = await db.getTodayAgentContext();
      expect(context?.weight, 75.3);
    });

    test('Processes weight command - different formats', () async {
      await memoryManager.processVoiceCommand('وزني 75');
      expect((await db.getTodayAgentContext())?.weight, 75.0);

      await memoryManager.processVoiceCommand('weight 76.5 kg');
      expect((await db.getTodayAgentContext())?.weight, 76.5);
    });

    test('Processes Mounjaro command', () async {
      final response = await memoryManager.processVoiceCommand('خدت موونجارو');
      
      expect(response, contains('موونجارو'));
      expect(response, contains('سجلت'));

      // Verify it was saved
      final context = await db.getTodayAgentContext();
      expect(context?.mounjaroTaken, true);
    });

    test('Rejects unknown commands gracefully', () async {
      final response = await memoryManager.processVoiceCommand('random text');
      
      expect(response, contains('معرفتش'));
      expect(response, contains('جرب'));
    });
  });

  // ============================================================================
  // SHARED CONTEXT BUILDER TESTS
  // ============================================================================

  group('SharedContextBuilder - Context Loading', () {
    test('Builds context for fitness agent', () async {
      final context = await contextBuilder.buildContext(
        agentType: 'fitness',
      );

      expect(context, isNotNull);
      expect(context.protocolRules, isNotNull);
      expect(context.recentMeals, isNotNull);
      expect(context.recentWorkouts, isNotNull);
    });

    test('Builds context for nutrition agent', () async {
      final context = await contextBuilder.buildContext(
        agentType: 'nutrition',
      );

      expect(context, isNotNull);
      expect(context.protocolRules, isNotNull);
    });

    test('Builds context with custom lookback', () async {
      final context = await contextBuilder.buildContext(
        agentType: 'general',
        mealsLookbackDays: 3,
        workoutsLookbackDays: 5,
      );

      expect(context, isNotNull);
    });

    test('Builds context summary', () async {
      final context = await contextBuilder.buildContext(
        agentType: 'general',
      );

      final summary = context.buildSummary();
      expect(summary, isNotEmpty);
    });

    test('Builds context snapshot (JSON)', () async {
      final context = await contextBuilder.buildContext(
        agentType: 'fitness',
      );

      final snapshot = context.buildSnapshot();
      expect(snapshot, isA<Map<String, dynamic>>());
      expect(snapshot.containsKey('date'), true);
    });

    test('Builds quick context for notifications', () async {
      final quickContext = await contextBuilder.buildQuickContext(
        DateTime.now(),
      );

      expect(quickContext, isA<Map<String, dynamic>>());
      expect(quickContext.containsKey('weight'), true);
      expect(quickContext.containsKey('recovery'), true);
    });
  });

  // ============================================================================
  // INTEGRATION TESTS
  // ============================================================================

  group('Integration - Full Flow', () {
    test('Weight command updates context visible to all agents', () async {
      // User says: "وزني 75.3"
      await memoryManager.processVoiceCommand('وزني 75.3');

      // All agents should see the new weight
      final fitnessContext = await contextBuilder.buildContext(
        agentType: 'fitness',
      );
      final nutritionContext = await contextBuilder.buildContext(
        agentType: 'nutrition',
      );

      expect(fitnessContext.today?.weight, 75.3);
      expect(nutritionContext.today?.weight, 75.3);
    });

    test('Intent detection routes to correct agent', () {
      final queries = {
        'إيه أحسن تمرين؟': AgentType.fitness,
        'اقترحلي وجبة': AgentType.nutrition,
        'امتى أخد موونجارو': AgentType.health,
        'خطة الأسبوع': AgentType.general,
      };

      queries.forEach((query, expectedAgent) {
        expect(AgentRouter.detectIntent(query), expectedAgent);
      });
    });
  });
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talker/talker.dart';

import '../data/database/database.dart';
import '../services/activity_recommendation_service.dart';
import '../services/diet_suggestion_service.dart';
import '../services/gemini_coach_service.dart';
import '../services/healthkit_service.dart';
import '../services/notification_service.dart';
import '../services/photo_service.dart';
import '../services/workout_detection_service.dart';
import '../services/agent_sync_service.dart';
import '../services/agent_chat_adapter.dart';
import '../agents/seed_on_first_launch.dart';
import '../agents/services/agent_factory.dart';

// Re-export strain and recovery providers for convenience
export 'strain_provider.dart';
export 'recovery_provider.dart';
export 'health_monitor_provider.dart';
export 'master_plan_provider.dart';
export 'ai_brain_provider.dart';
export 'whoop_features_provider.dart';

/// Global logger instance
final talkerProvider = Provider<Talker>((ref) {
  return Talker(
    settings: TalkerSettings(
      enabled: true,
      useHistory: true,
      maxHistoryItems: 1000,
    ),
  );
});

/// Database provider
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

/// Gemini AI Coach Service provider
final geminiCoachServiceProvider = Provider<GeminiCoachService>((ref) {
  final talker = ref.watch(talkerProvider);
  return GeminiCoachServiceImpl(talker: talker);
});

/// HealthKit Service provider
final healthKitServiceProvider = Provider<HealthKitService>((ref) {
  final talker = ref.watch(talkerProvider);
  return HealthKitServiceImpl(talker: talker);
});

/// Notification Service provider
final notificationServiceProvider = Provider<NotificationService>((ref) {
  final talker = ref.watch(talkerProvider);
  return NotificationServiceImpl(talker: talker);
});

/// Photo Service provider
final photoServiceProvider = Provider<PhotoService>((ref) {
  final talker = ref.watch(talkerProvider);
  return PhotoServiceImpl(talker: talker);
});

/// App initialization state
final appInitializationProvider = FutureProvider<bool>((ref) async {
  final notificationService = ref.read(notificationServiceProvider);
  await notificationService.initialize();

  // Seed protocol rules on first launch
  final db = ref.read(databaseProvider);
  await FirstLaunchSeeder.seedIfNeeded(db);

  // Sync Apple Health data to Agent system (daily)
  final agentSync = ref.read(agentSyncServiceProvider);
  await agentSync.syncTodayContext();

  // Additional initialization as needed
  return true;
});

/// Diet Suggestion Service provider
final dietSuggestionServiceProvider = Provider<DietSuggestionService>((ref) {
  final geminiService = ref.watch(geminiCoachServiceProvider);
  final talker = ref.watch(talkerProvider);
  return DietSuggestionServiceImpl(
    geminiService: geminiService,
    talker: talker,
  );
});

/// Activity Recommendation Service provider
final activityRecommendationServiceProvider =
    Provider<ActivityRecommendationService>((ref) {
  final geminiService = ref.watch(geminiCoachServiceProvider);
  final talker = ref.watch(talkerProvider);
  return ActivityRecommendationServiceImpl(
    geminiService: geminiService,
    talker: talker,
  );
});

/// Workout Detection Service provider
final workoutDetectionServiceProvider = Provider<WorkoutDetectionService>((ref) {
  final geminiService = ref.watch(geminiCoachServiceProvider);
  final healthKitService = ref.watch(healthKitServiceProvider);
  final talker = ref.watch(talkerProvider);
  return WorkoutDetectionServiceImpl(
    geminiService: geminiService,
    healthKitService: healthKitService,
    talker: talker,
  );
});

// ============================================================================
// AGENT SYSTEM PROVIDERS
// ============================================================================

/// Agent Sync Service - bridges Apple Health → Agent system
final agentSyncServiceProvider = Provider<AgentSyncService>((ref) {
  final db = ref.watch(databaseProvider);
  final healthKit = ref.watch(healthKitServiceProvider);
  final talker = ref.watch(talkerProvider);
  return AgentSyncService(
    database: db,
    healthKit: healthKit,
    talker: talker,
  );
});

/// Agent Factory - creates and manages AI agents
final agentFactoryProvider = Provider<AgentFactory>((ref) {
  final db = ref.watch(databaseProvider);
  final geminiService = ref.watch(geminiCoachServiceProvider);
  return AgentFactory(
    db: db,
    geminiService: geminiService,
  );
});

/// Agent Chat Adapter - bridges Agent system to Chat UI
final agentChatAdapterProvider = Provider<AgentChatAdapter>((ref) {
  final agentFactory = ref.watch(agentFactoryProvider);
  return AgentChatAdapter(
    agentFactory: agentFactory,
  );
});

/// Agent Sync Status - watch sync status for today
final agentSyncStatusProvider = FutureProvider<AgentSyncStatus>((ref) async {
  final syncService = ref.watch(agentSyncServiceProvider);
  return await syncService.getSyncStatus();
});

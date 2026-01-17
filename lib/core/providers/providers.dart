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

// Re-export strain and recovery providers for convenience
export 'strain_provider.dart';
export 'recovery_provider.dart';
export 'health_monitor_provider.dart';

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

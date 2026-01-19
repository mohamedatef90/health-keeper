import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/entities/daily_outlook.dart' as outlook_entity;
import '../domain/entities/day_review.dart' as review_entity;
import '../domain/entities/healthspan.dart' as healthspan_entity;
import '../domain/entities/monthly_assessment.dart' as assessment_entity;
import '../domain/entities/personal_record.dart' as record_entity;
import '../domain/entities/sleep_need.dart' as sleep_entity;
import '../domain/entities/strain_target.dart' as strain_entity;
import '../domain/entities/streak.dart' as streak_entity;
import '../services/strain_coach_service.dart';
import '../services/streak_service.dart';
import 'providers.dart';

// ============================================================================
// SERVICE PROVIDERS
// ============================================================================

/// Strain Coach Service provider
final strainCoachServiceProvider = Provider<StrainCoachService>((ref) {
  final talker = ref.watch(talkerProvider);
  return StrainCoachServiceImpl(talker: talker);
});

/// Streak Service provider
final streakServiceProvider = Provider<StreakService>((ref) {
  final db = ref.watch(databaseProvider);
  return StreakServiceImpl(db);
});

// ============================================================================
// STRAIN TARGET PROVIDERS
// ============================================================================

/// Today's strain target provider
final todayStrainTargetProvider = FutureProvider<strain_entity.StrainTarget?>((ref) async {
  final service = ref.watch(strainCoachServiceProvider);

  // Get today's recovery score from the database
  final db = ref.watch(databaseProvider);
  final today = DateTime.now();
  final startOfDay = DateTime(today.year, today.month, today.day);

  // Get the latest recovery score
  final recoveryScores = await db.select(db.recoveryScores).get();
  final todayRecovery = recoveryScores.where((r) {
    final date = r.date;
    return date.year == startOfDay.year &&
        date.month == startOfDay.month &&
        date.day == startOfDay.day;
  }).toList();

  if (todayRecovery.isEmpty) return null;

  final recoveryScore = todayRecovery.first.score;

  // Get current strain
  final strainScores = await db.select(db.strainScores).get();
  final todayStrain = strainScores.where((s) {
    final date = s.date;
    return date.year == startOfDay.year &&
        date.month == startOfDay.month &&
        date.day == startOfDay.day;
  }).toList();

  final currentStrain = todayStrain.isNotEmpty ? todayStrain.first.score : 0.0;

  return service.getStrainTarget(
    recoveryScore: recoveryScore,
    currentStrain: currentStrain,
  );
});

/// Strain target history provider (last 7 days)
final strainTargetHistoryProvider = FutureProvider<List<strain_entity.StrainTarget>>((ref) async {
  final db = ref.watch(databaseProvider);
  final end = DateTime.now();
  final start = end.subtract(const Duration(days: 7));

  final targets = await db.getStrainTargetsInRange(start, end);
  return targets.map((t) => strain_entity.StrainTarget(
    id: t.id,
    date: t.date,
    calculatedAt: t.calculatedAt,
    recoveryScore: t.recoveryScore,
    minStrain: t.minStrain,
    maxStrain: t.maxStrain,
    optimalStrain: t.optimalStrain,
    currentStrain: t.currentStrain,
    targetMet: t.targetMet,
    suggestedIntensity: strain_entity.StrainIntensityExtension.fromRecovery(t.recoveryScore),
    recommendation: t.recommendation,
    recommendationAr: t.recommendationAr,
    guidance: t.guidance,
    guidanceAr: t.guidanceAr,
  )).toList();
});

// ============================================================================
// SLEEP NEED PROVIDERS
// ============================================================================

/// Today's sleep need provider
final todaySleepNeedProvider = FutureProvider<sleep_entity.SleepNeed?>((ref) async {
  final service = ref.watch(strainCoachServiceProvider);
  final db = ref.watch(databaseProvider);

  // Get recent sleep data to calculate debt
  final end = DateTime.now();
  final start = end.subtract(const Duration(days: 7));

  final sleepNeeds = await db.getSleepNeedsInRange(start, end);

  // Calculate sleep debt from recent records
  double sleepDebt = 0;
  for (final need in sleepNeeds) {
    if (need.actualSleep != null) {
      final diff = need.totalNeed - need.actualSleep!;
      if (diff > 0) {
        sleepDebt += diff;
      }
    }
  }

  // Get today's strain
  final today = DateTime.now();
  final startOfDay = DateTime(today.year, today.month, today.day);

  final strainScores = await db.select(db.strainScores).get();
  final todayStrain = strainScores.where((s) {
    final date = s.date;
    return date.year == startOfDay.year &&
        date.month == startOfDay.month &&
        date.day == startOfDay.day;
  }).toList();

  final strainScore = todayStrain.isNotEmpty ? todayStrain.first.score : 0.0;

  return service.calculateSleepNeed(
    strainScore: strainScore,
    sleepDebt: sleepDebt,
  );
});

// ============================================================================
// STREAK PROVIDERS
// ============================================================================

/// All streaks provider
final allStreaksProvider = FutureProvider<streak_entity.StreakCollection>((ref) async {
  final service = ref.watch(streakServiceProvider);
  return service.getAllStreaks();
});

/// Active streaks provider
final activeStreaksProvider = FutureProvider<List<streak_entity.Streak>>((ref) async {
  final service = ref.watch(streakServiceProvider);
  return service.getActiveStreaks();
});

/// Streak stats provider
final streakStatsProvider = FutureProvider<StreakStats>((ref) async {
  final service = ref.watch(streakServiceProvider);
  return service.getStreakStats();
});

/// Specific streak by type provider
final streakByTypeProvider = FutureProvider.family<streak_entity.Streak?, streak_entity.StreakType>((ref, type) async {
  final service = ref.watch(streakServiceProvider);
  return service.getStreakByType(type);
});

// ============================================================================
// PERSONAL RECORDS PROVIDERS
// ============================================================================

/// All personal records provider
final allPersonalRecordsProvider = FutureProvider<List<record_entity.PersonalRecord>>((ref) async {
  final db = ref.watch(databaseProvider);
  final records = await db.getAllPersonalRecords();

  return records.map((r) => record_entity.PersonalRecord(
    id: r.id,
    category: record_entity.RecordCategory.values.firstWhere(
      (c) => c.name == r.category,
      orElse: () => record_entity.RecordCategory.recovery,
    ),
    metric: record_entity.RecordMetric.values.firstWhere(
      (m) => m.name == r.metric,
      orElse: () => record_entity.RecordMetric.highestRecovery,
    ),
    value: r.value,
    formattedValue: r.formattedValue,
    achievedAt: r.achievedAt,
    previousValue: r.previousValue,
    previousAchievedAt: r.previousAchievedAt,
    isAllTime: r.isAllTime,
    timesImproved: r.timesImproved,
    context: r.context,
  )).toList();
});

/// Recent records provider (last 7 days)
final recentRecordsProvider = FutureProvider<List<record_entity.PersonalRecord>>((ref) async {
  final db = ref.watch(databaseProvider);
  final records = await db.getRecentRecords(days: 7);

  return records.map((r) => record_entity.PersonalRecord(
    id: r.id,
    category: record_entity.RecordCategory.values.firstWhere(
      (c) => c.name == r.category,
      orElse: () => record_entity.RecordCategory.recovery,
    ),
    metric: record_entity.RecordMetric.values.firstWhere(
      (m) => m.name == r.metric,
      orElse: () => record_entity.RecordMetric.highestRecovery,
    ),
    value: r.value,
    formattedValue: r.formattedValue,
    achievedAt: r.achievedAt,
    previousValue: r.previousValue,
    previousAchievedAt: r.previousAchievedAt,
    isAllTime: r.isAllTime,
    timesImproved: r.timesImproved,
    context: r.context,
  )).toList();
});

/// Records by category provider
final recordsByCategoryProvider = FutureProvider.family<List<record_entity.PersonalRecord>, record_entity.RecordCategory>((ref, category) async {
  final db = ref.watch(databaseProvider);
  final records = await db.getPersonalRecordsByCategory(category.name);

  return records.map((r) => record_entity.PersonalRecord(
    id: r.id,
    category: record_entity.RecordCategory.values.firstWhere(
      (c) => c.name == r.category,
      orElse: () => record_entity.RecordCategory.recovery,
    ),
    metric: record_entity.RecordMetric.values.firstWhere(
      (m) => m.name == r.metric,
      orElse: () => record_entity.RecordMetric.highestRecovery,
    ),
    value: r.value,
    formattedValue: r.formattedValue,
    achievedAt: r.achievedAt,
    previousValue: r.previousValue,
    previousAchievedAt: r.previousAchievedAt,
    isAllTime: r.isAllTime,
    timesImproved: r.timesImproved,
    context: r.context,
  )).toList();
});

// ============================================================================
// HEALTHSPAN PROVIDERS
// ============================================================================

/// Latest healthspan record provider
final latestHealthspanProvider = FutureProvider<healthspan_entity.Healthspan?>((ref) async {
  final db = ref.watch(databaseProvider);
  final record = await db.getLatestHealthspanRecord();

  if (record == null) return null;

  // Parse factors from JSON - for now return a simplified healthspan
  return healthspan_entity.Healthspan(
    id: record.id,
    calculatedAt: record.calculatedAt,
    chronologicalAge: record.chronologicalAge,
    biologicalAge: record.biologicalAge,
    ageDifference: record.ageDifference,
    factors: healthspan_entity.HealthspanFactors(
      hrvAdjustment: record.hrvAdjustment,
      rhrAdjustment: record.rhrAdjustment,
      sleepAdjustment: record.sleepAdjustment,
      activityAdjustment: record.activityAdjustment,
      recoveryAdjustment: record.recoveryAdjustment,
    ),
    recommendations: [], // Would need to parse from JSON
    confidence: record.confidence,
  );
});

// ============================================================================
// MONTHLY ASSESSMENT PROVIDERS
// ============================================================================

/// Current month assessment provider
final currentMonthAssessmentProvider = FutureProvider<assessment_entity.MonthlyAssessment?>((ref) async {
  final db = ref.watch(databaseProvider);
  final assessment = await db.getCurrentMonthAssessment();

  if (assessment == null) return null;

  // This would need proper JSON parsing for all the nested objects
  // For now, returning null as this needs more complex mapping
  return null;
});

/// Monthly assessments history provider
final monthlyAssessmentsProvider = FutureProvider<List<assessment_entity.MonthlyAssessment>>((ref) async {
  // Would need proper JSON parsing
  return [];
});

// ============================================================================
// DAILY OUTLOOK PROVIDERS
// ============================================================================

/// Today's daily outlook provider
final todayDailyOutlookProvider = FutureProvider<outlook_entity.DailyOutlook?>((ref) async {
  final db = ref.watch(databaseProvider);
  final outlook = await db.getTodayDailyOutlook();

  if (outlook == null) return null;

  // Would need proper JSON parsing for all the nested objects
  return null;
});

// ============================================================================
// DAY REVIEW PROVIDERS
// ============================================================================

/// Today's day review provider
final todayDayReviewProvider = FutureProvider<review_entity.DayReview?>((ref) async {
  final db = ref.watch(databaseProvider);
  final review = await db.getTodayDayReview();

  if (review == null) return null;

  // Would need proper JSON parsing for all the nested objects
  return null;
});

// ============================================================================
// ALL-TIME STATS PROVIDERS
// ============================================================================

/// Latest all-time stats provider
final allTimeStatsProvider = FutureProvider<record_entity.AllTimeStats?>((ref) async {
  final db = ref.watch(databaseProvider);
  final stats = await db.getLatestAllTimeStats();

  if (stats == null) return null;

  return record_entity.AllTimeStats(
    userId: stats.userId,
    calculatedAt: stats.calculatedAt,
    totalDaysTracked: stats.totalDaysTracked,
    totalWorkouts: stats.totalWorkouts,
    totalMealsLogged: stats.totalMealsLogged,
    totalCaloriesBurned: stats.totalCaloriesBurned,
    totalSteps: stats.totalSteps,
    totalSleepHours: stats.totalSleepHours,
    avgRecovery: stats.avgRecovery,
    avgStrain: stats.avgStrain,
    bestWeekDate: stats.bestWeekDate,
    bestWeekScore: stats.bestWeekScore,
    bestMonthDate: stats.bestMonthDate,
    bestMonthScore: stats.bestMonthScore,
    records: record_entity.PersonalRecordCollection(
      userId: stats.userId,
      lastUpdated: stats.calculatedAt,
      records: [],
    ),
  );
});

import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables.dart';

part 'database.g.dart';

@DriftDatabase(tables: [
  UserProfiles,
  Protocols,
  ProtocolSnapshots,
  DailyLogs,
  MeasurementLogs,
  MealLogs,
  MealItems,
  WorkoutLogs,
  RecoveryMetricsTable,
  DailyBriefs,
  WeeklyReports,
  ProgressPhotos,
  AiFoodAnalyses,
  PhotoComparisons,
  MealTemplates,
  JournalEntries,
  CustomBehaviors,
  StrainScores,
  RecoveryScores,
  Medications,
  Supplements,
  ScheduledWorkouts,
  // Coach Chat tables (v4)
  ChatThreads,
  ChatMessages,
  // Coach tables (v5)
  Exercises,
  WorkoutTemplatesTable,
  GymSessions,
  // Weekly Plans tables (v6)
  WeeklyMealPlansTable,
  WeeklyWorkoutPlansTable,
  MasterPlansTable,
  // AI Brain tables (v7)
  AiBrainDecisions,
  UserAutonomySettingsTable,
  AiBrainContextCache,
  PlanAdjustments,
  HealthAnomalies,
  // WHOOP-inspired features tables (v8)
  StrainTargets,
  SleepNeeds,
  Streaks,
  PersonalRecords,
  MonthlyAssessments,
  HealthspanRecords,
  DailyOutlooks,
  DayReviews,
  AllTimeStats,
  // Multi-Agent System tables (v9)
  ProtocolRules,
  AgentContexts,
  AgentConversations,
  HealthMetricsTimeSeries,
  MealsDetailed,
  WorkoutsDetailed,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 9;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // Migration from v1 to v2: Add journal, strain, and recovery tables
        if (from < 2) {
          await m.createTable(journalEntries);
          await m.createTable(customBehaviors);
          await m.createTable(strainScores);
          await m.createTable(recoveryScores);
        }
        // Migration from v2 to v3: Add medications, supplements, scheduled workouts tables
        if (from < 3) {
          await m.createTable(medications);
          await m.createTable(supplements);
          await m.createTable(scheduledWorkouts);
        }
        // Migration from v3 to v4: Add coach chat tables
        if (from < 4) {
          await m.createTable(chatThreads);
          await m.createTable(chatMessages);
        }
        // Migration from v4 to v5: Add coach tables (exercises, workout templates, gym sessions)
        if (from < 5) {
          await m.createTable(exercises);
          await m.createTable(workoutTemplatesTable);
          await m.createTable(gymSessions);
        }
        // Migration from v5 to v6: Add weekly plans tables (meal plans, workout plans, master plans)
        if (from < 6) {
          await m.createTable(weeklyMealPlansTable);
          await m.createTable(weeklyWorkoutPlansTable);
          await m.createTable(masterPlansTable);
        }
        // Migration from v6 to v7: Add AI Brain tables
        if (from < 7) {
          await m.createTable(aiBrainDecisions);
          await m.createTable(userAutonomySettingsTable);
          await m.createTable(aiBrainContextCache);
          await m.createTable(planAdjustments);
          await m.createTable(healthAnomalies);
        }
        // Migration from v7 to v8: Add WHOOP-inspired features tables
        if (from < 8) {
          await m.createTable(strainTargets);
          await m.createTable(sleepNeeds);
          await m.createTable(streaks);
          await m.createTable(personalRecords);
          await m.createTable(monthlyAssessments);
          await m.createTable(healthspanRecords);
          await m.createTable(dailyOutlooks);
          await m.createTable(dayReviews);
          await m.createTable(allTimeStats);
        }
        // Migration from v8 to v9: Add Multi-Agent System tables
        if (from < 9) {
          await m.createTable(protocolRules);
          await m.createTable(agentContexts);
          await m.createTable(agentConversations);
          await m.createTable(healthMetricsTimeSeries);
          await m.createTable(mealsDetailed);
          await m.createTable(workoutsDetailed);
        }
      },
      beforeOpen: (details) async {
        // Enable foreign keys
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }

  // User Profile Operations
  Future<UserProfile?> getUserProfile() async {
    return (select(userProfiles)..limit(1)).getSingleOrNull();
  }

  Future<int> insertUserProfile(UserProfilesCompanion profile) {
    return into(userProfiles).insert(profile);
  }

  Future<bool> updateUserProfile(UserProfilesCompanion profile) {
    return update(userProfiles).replace(profile);
  }

  // Protocol Operations
  Future<Protocol?> getProtocol(String userId) async {
    return (select(protocols)..where((p) => p.userId.equals(userId)))
        .getSingleOrNull();
  }

  Future<int> insertProtocol(ProtocolsCompanion protocol) {
    return into(protocols).insert(protocol);
  }

  Future<bool> updateProtocol(ProtocolsCompanion protocol) {
    return update(protocols).replace(protocol);
  }

  // Daily Log Operations
  Future<DailyLog?> getDailyLog(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return (select(dailyLogs)
          ..where((d) => d.date.isBiggerOrEqualValue(startOfDay))
          ..where((d) => d.date.isSmallerThanValue(endOfDay)))
        .getSingleOrNull();
  }

  Future<List<DailyLog>> getDailyLogsInRange(DateTime start, DateTime end) {
    return (select(dailyLogs)
          ..where((d) => d.date.isBiggerOrEqualValue(start))
          ..where((d) => d.date.isSmallerThanValue(end))
          ..orderBy([(d) => OrderingTerm.desc(d.date)]))
        .get();
  }

  Future<int> insertDailyLog(DailyLogsCompanion log) {
    return into(dailyLogs).insert(log);
  }

  Future<bool> updateDailyLog(DailyLogsCompanion log) {
    return update(dailyLogs).replace(log);
  }

  // Meal Log Operations
  Future<List<MealLog>> getMealLogsForDay(String dailyLogId) {
    return (select(mealLogs)
          ..where((m) => m.dailyLogId.equals(dailyLogId))
          ..orderBy([(m) => OrderingTerm.asc(m.time)]))
        .get();
  }

  Future<int> insertMealLog(MealLogsCompanion log) {
    return into(mealLogs).insert(log);
  }

  Future<List<MealItem>> getMealItems(String mealLogId) {
    return (select(mealItems)..where((m) => m.mealLogId.equals(mealLogId)))
        .get();
  }

  Future<int> insertMealItem(MealItemsCompanion item) {
    return into(mealItems).insert(item);
  }

  // Workout Log Operations
  Future<List<WorkoutLog>> getWorkoutLogsForDay(String dailyLogId) {
    return (select(workoutLogs)
          ..where((w) => w.dailyLogId.equals(dailyLogId))
          ..orderBy([(w) => OrderingTerm.desc(w.date)]))
        .get();
  }

  Future<int> insertWorkoutLog(WorkoutLogsCompanion log) {
    return into(workoutLogs).insert(log);
  }

  // Recovery Metrics Operations
  Future<RecoveryMetricsTableData?> getRecoveryMetrics(String dailyLogId) {
    return (select(recoveryMetricsTable)
          ..where((r) => r.dailyLogId.equals(dailyLogId)))
        .getSingleOrNull();
  }

  Future<int> insertRecoveryMetrics(RecoveryMetricsTableCompanion metrics) {
    return into(recoveryMetricsTable).insert(metrics);
  }

  // Daily Brief Operations
  Future<DailyBrief?> getDailyBrief(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return (select(dailyBriefs)
          ..where((d) => d.date.isBiggerOrEqualValue(startOfDay))
          ..where((d) => d.date.isSmallerThanValue(endOfDay)))
        .getSingleOrNull();
  }

  Future<int> insertDailyBrief(DailyBriefsCompanion brief) {
    return into(dailyBriefs).insert(brief);
  }

  // Weekly Report Operations
  Future<WeeklyReport?> getWeeklyReport(DateTime weekStart) {
    return (select(weeklyReports)
          ..where((w) => w.weekStartDate.equals(weekStart)))
        .getSingleOrNull();
  }

  Future<int> insertWeeklyReport(WeeklyReportsCompanion report) {
    return into(weeklyReports).insert(report);
  }

  // Progress Photo Operations
  Future<List<ProgressPhoto>> getProgressPhotos(String userId) {
    return (select(progressPhotos)
          ..where((p) => p.userId.equals(userId))
          ..orderBy([(p) => OrderingTerm.desc(p.date)]))
        .get();
  }

  Future<int> insertProgressPhoto(ProgressPhotosCompanion photo) {
    return into(progressPhotos).insert(photo);
  }

  // Meal Template Operations
  Future<List<MealTemplate>> getMealTemplates(String userId) {
    return (select(mealTemplates)
          ..where((t) => t.userId.equals(userId))
          ..orderBy([(t) => OrderingTerm.desc(t.usageCount)]))
        .get();
  }

  Future<int> insertMealTemplate(MealTemplatesCompanion template) {
    return into(mealTemplates).insert(template);
  }

  Future<void> incrementTemplateUsage(String templateId) async {
    // First get current count, then update
    final template = await (select(mealTemplates)
          ..where((t) => t.id.equals(templateId)))
        .getSingleOrNull();
    if (template != null) {
      await (update(mealTemplates)..where((t) => t.id.equals(templateId)))
          .write(
        MealTemplatesCompanion(
          usageCount: Value(template.usageCount + 1),
          lastUsedAt: Value(DateTime.now()),
        ),
      );
    }
  }

  // AI Food Analysis Operations
  Future<AiFoodAnalyse?> getAiFoodAnalysis(String mealLogId) {
    return (select(aiFoodAnalyses)
          ..where((a) => a.mealLogId.equals(mealLogId)))
        .getSingleOrNull();
  }

  Future<int> insertAiFoodAnalysis(AiFoodAnalysesCompanion analysis) {
    return into(aiFoodAnalyses).insert(analysis);
  }

  // Measurement Operations
  Future<MeasurementLog?> getMeasurementLog(String dailyLogId) {
    return (select(measurementLogs)
          ..where((m) => m.dailyLogId.equals(dailyLogId)))
        .getSingleOrNull();
  }

  Future<int> insertMeasurementLog(MeasurementLogsCompanion log) {
    return into(measurementLogs).insert(log);
  }

  Future<List<MeasurementLog>> getMeasurementsInRange(
      DateTime start, DateTime end) {
    return (select(measurementLogs)
          ..where((m) => m.date.isBiggerOrEqualValue(start))
          ..where((m) => m.date.isSmallerThanValue(end))
          ..orderBy([(m) => OrderingTerm.desc(m.date)]))
        .get();
  }

  // Medication Operations
  Future<List<Medication>> getMedicationsForProtocol(String protocolId) {
    return (select(medications)
          ..where((m) => m.protocolId.equals(protocolId))
          ..orderBy([(m) => OrderingTerm.asc(m.name)]))
        .get();
  }

  Future<int> insertMedication(MedicationsCompanion medication) {
    return into(medications).insert(medication);
  }

  Future<bool> updateMedication(MedicationsCompanion medication) {
    return update(medications).replace(medication);
  }

  Future<int> deleteMedication(String id) {
    return (delete(medications)..where((m) => m.id.equals(id))).go();
  }

  // Supplement Operations
  Future<List<Supplement>> getSupplementsForProtocol(String protocolId) {
    return (select(supplements)
          ..where((s) => s.protocolId.equals(protocolId))
          ..orderBy([(s) => OrderingTerm.asc(s.name)]))
        .get();
  }

  Future<int> insertSupplement(SupplementsCompanion supplement) {
    return into(supplements).insert(supplement);
  }

  Future<bool> updateSupplement(SupplementsCompanion supplement) {
    return update(supplements).replace(supplement);
  }

  Future<int> deleteSupplement(String id) {
    return (delete(supplements)..where((s) => s.id.equals(id))).go();
  }

  // Scheduled Workout Operations
  Future<List<ScheduledWorkout>> getScheduledWorkoutsForProtocol(String protocolId) {
    return (select(scheduledWorkouts)
          ..where((w) => w.protocolId.equals(protocolId))
          ..orderBy([(w) => OrderingTerm.asc(w.dayOfWeek)]))
        .get();
  }

  Future<List<ScheduledWorkout>> getScheduledWorkoutsForDay(String protocolId, int dayOfWeek) {
    return (select(scheduledWorkouts)
          ..where((w) => w.protocolId.equals(protocolId))
          ..where((w) => w.dayOfWeek.equals(dayOfWeek))
          ..where((w) => w.isActive.equals(true)))
        .get();
  }

  Future<int> insertScheduledWorkout(ScheduledWorkoutsCompanion workout) {
    return into(scheduledWorkouts).insert(workout);
  }

  Future<bool> updateScheduledWorkout(ScheduledWorkoutsCompanion workout) {
    return update(scheduledWorkouts).replace(workout);
  }

  Future<int> deleteScheduledWorkout(String id) {
    return (delete(scheduledWorkouts)..where((w) => w.id.equals(id))).go();
  }

  // Data export and deletion operations
  Future<void> deleteAllUserData() async {
    // Delete in reverse order of dependencies
    await delete(aiFoodAnalyses).go();
    await delete(photoComparisons).go();
    await delete(mealItems).go();
    await delete(mealLogs).go();
    await delete(workoutLogs).go();
    await delete(measurementLogs).go();
    await delete(recoveryMetricsTable).go();
    await delete(dailyBriefs).go();
    await delete(weeklyReports).go();
    await delete(progressPhotos).go();
    await delete(mealTemplates).go();
    await delete(journalEntries).go();
    await delete(customBehaviors).go();
    await delete(strainScores).go();
    await delete(recoveryScores).go();
    await delete(scheduledWorkouts).go();
    await delete(supplements).go();
    await delete(medications).go();
    await delete(protocolSnapshots).go();
    await delete(protocols).go();
    await delete(dailyLogs).go();
    await delete(userProfiles).go();
    // Coach tables
    await delete(gymSessions).go();
    await delete(workoutTemplatesTable).go();
    await delete(exercises).go();
    // Chat tables
    await delete(chatMessages).go();
    await delete(chatThreads).go();
  }

  // Get data summary for export
  Future<Map<String, int>> getDataSummary() async {
    return {
      'dailyLogs': (await select(dailyLogs).get()).length,
      'mealLogs': (await select(mealLogs).get()).length,
      'workoutLogs': (await select(workoutLogs).get()).length,
      'progressPhotos': (await select(progressPhotos).get()).length,
      'journalEntries': (await select(journalEntries).get()).length,
      'medications': (await select(medications).get()).length,
      'supplements': (await select(supplements).get()).length,
      'scheduledWorkouts': (await select(scheduledWorkouts).get()).length,
      'chatThreads': (await select(chatThreads).get()).length,
      'chatMessages': (await select(chatMessages).get()).length,
      'gymSessions': (await select(gymSessions).get()).length,
      'exercises': (await select(exercises).get()).length,
      'workoutTemplates': (await select(workoutTemplatesTable).get()).length,
    };
  }

  // ============================================================================
  // COACH CHAT OPERATIONS
  // ============================================================================

  // Chat Thread Operations
  Future<List<ChatThread>> getChatThreads({bool activeOnly = true}) {
    final query = select(chatThreads);
    if (activeOnly) {
      query.where((t) => t.isActive.equals(true));
    }
    query.orderBy([(t) => OrderingTerm.desc(t.lastMessageAt)]);
    return query.get();
  }

  Future<ChatThread?> getChatThread(String id) {
    return (select(chatThreads)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<ChatThread?> getActiveThreadByContext(String contextTag) {
    return (select(chatThreads)
          ..where((t) => t.contextTag.equals(contextTag))
          ..where((t) => t.isActive.equals(true))
          ..orderBy([(t) => OrderingTerm.desc(t.lastMessageAt)])
          ..limit(1))
        .getSingleOrNull();
  }

  Future<int> insertChatThread(ChatThreadsCompanion thread) {
    return into(chatThreads).insert(thread);
  }

  Future<bool> updateChatThread(ChatThreadsCompanion thread) {
    return update(chatThreads).replace(thread);
  }

  Future<void> updateThreadLastMessageAt(String threadId, DateTime time) {
    return (update(chatThreads)..where((t) => t.id.equals(threadId))).write(
      ChatThreadsCompanion(
        lastMessageAt: Value(time),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<int> deleteChatThread(String id) {
    return (delete(chatThreads)..where((t) => t.id.equals(id))).go();
  }

  // Chat Message Operations
  Future<List<ChatMessage>> getChatMessages(String threadId) {
    return (select(chatMessages)
          ..where((m) => m.threadId.equals(threadId))
          ..orderBy([(m) => OrderingTerm.asc(m.createdAt)]))
        .get();
  }

  Future<ChatMessage?> getLastMessage(String threadId) {
    return (select(chatMessages)
          ..where((m) => m.threadId.equals(threadId))
          ..orderBy([(m) => OrderingTerm.desc(m.createdAt)])
          ..limit(1))
        .getSingleOrNull();
  }

  Future<int> insertChatMessage(ChatMessagesCompanion message) {
    return into(chatMessages).insert(message);
  }

  Future<bool> updateChatMessage(ChatMessagesCompanion message) {
    return update(chatMessages).replace(message);
  }

  Future<int> deleteChatMessage(String id) {
    return (delete(chatMessages)..where((m) => m.id.equals(id))).go();
  }

  Future<void> deleteAllMessagesInThread(String threadId) {
    return (delete(chatMessages)..where((m) => m.threadId.equals(threadId)))
        .go();
  }

  Stream<List<ChatMessage>> watchChatMessages(String threadId) {
    return (select(chatMessages)
          ..where((m) => m.threadId.equals(threadId))
          ..orderBy([(m) => OrderingTerm.asc(m.createdAt)]))
        .watch();
  }

  // ============================================================================
  // WEEKLY MEAL PLANS OPERATIONS
  // ============================================================================

  Future<List<WeeklyMealPlansTableData>> getWeeklyMealPlans({int limit = 10}) {
    return (select(weeklyMealPlansTable)
          ..orderBy([(p) => OrderingTerm.desc(p.weekStartDate)])
          ..limit(limit))
        .get();
  }

  Future<WeeklyMealPlansTableData?> getWeeklyMealPlan(String id) {
    return (select(weeklyMealPlansTable)..where((p) => p.id.equals(id)))
        .getSingleOrNull();
  }

  Future<WeeklyMealPlansTableData?> getWeeklyMealPlanForWeek(
      DateTime weekStart) {
    final startOfWeek = DateTime(weekStart.year, weekStart.month, weekStart.day);
    final endOfWeek = startOfWeek.add(const Duration(days: 7));

    return (select(weeklyMealPlansTable)
          ..where((p) => p.weekStartDate.isBiggerOrEqualValue(startOfWeek))
          ..where((p) => p.weekStartDate.isSmallerThanValue(endOfWeek)))
        .getSingleOrNull();
  }

  Future<WeeklyMealPlansTableData?> getCurrentWeekMealPlan() {
    final now = DateTime.now();
    // Get Monday of current week
    final monday = now.subtract(Duration(days: now.weekday - 1));
    final startOfWeek = DateTime(monday.year, monday.month, monday.day);

    return getWeeklyMealPlanForWeek(startOfWeek);
  }

  Future<int> insertWeeklyMealPlan(WeeklyMealPlansTableCompanion plan) {
    return into(weeklyMealPlansTable).insert(plan);
  }

  Future<bool> updateWeeklyMealPlan(WeeklyMealPlansTableCompanion plan) {
    return update(weeklyMealPlansTable).replace(plan);
  }

  Future<void> updateWeeklyMealPlanApprovalStatus(
      String id, String status) {
    return (update(weeklyMealPlansTable)..where((p) => p.id.equals(id))).write(
      WeeklyMealPlansTableCompanion(
        approvalStatus: Value(status),
      ),
    );
  }

  Future<int> deleteWeeklyMealPlan(String id) {
    return (delete(weeklyMealPlansTable)..where((p) => p.id.equals(id))).go();
  }

  // ============================================================================
  // WEEKLY WORKOUT PLANS OPERATIONS
  // ============================================================================

  Future<List<WeeklyWorkoutPlansTableData>> getWeeklyWorkoutPlans(
      {int limit = 10}) {
    return (select(weeklyWorkoutPlansTable)
          ..orderBy([(p) => OrderingTerm.desc(p.weekStartDate)])
          ..limit(limit))
        .get();
  }

  Future<WeeklyWorkoutPlansTableData?> getWeeklyWorkoutPlan(String id) {
    return (select(weeklyWorkoutPlansTable)..where((p) => p.id.equals(id)))
        .getSingleOrNull();
  }

  Future<WeeklyWorkoutPlansTableData?> getWeeklyWorkoutPlanForWeek(
      DateTime weekStart) {
    final startOfWeek =
        DateTime(weekStart.year, weekStart.month, weekStart.day);
    final endOfWeek = startOfWeek.add(const Duration(days: 7));

    return (select(weeklyWorkoutPlansTable)
          ..where((p) => p.weekStartDate.isBiggerOrEqualValue(startOfWeek))
          ..where((p) => p.weekStartDate.isSmallerThanValue(endOfWeek)))
        .getSingleOrNull();
  }

  Future<WeeklyWorkoutPlansTableData?> getCurrentWeekWorkoutPlan() {
    final now = DateTime.now();
    // Get Monday of current week
    final monday = now.subtract(Duration(days: now.weekday - 1));
    final startOfWeek = DateTime(monday.year, monday.month, monday.day);

    return getWeeklyWorkoutPlanForWeek(startOfWeek);
  }

  Future<int> insertWeeklyWorkoutPlan(WeeklyWorkoutPlansTableCompanion plan) {
    return into(weeklyWorkoutPlansTable).insert(plan);
  }

  Future<bool> updateWeeklyWorkoutPlan(WeeklyWorkoutPlansTableCompanion plan) {
    return update(weeklyWorkoutPlansTable).replace(plan);
  }

  Future<void> updateWeeklyWorkoutPlanApprovalStatus(
      String id, String status) {
    return (update(weeklyWorkoutPlansTable)..where((p) => p.id.equals(id)))
        .write(
      WeeklyWorkoutPlansTableCompanion(
        approvalStatus: Value(status),
      ),
    );
  }

  Future<int> deleteWeeklyWorkoutPlan(String id) {
    return (delete(weeklyWorkoutPlansTable)..where((p) => p.id.equals(id)))
        .go();
  }

  // ============================================================================
  // MASTER PLANS OPERATIONS
  // ============================================================================

  Future<List<MasterPlansTableData>> getMasterPlans({int limit = 10}) {
    return (select(masterPlansTable)
          ..orderBy([(p) => OrderingTerm.desc(p.weekStartDate)])
          ..limit(limit))
        .get();
  }

  Future<MasterPlansTableData?> getMasterPlan(String id) {
    return (select(masterPlansTable)..where((p) => p.id.equals(id)))
        .getSingleOrNull();
  }

  Future<MasterPlansTableData?> getMasterPlanForWeek(DateTime weekStart) {
    final startOfWeek =
        DateTime(weekStart.year, weekStart.month, weekStart.day);
    final endOfWeek = startOfWeek.add(const Duration(days: 7));

    return (select(masterPlansTable)
          ..where((p) => p.weekStartDate.isBiggerOrEqualValue(startOfWeek))
          ..where((p) => p.weekStartDate.isSmallerThanValue(endOfWeek)))
        .getSingleOrNull();
  }

  Future<MasterPlansTableData?> getCurrentWeekMasterPlan() {
    final now = DateTime.now();
    // Get Monday of current week
    final monday = now.subtract(Duration(days: now.weekday - 1));
    final startOfWeek = DateTime(monday.year, monday.month, monday.day);

    return getMasterPlanForWeek(startOfWeek);
  }

  Future<MasterPlansTableData?> getActiveMasterPlan() {
    return (select(masterPlansTable)
          ..where((p) => p.status.equals('active'))
          ..orderBy([(p) => OrderingTerm.desc(p.weekStartDate)])
          ..limit(1))
        .getSingleOrNull();
  }

  Future<int> insertMasterPlan(MasterPlansTableCompanion plan) {
    return into(masterPlansTable).insert(plan);
  }

  Future<bool> updateMasterPlan(MasterPlansTableCompanion plan) {
    return update(masterPlansTable).replace(plan);
  }

  Future<void> updateMasterPlanStatus(String id, String status) {
    return (update(masterPlansTable)..where((p) => p.id.equals(id))).write(
      MasterPlansTableCompanion(
        status: Value(status),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> linkMealPlanToMaster(String masterPlanId, String mealPlanId) {
    return (update(masterPlansTable)..where((p) => p.id.equals(masterPlanId)))
        .write(
      MasterPlansTableCompanion(
        weeklyMealPlanId: Value(mealPlanId),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> linkWorkoutPlanToMaster(
      String masterPlanId, String workoutPlanId) {
    return (update(masterPlansTable)..where((p) => p.id.equals(masterPlanId)))
        .write(
      MasterPlansTableCompanion(
        weeklyWorkoutPlanId: Value(workoutPlanId),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<int> deleteMasterPlan(String id) {
    return (delete(masterPlansTable)..where((p) => p.id.equals(id))).go();
  }

  // ============================================================================
  // AI BRAIN DECISIONS OPERATIONS
  // ============================================================================

  Future<List<AiBrainDecision>> getAiBrainDecisions({
    String? status,
    int limit = 50,
  }) {
    final query = select(aiBrainDecisions);
    if (status != null) {
      query.where((d) => d.status.equals(status));
    }
    query.orderBy([(d) => OrderingTerm.desc(d.createdAt)]);
    query.limit(limit);
    return query.get();
  }

  Future<List<AiBrainDecision>> getPendingDecisions() {
    return (select(aiBrainDecisions)
          ..where((d) => d.status.equals('pending') | d.status.equals('awaiting_approval'))
          ..orderBy([(d) => OrderingTerm.desc(d.createdAt)]))
        .get();
  }

  Future<AiBrainDecision?> getAiBrainDecision(String id) {
    return (select(aiBrainDecisions)..where((d) => d.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> insertAiBrainDecision(AiBrainDecisionsCompanion decision) {
    return into(aiBrainDecisions).insert(decision);
  }

  Future<bool> updateAiBrainDecision(AiBrainDecisionsCompanion decision) {
    return update(aiBrainDecisions).replace(decision);
  }

  Future<void> updateAiBrainDecisionStatus(String id, String status, {DateTime? executedAt}) {
    return (update(aiBrainDecisions)..where((d) => d.id.equals(id))).write(
      AiBrainDecisionsCompanion(
        status: Value(status),
        executedAt: executedAt != null ? Value(executedAt) : const Value.absent(),
      ),
    );
  }

  Future<int> deleteAiBrainDecision(String id) {
    return (delete(aiBrainDecisions)..where((d) => d.id.equals(id))).go();
  }

  // ============================================================================
  // USER AUTONOMY SETTINGS OPERATIONS
  // ============================================================================

  Future<UserAutonomySettingsTableData?> getUserAutonomySettings() {
    return (select(userAutonomySettingsTable)..limit(1)).getSingleOrNull();
  }

  Future<int> insertUserAutonomySettings(UserAutonomySettingsTableCompanion settings) {
    return into(userAutonomySettingsTable).insert(settings);
  }

  Future<bool> updateUserAutonomySettings(UserAutonomySettingsTableCompanion settings) {
    return update(userAutonomySettingsTable).replace(settings);
  }

  // ============================================================================
  // AI BRAIN CONTEXT CACHE OPERATIONS
  // ============================================================================

  Future<AiBrainContextCacheData?> getAiBrainContextCache() {
    return (select(aiBrainContextCache)
          ..orderBy([(c) => OrderingTerm.desc(c.generatedAt)])
          ..limit(1))
        .getSingleOrNull();
  }

  Future<int> insertAiBrainContextCache(AiBrainContextCacheCompanion cache) {
    return into(aiBrainContextCache).insert(cache);
  }

  Future<void> clearAiBrainContextCache() {
    return delete(aiBrainContextCache).go();
  }

  // ============================================================================
  // PLAN ADJUSTMENTS OPERATIONS
  // ============================================================================

  Future<List<PlanAdjustment>> getPlanAdjustments({
    String? status,
    String? masterPlanId,
    int limit = 50,
  }) {
    final query = select(planAdjustments);
    if (status != null) {
      query.where((a) => a.status.equals(status));
    }
    if (masterPlanId != null) {
      query.where((a) => a.masterPlanId.equals(masterPlanId));
    }
    query.orderBy([(a) => OrderingTerm.desc(a.createdAt)]);
    query.limit(limit);
    return query.get();
  }

  Future<PlanAdjustment?> getPlanAdjustment(String id) {
    return (select(planAdjustments)..where((a) => a.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> insertPlanAdjustment(PlanAdjustmentsCompanion adjustment) {
    return into(planAdjustments).insert(adjustment);
  }

  Future<bool> updatePlanAdjustment(PlanAdjustmentsCompanion adjustment) {
    return update(planAdjustments).replace(adjustment);
  }

  Future<void> updatePlanAdjustmentStatus(String id, String status, {DateTime? appliedAt}) {
    return (update(planAdjustments)..where((a) => a.id.equals(id))).write(
      PlanAdjustmentsCompanion(
        status: Value(status),
        appliedAt: appliedAt != null ? Value(appliedAt) : const Value.absent(),
      ),
    );
  }

  // ============================================================================
  // HEALTH ANOMALIES OPERATIONS
  // ============================================================================

  Future<List<HealthAnomaly>> getHealthAnomalies({
    bool activeOnly = true,
    int limit = 50,
  }) {
    final query = select(healthAnomalies);
    if (activeOnly) {
      query.where((a) => a.isResolved.equals(false));
    }
    query.orderBy([(a) => OrderingTerm.desc(a.detectedAt)]);
    query.limit(limit);
    return query.get();
  }

  Future<HealthAnomaly?> getHealthAnomaly(String id) {
    return (select(healthAnomalies)..where((a) => a.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> insertHealthAnomaly(HealthAnomaliesCompanion anomaly) {
    return into(healthAnomalies).insert(anomaly);
  }

  Future<bool> updateHealthAnomaly(HealthAnomaliesCompanion anomaly) {
    return update(healthAnomalies).replace(anomaly);
  }

  Future<void> acknowledgeHealthAnomaly(String id) {
    return (update(healthAnomalies)..where((a) => a.id.equals(id))).write(
      HealthAnomaliesCompanion(
        isAcknowledged: const Value(true),
        acknowledgedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> resolveHealthAnomaly(String id) {
    return (update(healthAnomalies)..where((a) => a.id.equals(id))).write(
      HealthAnomaliesCompanion(
        isResolved: const Value(true),
        resolvedAt: Value(DateTime.now()),
      ),
    );
  }

  // ============================================================================
  // STRAIN TARGETS OPERATIONS (v8)
  // ============================================================================

  Future<StrainTarget?> getStrainTargetForDate(DateTime date) {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return (select(strainTargets)
          ..where((s) => s.date.isBiggerOrEqualValue(startOfDay))
          ..where((s) => s.date.isSmallerThanValue(endOfDay)))
        .getSingleOrNull();
  }

  Future<StrainTarget?> getTodayStrainTarget() {
    return getStrainTargetForDate(DateTime.now());
  }

  Future<List<StrainTarget>> getStrainTargetsInRange(DateTime start, DateTime end) {
    return (select(strainTargets)
          ..where((s) => s.date.isBiggerOrEqualValue(start))
          ..where((s) => s.date.isSmallerThanValue(end))
          ..orderBy([(s) => OrderingTerm.desc(s.date)]))
        .get();
  }

  Future<int> insertStrainTarget(StrainTargetsCompanion target) {
    return into(strainTargets).insert(target);
  }

  Future<bool> updateStrainTarget(StrainTargetsCompanion target) {
    return update(strainTargets).replace(target);
  }

  Future<void> updateStrainTargetProgress(String id, double currentStrain, bool targetMet) {
    return (update(strainTargets)..where((s) => s.id.equals(id))).write(
      StrainTargetsCompanion(
        currentStrain: Value(currentStrain),
        targetMet: Value(targetMet),
      ),
    );
  }

  // ============================================================================
  // SLEEP NEEDS OPERATIONS (v8)
  // ============================================================================

  Future<SleepNeed?> getSleepNeedForDate(DateTime date) {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return (select(sleepNeeds)
          ..where((s) => s.date.isBiggerOrEqualValue(startOfDay))
          ..where((s) => s.date.isSmallerThanValue(endOfDay)))
        .getSingleOrNull();
  }

  Future<SleepNeed?> getTodaySleepNeed() {
    return getSleepNeedForDate(DateTime.now());
  }

  Future<List<SleepNeed>> getSleepNeedsInRange(DateTime start, DateTime end) {
    return (select(sleepNeeds)
          ..where((s) => s.date.isBiggerOrEqualValue(start))
          ..where((s) => s.date.isSmallerThanValue(end))
          ..orderBy([(s) => OrderingTerm.desc(s.date)]))
        .get();
  }

  Future<int> insertSleepNeed(SleepNeedsCompanion need) {
    return into(sleepNeeds).insert(need);
  }

  Future<bool> updateSleepNeed(SleepNeedsCompanion need) {
    return update(sleepNeeds).replace(need);
  }

  Future<void> updateSleepNeedActual(String id, double actualSleep, String? qualityRating) {
    return (update(sleepNeeds)..where((s) => s.id.equals(id))).write(
      SleepNeedsCompanion(
        actualSleep: Value(actualSleep),
        qualityRating: Value(qualityRating),
      ),
    );
  }

  // ============================================================================
  // STREAKS OPERATIONS (v8)
  // ============================================================================

  Future<List<Streak>> getAllStreaks() {
    return (select(streaks)..orderBy([(s) => OrderingTerm.asc(s.type)])).get();
  }

  Future<List<Streak>> getActiveStreaks() {
    return (select(streaks)
          ..where((s) => s.isActive.equals(true))
          ..orderBy([(s) => OrderingTerm.desc(s.currentCount)]))
        .get();
  }

  Future<Streak?> getStreak(String id) {
    return (select(streaks)..where((s) => s.id.equals(id))).getSingleOrNull();
  }

  Future<Streak?> getStreakByType(String type) {
    return (select(streaks)..where((s) => s.type.equals(type))).getSingleOrNull();
  }

  Future<int> insertStreak(StreaksCompanion streak) {
    return into(streaks).insert(streak);
  }

  Future<bool> updateStreak(StreaksCompanion streak) {
    return update(streaks).replace(streak);
  }

  Future<void> incrementStreak(String id) async {
    final streak = await getStreak(id);
    if (streak != null) {
      final newCount = streak.currentCount + 1;
      final longestEver = newCount > streak.longestEver ? newCount : streak.longestEver;

      await (update(streaks)..where((s) => s.id.equals(id))).write(
        StreaksCompanion(
          currentCount: Value(newCount),
          longestEver: Value(longestEver),
          lastAchievedAt: Value(DateTime.now()),
          isActive: const Value(true),
          updatedAt: Value(DateTime.now()),
        ),
      );
    }
  }

  Future<void> breakStreak(String id) {
    return (update(streaks)..where((s) => s.id.equals(id))).write(
      StreaksCompanion(
        isActive: const Value(false),
        brokenAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> resetStreak(String id) {
    return (update(streaks)..where((s) => s.id.equals(id))).write(
      StreaksCompanion(
        currentCount: const Value(1),
        startedAt: Value(DateTime.now()),
        lastAchievedAt: Value(DateTime.now()),
        isActive: const Value(true),
        brokenAt: const Value(null),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // ============================================================================
  // PERSONAL RECORDS OPERATIONS (v8)
  // ============================================================================

  Future<List<PersonalRecord>> getAllPersonalRecords() {
    return (select(personalRecords)
          ..orderBy([(r) => OrderingTerm.desc(r.achievedAt)]))
        .get();
  }

  Future<List<PersonalRecord>> getPersonalRecordsByCategory(String category) {
    return (select(personalRecords)
          ..where((r) => r.category.equals(category))
          ..orderBy([(r) => OrderingTerm.desc(r.achievedAt)]))
        .get();
  }

  Future<PersonalRecord?> getPersonalRecord(String id) {
    return (select(personalRecords)..where((r) => r.id.equals(id)))
        .getSingleOrNull();
  }

  Future<PersonalRecord?> getPersonalRecordByMetric(String metric) {
    return (select(personalRecords)
          ..where((r) => r.metric.equals(metric))
          ..where((r) => r.isAllTime.equals(true)))
        .getSingleOrNull();
  }

  Future<List<PersonalRecord>> getRecentRecords({int days = 7}) {
    final since = DateTime.now().subtract(Duration(days: days));
    return (select(personalRecords)
          ..where((r) => r.achievedAt.isBiggerOrEqualValue(since))
          ..orderBy([(r) => OrderingTerm.desc(r.achievedAt)]))
        .get();
  }

  Future<int> insertPersonalRecord(PersonalRecordsCompanion record) {
    return into(personalRecords).insert(record);
  }

  Future<bool> updatePersonalRecord(PersonalRecordsCompanion record) {
    return update(personalRecords).replace(record);
  }

  Future<int> deletePersonalRecord(String id) {
    return (delete(personalRecords)..where((r) => r.id.equals(id))).go();
  }

  // ============================================================================
  // MONTHLY ASSESSMENTS OPERATIONS (v8)
  // ============================================================================

  Future<List<MonthlyAssessment>> getMonthlyAssessments({int limit = 12}) {
    return (select(monthlyAssessments)
          ..orderBy([(a) => OrderingTerm.desc(a.monthStart)])
          ..limit(limit))
        .get();
  }

  Future<MonthlyAssessment?> getMonthlyAssessment(String id) {
    return (select(monthlyAssessments)..where((a) => a.id.equals(id)))
        .getSingleOrNull();
  }

  Future<MonthlyAssessment?> getMonthlyAssessmentForMonth(DateTime monthStart) {
    final start = DateTime(monthStart.year, monthStart.month, 1);
    final end = DateTime(monthStart.year, monthStart.month + 1, 1);

    return (select(monthlyAssessments)
          ..where((a) => a.monthStart.isBiggerOrEqualValue(start))
          ..where((a) => a.monthStart.isSmallerThanValue(end)))
        .getSingleOrNull();
  }

  Future<MonthlyAssessment?> getCurrentMonthAssessment() {
    final now = DateTime.now();
    return getMonthlyAssessmentForMonth(DateTime(now.year, now.month, 1));
  }

  Future<int> insertMonthlyAssessment(MonthlyAssessmentsCompanion assessment) {
    return into(monthlyAssessments).insert(assessment);
  }

  Future<bool> updateMonthlyAssessment(MonthlyAssessmentsCompanion assessment) {
    return update(monthlyAssessments).replace(assessment);
  }

  Future<int> deleteMonthlyAssessment(String id) {
    return (delete(monthlyAssessments)..where((a) => a.id.equals(id))).go();
  }

  // ============================================================================
  // HEALTHSPAN RECORDS OPERATIONS (v8)
  // ============================================================================

  Future<List<HealthspanRecord>> getHealthspanRecords({int limit = 12}) {
    return (select(healthspanRecords)
          ..orderBy([(h) => OrderingTerm.desc(h.calculatedAt)])
          ..limit(limit))
        .get();
  }

  Future<HealthspanRecord?> getHealthspanRecord(String id) {
    return (select(healthspanRecords)..where((h) => h.id.equals(id)))
        .getSingleOrNull();
  }

  Future<HealthspanRecord?> getLatestHealthspanRecord() {
    return (select(healthspanRecords)
          ..orderBy([(h) => OrderingTerm.desc(h.calculatedAt)])
          ..limit(1))
        .getSingleOrNull();
  }

  Future<int> insertHealthspanRecord(HealthspanRecordsCompanion record) {
    return into(healthspanRecords).insert(record);
  }

  Future<bool> updateHealthspanRecord(HealthspanRecordsCompanion record) {
    return update(healthspanRecords).replace(record);
  }

  // ============================================================================
  // DAILY OUTLOOKS OPERATIONS (v8)
  // ============================================================================

  Future<DailyOutlook?> getDailyOutlookForDate(DateTime date) {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return (select(dailyOutlooks)
          ..where((o) => o.date.isBiggerOrEqualValue(startOfDay))
          ..where((o) => o.date.isSmallerThanValue(endOfDay)))
        .getSingleOrNull();
  }

  Future<DailyOutlook?> getTodayDailyOutlook() {
    return getDailyOutlookForDate(DateTime.now());
  }

  Future<List<DailyOutlook>> getDailyOutlooksInRange(DateTime start, DateTime end) {
    return (select(dailyOutlooks)
          ..where((o) => o.date.isBiggerOrEqualValue(start))
          ..where((o) => o.date.isSmallerThanValue(end))
          ..orderBy([(o) => OrderingTerm.desc(o.date)]))
        .get();
  }

  Future<int> insertDailyOutlook(DailyOutlooksCompanion outlook) {
    return into(dailyOutlooks).insert(outlook);
  }

  Future<bool> updateDailyOutlook(DailyOutlooksCompanion outlook) {
    return update(dailyOutlooks).replace(outlook);
  }

  // ============================================================================
  // DAY REVIEWS OPERATIONS (v8)
  // ============================================================================

  Future<DayReview?> getDayReviewForDate(DateTime date) {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return (select(dayReviews)
          ..where((r) => r.date.isBiggerOrEqualValue(startOfDay))
          ..where((r) => r.date.isSmallerThanValue(endOfDay)))
        .getSingleOrNull();
  }

  Future<DayReview?> getTodayDayReview() {
    return getDayReviewForDate(DateTime.now());
  }

  Future<List<DayReview>> getDayReviewsInRange(DateTime start, DateTime end) {
    return (select(dayReviews)
          ..where((r) => r.date.isBiggerOrEqualValue(start))
          ..where((r) => r.date.isSmallerThanValue(end))
          ..orderBy([(r) => OrderingTerm.desc(r.date)]))
        .get();
  }

  Future<int> insertDayReview(DayReviewsCompanion review) {
    return into(dayReviews).insert(review);
  }

  Future<bool> updateDayReview(DayReviewsCompanion review) {
    return update(dayReviews).replace(review);
  }

  // ============================================================================
  // ALL-TIME STATS OPERATIONS (v8)
  // ============================================================================

  Future<AllTimeStat?> getAllTimeStats(String userId) {
    return (select(allTimeStats)..where((s) => s.userId.equals(userId)))
        .getSingleOrNull();
  }

  Future<AllTimeStat?> getLatestAllTimeStats() {
    return (select(allTimeStats)
          ..orderBy([(s) => OrderingTerm.desc(s.calculatedAt)])
          ..limit(1))
        .getSingleOrNull();
  }

  Future<int> insertAllTimeStats(AllTimeStatsCompanion stats) {
    return into(allTimeStats).insert(stats);
  }

  Future<bool> updateAllTimeStats(AllTimeStatsCompanion stats) {
    return update(allTimeStats).replace(stats);
  }

  Future<void> incrementAllTimeStats({
    String? id,
    int? workouts,
    int? mealsLogged,
    int? caloriesBurned,
    int? steps,
    double? sleepHours,
  }) async {
    final current = id != null
        ? await (select(allTimeStats)..where((s) => s.id.equals(id))).getSingleOrNull()
        : await getLatestAllTimeStats();

    if (current != null) {
      await (update(allTimeStats)..where((s) => s.id.equals(current.id))).write(
        AllTimeStatsCompanion(
          totalWorkouts: workouts != null ? Value(current.totalWorkouts + workouts) : const Value.absent(),
          totalMealsLogged: mealsLogged != null ? Value(current.totalMealsLogged + mealsLogged) : const Value.absent(),
          totalCaloriesBurned: caloriesBurned != null ? Value(current.totalCaloriesBurned + caloriesBurned) : const Value.absent(),
          totalSteps: steps != null ? Value(current.totalSteps + steps) : const Value.absent(),
          totalSleepHours: sleepHours != null ? Value(current.totalSleepHours + sleepHours) : const Value.absent(),
          updatedAt: Value(DateTime.now()),
        ),
      );
    }
  }

  // ============================================================================
  // MULTI-AGENT SYSTEM OPERATIONS (v9)
  // ============================================================================

  // ============================================================================
  // PROTOCOL RULES OPERATIONS
  // ============================================================================

  Future<List<ProtocolRule>> getAllProtocolRules({bool activeOnly = true}) {
    final query = select(protocolRules);
    if (activeOnly) {
      query.where((p) => p.isActive.equals(true));
    }
    query.orderBy([(p) => OrderingTerm.asc(p.category), (p) => OrderingTerm.asc(p.name)]);
    return query.get();
  }

  Future<List<ProtocolRule>> getProtocolRulesByCategory(String category) {
    return (select(protocolRules)
          ..where((p) => p.category.equals(category))
          ..where((p) => p.isActive.equals(true))
          ..orderBy([(p) => OrderingTerm.asc(p.name)]))
        .get();
  }

  Future<ProtocolRule?> getProtocolRule(String id) {
    return (select(protocolRules)..where((p) => p.id.equals(id)))
        .getSingleOrNull();
  }

  Future<ProtocolRule?> getProtocolRuleByName(String name) {
    return (select(protocolRules)..where((p) => p.name.equals(name)))
        .getSingleOrNull();
  }

  Future<int> insertProtocolRule(ProtocolRulesCompanion rule) {
    return into(protocolRules).insert(rule);
  }

  Future<bool> updateProtocolRule(ProtocolRulesCompanion rule) {
    return update(protocolRules).replace(rule);
  }

  Future<void> deactivateProtocolRule(String id) {
    return (update(protocolRules)..where((p) => p.id.equals(id))).write(
      ProtocolRulesCompanion(
        isActive: const Value(false),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<int> deleteProtocolRule(String id) {
    return (delete(protocolRules)..where((p) => p.id.equals(id))).go();
  }

  Stream<List<ProtocolRule>> watchProtocolRules({String? category, bool activeOnly = false}) {
    final query = select(protocolRules);
    if (category != null) {
      query.where((p) => p.category.equals(category));
    }
    if (activeOnly) {
      query.where((p) => p.isActive.equals(true));
    }
    query.orderBy([(p) => OrderingTerm.asc(p.category), (p) => OrderingTerm.asc(p.name)]);
    return query.watch();
  }

  Future<void> toggleProtocolRuleActive(String id, bool isActive) {
    return (update(protocolRules)..where((p) => p.id.equals(id))).write(
      ProtocolRulesCompanion(
        isActive: Value(isActive),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // ============================================================================
  // AGENT CONTEXTS OPERATIONS
  // ============================================================================

  Future<AgentContext?> getAgentContextForDate(DateTime date) {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return (select(agentContexts)
          ..where((c) => c.date.isBiggerOrEqualValue(startOfDay))
          ..where((c) => c.date.isSmallerThanValue(endOfDay)))
        .getSingleOrNull();
  }

  Future<AgentContext?> getTodayAgentContext() {
    return getAgentContextForDate(DateTime.now());
  }

  Future<List<AgentContext>> getAgentContextsInRange(DateTime start, DateTime end) {
    return (select(agentContexts)
          ..where((c) => c.date.isBiggerOrEqualValue(start))
          ..where((c) => c.date.isSmallerThanValue(end))
          ..orderBy([(c) => OrderingTerm.desc(c.date)]))
        .get();
  }

  Future<int> insertAgentContext(AgentContextsCompanion context) {
    return into(agentContexts).insert(context);
  }

  Future<bool> updateAgentContext(AgentContextsCompanion context) {
    return update(agentContexts).replace(context);
  }

  /// Upsert (update or insert) agent context for a specific date
  Future<void> upsertAgentContext(AgentContextsCompanion context) async {
    // Try to find existing context for this date
    final existing = await getAgentContextForDate(context.date.value);
    
    if (existing != null) {
      // Update existing
      await (update(agentContexts)..where((c) => c.id.equals(existing.id)))
          .write(context);
    } else {
      // Insert new
      await into(agentContexts).insert(context);
    }
  }

  // ============================================================================
  // AGENT CONVERSATIONS OPERATIONS
  // ============================================================================

  Future<List<AgentConversation>> getAgentConversations({
    required String agentType,
    int limit = 50,
  }) {
    return (select(agentConversations)
          ..where((c) => c.agentType.equals(agentType))
          ..orderBy([(c) => OrderingTerm.desc(c.timestamp)])
          ..limit(limit))
        .get();
  }

  Future<List<AgentConversation>> getAllConversations({int limit = 100}) {
    return (select(agentConversations)
          ..orderBy([(c) => OrderingTerm.desc(c.timestamp)])
          ..limit(limit))
        .get();
  }

  Future<AgentConversation?> getAgentConversation(String id) {
    return (select(agentConversations)..where((c) => c.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> insertAgentConversation(AgentConversationsCompanion conversation) {
    return into(agentConversations).insert(conversation);
  }

  Future<bool> updateAgentConversation(AgentConversationsCompanion conversation) {
    return update(agentConversations).replace(conversation);
  }

  Future<void> markAsActedUpon(String id) {
    return (update(agentConversations)..where((c) => c.id.equals(id))).write(
      const AgentConversationsCompanion(
        wasActedUpon: Value(true),
      ),
    );
  }

  Future<int> deleteAgentConversation(String id) {
    return (delete(agentConversations)..where((c) => c.id.equals(id))).go();
  }

  Future<void> deleteAgentConversationsByType(String agentType) {
    return (delete(agentConversations)..where((c) => c.agentType.equals(agentType))).go();
  }

  Stream<List<AgentConversation>> watchAgentConversations(String agentType) {
    return (select(agentConversations)
          ..where((c) => c.agentType.equals(agentType))
          ..orderBy([(c) => OrderingTerm.asc(c.timestamp)]))
        .watch();
  }

  // ============================================================================
  // HEALTH METRICS TIME SERIES OPERATIONS
  // ============================================================================

  Future<List<HealthMetricsTimeSery>> getHealthMetrics({
    required String metricType,
    required DateTime start,
    required DateTime end,
  }) {
    return (select(healthMetricsTimeSeries)
          ..where((m) => m.metricType.equals(metricType))
          ..where((m) => m.timestamp.isBiggerOrEqualValue(start))
          ..where((m) => m.timestamp.isSmallerThanValue(end))
          ..orderBy([(m) => OrderingTerm.desc(m.timestamp)]))
        .get();
  }

  Future<List<HealthMetricsTimeSery>> getRecentHealthMetrics({
    required String metricType,
    int hours = 24,
  }) {
    final since = DateTime.now().subtract(Duration(hours: hours));
    return getHealthMetrics(
      metricType: metricType,
      start: since,
      end: DateTime.now(),
    );
  }

  Future<HealthMetricsTimeSery?> getLatestHealthMetric(String metricType) {
    return (select(healthMetricsTimeSeries)
          ..where((m) => m.metricType.equals(metricType))
          ..orderBy([(m) => OrderingTerm.desc(m.timestamp)])
          ..limit(1))
        .getSingleOrNull();
  }

  Future<int> insertHealthMetric(HealthMetricsTimeSeriesCompanion metric) {
    return into(healthMetricsTimeSeries).insert(metric);
  }

  Future<int> insertHealthMetricsBatch(List<HealthMetricsTimeSeriesCompanion> metrics) async {
    await batch((batch) {
      batch.insertAll(healthMetricsTimeSeries, metrics);
    });
    return metrics.length;
  }

  // ============================================================================
  // MEALS DETAILED OPERATIONS
  // ============================================================================

  Future<List<MealsDetailedData>> getMealsForDate(DateTime date) {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return (select(mealsDetailed)
          ..where((m) => m.consumedAt.isBiggerOrEqualValue(startOfDay))
          ..where((m) => m.consumedAt.isSmallerThanValue(endOfDay))
          ..orderBy([(m) => OrderingTerm.asc(m.consumedAt)]))
        .get();
  }

  Future<List<MealsDetailedData>> getMealsInRange(DateTime start, DateTime end) {
    return (select(mealsDetailed)
          ..where((m) => m.consumedAt.isBiggerOrEqualValue(start))
          ..where((m) => m.consumedAt.isSmallerThanValue(end))
          ..orderBy([(m) => OrderingTerm.desc(m.consumedAt)]))
        .get();
  }

  Future<MealsDetailedData?> getMealDetailed(String id) {
    return (select(mealsDetailed)..where((m) => m.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> insertMealDetailed(MealsDetailedCompanion meal) {
    return into(mealsDetailed).insert(meal);
  }

  Future<bool> updateMealDetailed(MealsDetailedCompanion meal) {
    return update(mealsDetailed).replace(meal);
  }

  Future<int> deleteMealDetailed(String id) {
    return (delete(mealsDetailed)..where((m) => m.id.equals(id))).go();
  }

  // ============================================================================
  // WORKOUTS DETAILED OPERATIONS
  // ============================================================================

  Future<List<WorkoutsDetailedData>> getWorkoutsForDate(DateTime date) {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return (select(workoutsDetailed)
          ..where((w) => w.startTime.isBiggerOrEqualValue(startOfDay))
          ..where((w) => w.startTime.isSmallerThanValue(endOfDay))
          ..orderBy([(w) => OrderingTerm.asc(w.startTime)]))
        .get();
  }

  Future<List<WorkoutsDetailedData>> getWorkoutsInRange(DateTime start, DateTime end) {
    return (select(workoutsDetailed)
          ..where((w) => w.startTime.isBiggerOrEqualValue(start))
          ..where((w) => w.startTime.isSmallerThanValue(end))
          ..orderBy([(w) => OrderingTerm.desc(w.startTime)]))
        .get();
  }

  Future<WorkoutsDetailedData?> getWorkoutDetailed(String id) {
    return (select(workoutsDetailed)..where((w) => w.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> insertWorkoutDetailed(WorkoutsDetailedCompanion workout) {
    return into(workoutsDetailed).insert(workout);
  }

  Future<bool> updateWorkoutDetailed(WorkoutsDetailedCompanion workout) {
    return update(workoutsDetailed).replace(workout);
  }

  Future<int> deleteWorkoutDetailed(String id) {
    return (delete(workoutsDetailed)..where((w) => w.id.equals(id))).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'health_keeper.db'));

    return NativeDatabase.createInBackground(file);
  });
}

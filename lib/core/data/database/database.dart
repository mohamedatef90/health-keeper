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
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

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
    };
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'health_keeper.db'));

    return NativeDatabase.createInBackground(file);
  });
}

import 'package:drift/drift.dart';

/// User Profile Table
class UserProfiles extends Table {
  TextColumn get id => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  RealColumn get height => real().nullable()();
  IntColumn get age => integer().nullable()();
  TextColumn get gender => text().nullable()();
  TextColumn get timezone => text()();
  TextColumn get goalsJson => text()(); // JSON serialized UserGoals
  TextColumn get aiPreferencesJson => text()(); // JSON serialized AiPreferences
  BoolColumn get hasCompletedOnboarding => boolean().withDefault(const Constant(false))();
  BoolColumn get hasGrantedHealthKitPermission => boolean().withDefault(const Constant(false))();
  BoolColumn get hasGrantedAiConsent => boolean().withDefault(const Constant(false))();
  BoolColumn get hasGrantedPhotoConsent => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

/// Protocol Table
class Protocols extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().references(UserProfiles, #id)();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  IntColumn get eatingWindowStartHour => integer()();
  IntColumn get eatingWindowStartMinute => integer()();
  IntColumn get eatingWindowEndHour => integer()();
  IntColumn get eatingWindowEndMinute => integer()();
  TextColumn get medicationScheduleJson => text()(); // JSON array
  TextColumn get weeklyActivityPlanJson => text()(); // JSON array
  TextColumn get constraintsJson => text()(); // JSON array
  DateTimeColumn get lockedUntil => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Protocol Snapshots Table
class ProtocolSnapshots extends Table {
  TextColumn get id => text()();
  TextColumn get protocolId => text().references(Protocols, #id)();
  DateTimeColumn get effectiveDate => dateTime()();
  TextColumn get serializedProtocol => text()();
  TextColumn get changeReason => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Daily Logs Table
class DailyLogs extends Table {
  TextColumn get id => text()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  RealColumn get weight => real().nullable()();
  TextColumn get notes => text().nullable()();
  IntColumn get moodEnergy => integer().nullable()();
  IntColumn get hunger => integer().nullable()();
  IntColumn get stress => integer().nullable()();
  TextColumn get symptomsJson => text()(); // JSON array

  @override
  Set<Column> get primaryKey => {id};
}

/// Measurement Logs Table
class MeasurementLogs extends Table {
  TextColumn get id => text()();
  TextColumn get dailyLogId => text().references(DailyLogs, #id)();
  DateTimeColumn get date => dateTime()();
  RealColumn get waist => real().nullable()();
  RealColumn get chest => real().nullable()();
  RealColumn get hip => real().nullable()();
  RealColumn get thigh => real().nullable()();
  RealColumn get arm => real().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Meal Logs Table
class MealLogs extends Table {
  TextColumn get id => text()();
  TextColumn get dailyLogId => text().references(DailyLogs, #id)();
  DateTimeColumn get time => dateTime()();
  DateTimeColumn get createdAt => dateTime()();
  TextColumn get method => text()(); // 'manual', 'camera', 'template'
  TextColumn get photoUri => text().nullable()();
  TextColumn get templateId => text().nullable()();
  TextColumn get aiAnalysisId => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Meal Items Table
class MealItems extends Table {
  TextColumn get id => text()();
  TextColumn get mealLogId => text().references(MealLogs, #id)();
  TextColumn get name => text()();
  TextColumn get portion => text().nullable()();
  IntColumn get caloriesEstimate => integer().nullable()();
  IntColumn get proteinEstimate => integer().nullable()();
  IntColumn get carbsEstimate => integer().nullable()();
  IntColumn get fatEstimate => integer().nullable()();
  BoolColumn get isAiEstimate => boolean().withDefault(const Constant(false))();
  BoolColumn get isUserEdited => boolean().withDefault(const Constant(false))();
  IntColumn get confidence => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Workout Logs Table
class WorkoutLogs extends Table {
  TextColumn get id => text()();
  TextColumn get dailyLogId => text().references(DailyLogs, #id)();
  DateTimeColumn get date => dateTime()();
  TextColumn get type => text()();
  IntColumn get duration => integer()();
  IntColumn get intensity => integer().nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get source => text()(); // 'manual', 'watch'
  IntColumn get caloriesBurned => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Recovery Metrics Table
class RecoveryMetricsTable extends Table {
  TextColumn get id => text()();
  TextColumn get dailyLogId => text().references(DailyLogs, #id)();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get fetchedAt => dateTime()();
  RealColumn get sleepDuration => real().nullable()();
  IntColumn get sleepQuality => integer().nullable()();
  IntColumn get hrv => integer().nullable()();
  IntColumn get restingHR => integer().nullable()();
  IntColumn get steps => integer().nullable()();
  IntColumn get activeEnergy => integer().nullable()();
  IntColumn get workoutsCount => integer().nullable()();
  TextColumn get dataSource => text()(); // 'healthkit', 'manual'

  @override
  Set<Column> get primaryKey => {id};

  @override
  String get tableName => 'recovery_metrics';
}

/// Daily Briefs Table
class DailyBriefs extends Table {
  TextColumn get id => text()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get generatedAt => dateTime()();
  IntColumn get recoveryScore => integer()();
  IntColumn get readinessScore => integer()();
  TextColumn get topActionsJson => text()(); // JSON array
  TextColumn get warningsJson => text()(); // JSON array
  IntColumn get suggestedIntensity => integer()();
  TextColumn get coachingText => text()();
  BoolColumn get isAiGenerated => boolean().withDefault(const Constant(true))();
  TextColumn get dailyLogId => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Weekly Reports Table
class WeeklyReports extends Table {
  TextColumn get id => text()();
  DateTimeColumn get weekStartDate => dateTime()();
  DateTimeColumn get generatedAt => dateTime()();
  TextColumn get summary => text()();
  TextColumn get highlightsJson => text()(); // JSON array
  TextColumn get concernsJson => text()(); // JSON array
  TextColumn get progressAnalysis => text()();
  TextColumn get nextWeekFocus => text()();
  BoolColumn get isAiGenerated => boolean().withDefault(const Constant(true))();

  @override
  Set<Column> get primaryKey => {id};
}

/// Progress Photos Table
class ProgressPhotos extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().references(UserProfiles, #id)();
  DateTimeColumn get date => dateTime()();
  TextColumn get photoUri => text()();
  TextColumn get bodyPart => text()(); // 'front', 'side', 'back'
  TextColumn get notes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// AI Food Analysis Table
class AiFoodAnalyses extends Table {
  TextColumn get id => text()();
  TextColumn get mealLogId => text().references(MealLogs, #id)();
  TextColumn get photoUri => text()();
  TextColumn get rawResponse => text()();
  TextColumn get parsedItemsJson => text()(); // JSON array
  IntColumn get confidence => integer()();
  IntColumn get processingTime => integer()();
  TextColumn get model => text().withDefault(const Constant('gemini-2.5'))();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Photo Comparisons Table
class PhotoComparisons extends Table {
  TextColumn get id => text()();
  TextColumn get beforePhotoId => text().references(ProgressPhotos, #id)();
  TextColumn get afterPhotoId => text().references(ProgressPhotos, #id)();
  TextColumn get insights => text()();
  TextColumn get detectedChangesJson => text()(); // JSON array
  DateTimeColumn get generatedAt => dateTime()();
  BoolColumn get isAiGenerated => boolean().withDefault(const Constant(true))();

  @override
  Set<Column> get primaryKey => {id};
}

/// Meal Templates Table (for quick meal logging)
class MealTemplates extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().references(UserProfiles, #id)();
  TextColumn get name => text()();
  TextColumn get itemsJson => text()(); // JSON array of MealItem
  IntColumn get usageCount => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get lastUsedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Journal Entries Table
class JournalEntries extends Table {
  TextColumn get id => text()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get behaviorsJson => text()(); // JSON array of LoggedBehavior
  TextColumn get notes => text().nullable()();
  IntColumn get moodLevel => integer().nullable()(); // 1-5
  IntColumn get stressLevel => integer().nullable()(); // 1-5
  BoolColumn get isReviewed => boolean().withDefault(const Constant(false))();
  TextColumn get tagsJson => text()(); // JSON array of tags

  @override
  Set<Column> get primaryKey => {id};
}

/// Custom Behaviors Table (user-defined behaviors)
class CustomBehaviors extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get category => text()(); // BehaviorCategory enum value
  TextColumn get inputType => text()(); // BehaviorInputType enum value
  TextColumn get icon => text().nullable()();
  TextColumn get unit => text().nullable()();
  TextColumn get description => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Strain Scores Table
class StrainScores extends Table {
  TextColumn get id => text()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get calculatedAt => dateTime()();
  RealColumn get score => real()(); // 0-21
  IntColumn get maxHeartRate => integer()();
  TextColumn get zoneDataJson => text()(); // JSON serialized HRZoneData
  IntColumn get totalActiveMinutes => integer()();
  IntColumn get peakHeartRate => integer().nullable()();
  IntColumn get averageHeartRate => integer().nullable()();
  IntColumn get workoutCount => integer().withDefault(const Constant(0))();
  IntColumn get caloriesBurned => integer().nullable()();
  TextColumn get dataSource => text()(); // 'healthkit', 'manual', 'calculated'

  @override
  Set<Column> get primaryKey => {id};
}

/// Recovery Scores Table
class RecoveryScores extends Table {
  TextColumn get id => text()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get calculatedAt => dateTime()();
  IntColumn get score => integer()(); // 0-100
  TextColumn get componentsJson => text()(); // JSON serialized RecoveryComponents
  TextColumn get baselineJson => text()(); // JSON serialized BaselineMetrics
  TextColumn get deviationsJson => text()(); // JSON serialized MetricDeviations
  TextColumn get sleepPerformanceJson => text().nullable()(); // JSON serialized SleepPerformance
  TextColumn get state => text()(); // RecoveryState enum value
  TextColumn get dataSource => text()(); // 'healthkit', 'manual', 'calculated'

  @override
  Set<Column> get primaryKey => {id};
}

/// Medications Table - stores user medications with reminders
class Medications extends Table {
  TextColumn get id => text()();
  TextColumn get protocolId => text().references(Protocols, #id)();
  TextColumn get name => text()();
  TextColumn get dosage => text()();
  TextColumn get frequency => text()(); // MedicationFrequency enum value
  TextColumn get timesJson => text()(); // JSON array of TimeOfDay
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime().nullable()();
  TextColumn get notes => text().nullable()();
  BoolColumn get remindersEnabled => boolean().withDefault(const Constant(true))();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Supplements Table - stores user supplements
class Supplements extends Table {
  TextColumn get id => text()();
  TextColumn get protocolId => text().references(Protocols, #id)();
  TextColumn get name => text()();
  TextColumn get dosage => text()();
  TextColumn get frequency => text()(); // SupplementFrequency enum value
  TextColumn get timesJson => text()(); // JSON array of TimeOfDay
  BoolColumn get withMeals => boolean().withDefault(const Constant(false))();
  TextColumn get notes => text().nullable()();
  BoolColumn get remindersEnabled => boolean().withDefault(const Constant(true))();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Scheduled Workouts Table - stores planned workouts for each day
class ScheduledWorkouts extends Table {
  TextColumn get id => text()();
  TextColumn get protocolId => text().references(Protocols, #id)();
  TextColumn get name => text()();
  TextColumn get type => text()(); // WorkoutType enum value
  IntColumn get dayOfWeek => integer()(); // 1=Monday, 7=Sunday
  IntColumn get preferredTimeHour => integer().nullable()();
  IntColumn get preferredTimeMinute => integer().nullable()();
  IntColumn get duration => integer().nullable()(); // in minutes
  RealColumn get targetStrain => real().nullable()();
  TextColumn get notes => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

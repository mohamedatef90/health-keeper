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

// ============================================================================
// COACH CHAT TABLES (v4)
// ============================================================================

/// Chat Threads Table - stores conversation threads with AI coach
class ChatThreads extends Table {
  TextColumn get id => text()();
  TextColumn get title => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get lastMessageAt => dateTime().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  TextColumn get contextTag => text().nullable()(); // 'home' | 'nutrition' | 'workouts' | 'recovery'

  @override
  Set<Column> get primaryKey => {id};
}

/// Chat Messages Table - stores individual messages in threads
class ChatMessages extends Table {
  TextColumn get id => text()();
  TextColumn get threadId => text().references(ChatThreads, #id)();
  TextColumn get role => text()(); // 'user' | 'assistant' | 'system'
  TextColumn get content => text()();
  DateTimeColumn get createdAt => dateTime()();
  TextColumn get contextTag => text().nullable()(); // screen context when message was sent
  TextColumn get metadataJson => text().nullable()(); // JSON for quick replies, attachments, etc.
  TextColumn get proposalId => text().nullable()(); // Reference to pending proposal if any
  BoolColumn get isError => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

// ============================================================================
// COACH TABLES (v5)
// ============================================================================

/// Exercises Table - stores exercise definitions
class Exercises extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get muscleGroup => text()(); // chest, back, legs, shoulders, arms, core, cardio
  TextColumn get equipment => text().nullable()();
  TextColumn get instructions => text().nullable()();
  BoolColumn get isCustom => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Workout Templates Table - stores pre-built and custom workout templates
class WorkoutTemplatesTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get category => text()(); // strength, cardio, hiit, flexibility, sport
  TextColumn get difficulty => text()(); // beginner, intermediate, advanced
  IntColumn get estimatedMinutes => integer()();
  TextColumn get exercisesJson => text()(); // JSON array of TemplateExercise
  BoolColumn get isCustom => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  String get tableName => 'workout_templates';
}

/// Gym Sessions Table - stores active and completed gym sessions
class GymSessions extends Table {
  TextColumn get id => text()();
  TextColumn get templateId => text().nullable()();
  TextColumn get templateName => text().nullable()();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  TextColumn get exerciseLogsJson => text()(); // JSON array of SessionExercise
  IntColumn get totalVolume => integer().nullable()();
  TextColumn get status => text()(); // in_progress, paused, completed, cancelled

  @override
  Set<Column> get primaryKey => {id};
}

// ============================================================================
// WEEKLY MEAL PLANS TABLES (v6)
// ============================================================================

/// Weekly Meal Plans Table - stores AI-generated 7-day meal plans
class WeeklyMealPlansTable extends Table {
  TextColumn get id => text()();
  DateTimeColumn get weekStartDate => dateTime()();
  DateTimeColumn get generatedAt => dateTime()();

  /// JSON serialized daily meal plans for all 7 days
  TextColumn get plansJson => text()();

  /// Weekly targets
  IntColumn get weeklyCalorieTarget => integer().withDefault(const Constant(14000))();
  IntColumn get weeklyProteinTarget => integer().withDefault(const Constant(840))();

  /// Weekly totals
  IntColumn get totalCalories => integer().withDefault(const Constant(0))();
  IntColumn get totalProtein => integer().withDefault(const Constant(0))();
  IntColumn get totalCarbs => integer().withDefault(const Constant(0))();
  IntColumn get totalFat => integer().withDefault(const Constant(0))();

  /// Health context at generation
  IntColumn get recoveryScoreAtGeneration => integer().nullable()();
  RealColumn get strainScoreAtGeneration => real().nullable()();

  /// AI generation metadata
  BoolColumn get isAiGenerated => boolean().withDefault(const Constant(true))();
  TextColumn get coachingNote => text().nullable()();
  TextColumn get coachingNoteAr => text().nullable()();

  /// Plan approval status: pending, approved, rejected, modified
  TextColumn get approvalStatus => text().withDefault(const Constant('pending'))();

  /// For interconnected plan system
  TextColumn get linkedWorkoutPlanId => text().nullable()();
  BoolColumn get adjustedForWorkouts => boolean().withDefault(const Constant(false))();

  /// Workout days stored for reference (JSON array of integers 0-6)
  TextColumn get workoutDaysJson => text().nullable()();

  /// Dietary context
  TextColumn get dietaryRestrictionsJson => text().nullable()();
  TextColumn get cuisinePreferencesJson => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  String get tableName => 'weekly_meal_plans';
}

/// Weekly Workout Plans Table - stores AI-generated 7-day workout plans
class WeeklyWorkoutPlansTable extends Table {
  TextColumn get id => text()();
  DateTimeColumn get weekStartDate => dateTime()();
  DateTimeColumn get generatedAt => dateTime()();

  /// JSON serialized daily workout plans for all 7 days
  TextColumn get plansJson => text()();

  /// Weekly totals
  IntColumn get totalEstimatedCaloriesBurn => integer().withDefault(const Constant(0))();
  IntColumn get totalWorkoutMinutes => integer().withDefault(const Constant(0))();
  IntColumn get workoutDaysCount => integer().withDefault(const Constant(0))();

  /// Health context at generation
  IntColumn get recoveryScoreAtGeneration => integer().nullable()();
  RealColumn get strainScoreAtGeneration => real().nullable()();

  /// AI generation metadata
  BoolColumn get isAiGenerated => boolean().withDefault(const Constant(true))();
  TextColumn get coachingNote => text().nullable()();
  TextColumn get coachingNoteAr => text().nullable()();

  /// Plan approval status
  TextColumn get approvalStatus => text().withDefault(const Constant('pending'))();

  /// For interconnected plan system
  TextColumn get linkedMealPlanId => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  String get tableName => 'weekly_workout_plans';
}

/// Master Plans Table - coordinates meal and workout plans
class MasterPlansTable extends Table {
  TextColumn get id => text()();
  DateTimeColumn get weekStartDate => dateTime()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  /// Linked plan IDs
  TextColumn get weeklyMealPlanId => text().nullable()();
  TextColumn get weeklyWorkoutPlanId => text().nullable()();

  /// Master plan status: draft, active, pendingChanges
  TextColumn get status => text().withDefault(const Constant('draft'))();

  /// Pending changes JSON array
  TextColumn get pendingChangesJson => text().nullable()();

  /// Coordination totals
  IntColumn get plannedCalorieBurn => integer().nullable()();
  IntColumn get plannedCalorieIntake => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  String get tableName => 'master_plans';
}

// ============================================================================
// AI BRAIN TABLES (v7)
// ============================================================================

/// AI Brain Decisions Table - stores AI-generated decisions and their outcomes
class AiBrainDecisions extends Table {
  TextColumn get id => text()();

  /// Decision type: adjust_plan, send_notification, generate_alert, etc.
  TextColumn get type => text()();

  /// Urgency: immediate, soon, scheduled, background
  TextColumn get urgency => text()();

  /// Domain: workout, nutrition, sleep, recovery, health, protocol, chat
  TextColumn get domain => text()();

  /// Description (English)
  TextColumn get description => text()();

  /// Description (Arabic)
  TextColumn get descriptionAr => text().nullable()();

  /// Reasoning (English)
  TextColumn get reasoning => text().nullable()();

  /// Reasoning (Arabic)
  TextColumn get reasoningAr => text().nullable()();

  /// JSON payload with decision-specific data
  TextColumn get payloadJson => text()();

  /// Whether this decision requires user approval
  BoolColumn get requiresApproval => boolean().withDefault(const Constant(true))();

  /// Confidence score (0-100)
  IntColumn get confidence => integer().withDefault(const Constant(80))();

  /// Impact score (0-100)
  IntColumn get impactScore => integer().withDefault(const Constant(50))();

  /// Status: pending, awaiting_approval, approved, rejected, executed, failed, cancelled
  TextColumn get status => text().withDefault(const Constant('pending'))();

  /// Timestamps
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get scheduledAt => dateTime().nullable()();
  DateTimeColumn get executedAt => dateTime().nullable()();
  DateTimeColumn get approvedAt => dateTime().nullable()();
  DateTimeColumn get rejectedAt => dateTime().nullable()();

  /// User feedback
  TextColumn get userFeedback => text().nullable()();

  /// Source that triggered this decision
  TextColumn get triggerSource => text().nullable()();

  /// Related entity IDs (JSON map)
  TextColumn get relatedIdsJson => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  String get tableName => 'ai_brain_decisions';
}

/// User Autonomy Settings Table - stores user preferences for AI autonomy
class UserAutonomySettingsTable extends Table {
  TextColumn get id => text()();

  /// Auto-apply level: conservative, moderate, aggressive
  TextColumn get autoApplyLevel => text().withDefault(const Constant('moderate'))();

  /// Notification frequency: minimal, normal, all
  TextColumn get notificationFrequency => text().withDefault(const Constant('normal'))();

  /// Specific permissions
  BoolColumn get canAutoAdjustCalories => boolean().withDefault(const Constant(true))();
  BoolColumn get canAutoAdjustProtein => boolean().withDefault(const Constant(true))();
  BoolColumn get canAutoAddRestDay => boolean().withDefault(const Constant(false))();
  BoolColumn get canAutoRemoveWorkout => boolean().withDefault(const Constant(false))();
  BoolColumn get canAutoAdjustIntensity => boolean().withDefault(const Constant(true))();
  BoolColumn get canAutoAdjustMealTiming => boolean().withDefault(const Constant(true))();
  BoolColumn get canAutoSendNotifications => boolean().withDefault(const Constant(true))();

  /// Quiet hours
  BoolColumn get quietHoursEnabled => boolean().withDefault(const Constant(true))();
  IntColumn get quietHoursStart => integer().withDefault(const Constant(22))();
  IntColumn get quietHoursEnd => integer().withDefault(const Constant(7))();

  /// AI preferences
  TextColumn get aiLanguage => text().withDefault(const Constant('ar'))();
  TextColumn get coachingTone => text().withDefault(const Constant('supportive'))();
  BoolColumn get showAiReasoning => boolean().withDefault(const Constant(false))();
  BoolColumn get enableExperimentalFeatures => boolean().withDefault(const Constant(false))();

  /// Thresholds
  IntColumn get minRecoveryForIntensityIncrease => integer().withDefault(const Constant(60))();
  IntColumn get maxCalorieAdjustmentPerDay => integer().withDefault(const Constant(300))();
  IntColumn get maxProteinAdjustmentPerDay => integer().withDefault(const Constant(30))();
  IntColumn get lowRecoveryDaysBeforeRestSuggestion => integer().withDefault(const Constant(2))();

  /// Timestamps
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  String get tableName => 'user_autonomy_settings';
}

/// AI Brain Context Cache Table - caches aggregated context for offline support
class AiBrainContextCache extends Table {
  TextColumn get id => text()();

  /// JSON serialized AiBrainContext
  TextColumn get contextJson => text()();

  /// When context was generated
  DateTimeColumn get generatedAt => dateTime()();

  /// Last HealthKit sync time
  DateTimeColumn get lastHealthKitSync => dateTime().nullable()();

  /// Last meal sync time
  DateTimeColumn get lastMealSync => dateTime().nullable()();

  /// Last workout sync time
  DateTimeColumn get lastWorkoutSync => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  String get tableName => 'ai_brain_context_cache';
}

/// Plan Adjustments Table - stores plan adjustment history
class PlanAdjustments extends Table {
  TextColumn get id => text()();

  /// Adjustment type
  TextColumn get type => text()();

  /// Domain: workout, meal, recovery, both
  TextColumn get domain => text()();

  /// Reason (English)
  TextColumn get reason => text()();
  TextColumn get reasonAr => text().nullable()();

  /// Explanation
  TextColumn get explanation => text().nullable()();
  TextColumn get explanationAr => text().nullable()();

  /// Trigger
  TextColumn get trigger => text()();
  TextColumn get triggerAr => text().nullable()();

  /// Values (JSON)
  TextColumn get originalValueJson => text()();
  TextColumn get proposedValueJson => text()();

  /// Affected day (0-6, null = whole week)
  IntColumn get affectedDayIndex => integer().nullable()();

  /// Scores
  IntColumn get impactScore => integer().withDefault(const Constant(50))();
  IntColumn get confidence => integer().withDefault(const Constant(80))();

  /// Status
  TextColumn get status => text().withDefault(const Constant('proposed'))();

  /// Related plan IDs
  TextColumn get mealPlanId => text().nullable()();
  TextColumn get workoutPlanId => text().nullable()();
  TextColumn get masterPlanId => text().nullable()();

  /// Timestamps
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get appliedAt => dateTime().nullable()();
  DateTimeColumn get revertedAt => dateTime().nullable()();

  /// User feedback
  TextColumn get userFeedback => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  String get tableName => 'plan_adjustments';
}

/// Health Anomalies Table - stores detected health anomalies
class HealthAnomalies extends Table {
  TextColumn get id => text()();

  /// Anomaly type
  TextColumn get type => text()();

  /// Severity: info, low, moderate, high, critical
  TextColumn get severity => text()();

  /// Title
  TextColumn get title => text()();
  TextColumn get titleAr => text().nullable()();

  /// Description
  TextColumn get description => text()();
  TextColumn get descriptionAr => text().nullable()();

  /// Metric info
  TextColumn get metric => text()();
  RealColumn get currentValue => real()();
  RealColumn get expectedValue => real()();
  RealColumn get deviation => real()();
  TextColumn get unit => text().nullable()();

  /// Recommended actions (JSON array)
  TextColumn get recommendedActionsJson => text().nullable()();

  /// Related metrics (JSON array)
  TextColumn get relatedMetricsJson => text().nullable()();

  /// Historical context
  IntColumn get daysActive => integer().nullable()();

  /// Confidence
  IntColumn get confidence => integer().withDefault(const Constant(80))();

  /// Status flags
  BoolColumn get isAcknowledged => boolean().withDefault(const Constant(false))();
  BoolColumn get isResolved => boolean().withDefault(const Constant(false))();

  /// Timestamps
  DateTimeColumn get detectedAt => dateTime()();
  DateTimeColumn get acknowledgedAt => dateTime().nullable()();
  DateTimeColumn get resolvedAt => dateTime().nullable()();

  /// Raw data (JSON)
  TextColumn get rawDataJson => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  String get tableName => 'health_anomalies';
}

// ============================================================================
// WHOOP-INSPIRED FEATURES TABLES (v8)
// ============================================================================

/// Strain Targets Table - stores daily strain targets based on recovery
class StrainTargets extends Table {
  TextColumn get id => text()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get calculatedAt => dateTime()();

  /// Recovery score used to calculate target
  IntColumn get recoveryScore => integer()();

  /// Strain range
  RealColumn get minStrain => real()();
  RealColumn get maxStrain => real()();
  RealColumn get optimalStrain => real()();

  /// Current strain achieved
  RealColumn get currentStrain => real().withDefault(const Constant(0.0))();

  /// Whether target has been met
  BoolColumn get targetMet => boolean().withDefault(const Constant(false))();

  /// Suggested intensity: rest, light, moderate, intense, allOut
  TextColumn get suggestedIntensity => text()();

  /// Recommendation messages
  TextColumn get recommendation => text()();
  TextColumn get recommendationAr => text()();

  /// Detailed guidance
  TextColumn get guidance => text().nullable()();
  TextColumn get guidanceAr => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  String get tableName => 'strain_targets';
}

/// Sleep Needs Table - stores personalized sleep need calculations
class SleepNeeds extends Table {
  TextColumn get id => text()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get calculatedAt => dateTime()();

  /// Sleep need components (in hours)
  RealColumn get baseNeed => real()();
  RealColumn get debtPayback => real()();
  RealColumn get strainAdjustment => real()();
  RealColumn get totalNeed => real()();

  /// Input values
  RealColumn get sleepDebt => real()();
  RealColumn get strainScore => real()();

  /// Recommended times
  DateTimeColumn get recommendedBedtime => dateTime().nullable()();
  DateTimeColumn get recommendedWakeTime => dateTime().nullable()();

  /// User's typical wake time for calculations
  IntColumn get wakeTimeHour => integer().nullable()();
  IntColumn get wakeTimeMinute => integer().nullable()();

  /// Actual sleep achieved (filled next day)
  RealColumn get actualSleep => real().nullable()();

  /// Quality rating
  TextColumn get qualityRating => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  String get tableName => 'sleep_needs';
}

/// Streaks Table - tracks consecutive achievements
class Streaks extends Table {
  TextColumn get id => text()();

  /// Streak type: strainTarget, optimalSleep, highRecovery, mealLogging, etc.
  TextColumn get type => text()();

  /// Current streak count
  IntColumn get currentCount => integer().withDefault(const Constant(0))();

  /// Longest ever achieved
  IntColumn get longestEver => integer().withDefault(const Constant(0))();

  /// When this streak started
  DateTimeColumn get startedAt => dateTime().nullable()();

  /// Last day the streak was maintained
  DateTimeColumn get lastAchievedAt => dateTime().nullable()();

  /// When the streak was broken (null if active)
  DateTimeColumn get brokenAt => dateTime().nullable()();

  /// Whether the streak is currently active
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

  /// Target value for the streak (e.g., 70 for 70% recovery)
  IntColumn get targetValue => integer().nullable()();

  /// Timestamps
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  String get tableName => 'streaks';
}

/// Personal Records Table - stores all-time bests
class PersonalRecords extends Table {
  TextColumn get id => text()();

  /// Category: recovery, strain, sleep, activity, nutrition, streaks, consistency
  TextColumn get category => text()();

  /// Specific metric: highestRecovery, highestHrv, longestSleep, etc.
  TextColumn get metric => text()();

  /// Record value
  RealColumn get value => real()();

  /// Formatted value for display
  TextColumn get formattedValue => text().nullable()();

  /// When this record was achieved
  DateTimeColumn get achievedAt => dateTime()();

  /// Previous record value
  RealColumn get previousValue => real().nullable()();
  DateTimeColumn get previousAchievedAt => dateTime().nullable()();

  /// Is this the all-time best?
  BoolColumn get isAllTime => boolean().withDefault(const Constant(true))();

  /// Times this record has been broken
  IntColumn get timesImproved => integer().withDefault(const Constant(0))();

  /// Additional context (e.g., workout type)
  TextColumn get context => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  String get tableName => 'personal_records';
}

/// Monthly Assessments Table - stores 30-day performance analytics
class MonthlyAssessments extends Table {
  TextColumn get id => text()();
  DateTimeColumn get monthStart => dateTime()();
  DateTimeColumn get generatedAt => dateTime()();

  /// Monthly averages (JSON serialized MonthlyAverages)
  TextColumn get averagesJson => text()();

  /// Month-over-month comparison (JSON serialized MonthlyComparison)
  TextColumn get comparisonJson => text().nullable()();

  /// Trend analyses (JSON serialized TrendAnalysis)
  TextColumn get recoveryTrendJson => text()();
  TextColumn get strainTrendJson => text()();
  TextColumn get sleepTrendJson => text()();

  /// Behavior correlations (JSON arrays)
  TextColumn get positiveCorrelationsJson => text()();
  TextColumn get negativeCorrelationsJson => text()();

  /// Weekly breakdowns (JSON array)
  TextColumn get weeklyBreakdownsJson => text()();

  /// Key insights (JSON array)
  TextColumn get insightsJson => text()();

  /// AI-generated summaries
  TextColumn get aiSummary => text().nullable()();
  TextColumn get aiSummaryAr => text().nullable()();

  /// Best/worst days
  DateTimeColumn get bestDay => dateTime().nullable()();
  IntColumn get bestDayRecovery => integer().nullable()();
  DateTimeColumn get worstDay => dateTime().nullable()();
  IntColumn get worstDayRecovery => integer().nullable()();

  /// Workout/rest breakdown
  IntColumn get workoutDays => integer()();
  IntColumn get restDays => integer()();

  /// Streak data (JSON serialized MonthlyStreakData)
  TextColumn get streakDataJson => text().nullable()();

  /// Metadata
  BoolColumn get isAiGenerated => boolean().withDefault(const Constant(false))();
  IntColumn get dataCompleteness => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};

  @override
  String get tableName => 'monthly_assessments';
}

/// Healthspan Records Table - stores biological age calculations
class HealthspanRecords extends Table {
  TextColumn get id => text()();
  DateTimeColumn get calculatedAt => dateTime()();

  /// Ages
  IntColumn get chronologicalAge => integer()();
  IntColumn get biologicalAge => integer()();
  IntColumn get ageDifference => integer()();

  /// Individual factor adjustments
  IntColumn get hrvAdjustment => integer()();
  IntColumn get rhrAdjustment => integer()();
  IntColumn get sleepAdjustment => integer()();
  IntColumn get activityAdjustment => integer()();
  IntColumn get recoveryAdjustment => integer()();

  /// Input metrics used
  IntColumn get avgHrv => integer().nullable()();
  IntColumn get avgRhr => integer().nullable()();
  RealColumn get avgSleepHours => real().nullable()();
  IntColumn get avgSleepQuality => integer().nullable()();
  IntColumn get weeklyActiveMinutes => integer().nullable()();
  IntColumn get avgRecovery => integer().nullable()();
  IntColumn get weeklyWorkouts => integer().nullable()();

  /// Reference baselines (JSON serialized)
  TextColumn get hrvBaselinesJson => text().nullable()();
  TextColumn get rhrBaselinesJson => text().nullable()();

  /// All factor details (JSON serialized List<HealthspanFactor>)
  TextColumn get factorsJson => text()();

  /// Recommendations (JSON array)
  TextColumn get recommendationsJson => text()();

  /// Confidence score
  IntColumn get confidence => integer().withDefault(const Constant(70))();

  @override
  Set<Column> get primaryKey => {id};

  @override
  String get tableName => 'healthspan_records';
}

/// Daily Outlooks Table - stores morning briefing data
class DailyOutlooks extends Table {
  TextColumn get id => text()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get generatedAt => dateTime()();

  /// Recovery state
  IntColumn get recoveryScore => integer()();
  TextColumn get recoveryState => text()(); // peak, good, moderate, low, rest

  /// Strain target (JSON serialized StrainTarget)
  TextColumn get strainTargetJson => text()();

  /// Sleep outlook (JSON serialized SleepOutlook)
  TextColumn get sleepOutlookJson => text()();

  /// Recommended activities (JSON array)
  TextColumn get recommendedActivitiesJson => text()();

  /// Behaviors to track (JSON array)
  TextColumn get behaviorsToTrackJson => text()();

  /// Key insights (JSON array)
  TextColumn get insightsJson => text()();

  /// Key actions
  TextColumn get topActionsJson => text()();
  TextColumn get topActionsArJson => text()();

  /// Warnings
  TextColumn get warningsJson => text()();
  TextColumn get warningsArJson => text()();

  /// AI-generated coaching
  TextColumn get coachingMessage => text().nullable()();
  TextColumn get coachingMessageAr => text().nullable()();

  /// Metadata
  BoolColumn get isAiGenerated => boolean().withDefault(const Constant(false))();
  IntColumn get confidence => integer().withDefault(const Constant(70))();

  @override
  Set<Column> get primaryKey => {id};

  @override
  String get tableName => 'daily_outlooks';
}

/// Day Reviews Table - stores evening summary data
class DayReviews extends Table {
  TextColumn get id => text()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get generatedAt => dateTime()();

  /// Strain review (JSON serialized StrainReview)
  TextColumn get strainReviewJson => text()();

  /// Sleep review (JSON serialized SleepReview)
  TextColumn get sleepReviewJson => text()();

  /// Nutrition review (JSON serialized NutritionReview)
  TextColumn get nutritionReviewJson => text().nullable()();

  /// Recovery prediction (JSON serialized RecoveryPrediction)
  TextColumn get recoveryPredictionJson => text()();

  /// Behavior impacts (JSON array)
  TextColumn get behaviorImpactsJson => text()();

  /// What went well
  TextColumn get whatWentWellJson => text()();
  TextColumn get whatWentWellArJson => text()();

  /// Areas to improve
  TextColumn get areasToImproveJson => text()();
  TextColumn get areasToImproveArJson => text()();

  /// Sleep recommendation
  RealColumn get sleepRecommendationHours => real()();
  DateTimeColumn get recommendedBedtime => dateTime().nullable()();

  /// AI-generated summary
  TextColumn get aiSummary => text().nullable()();
  TextColumn get aiSummaryAr => text().nullable()();

  /// Overall day score (0-100)
  IntColumn get overallScore => integer()();

  /// Metadata
  BoolColumn get isAiGenerated => boolean().withDefault(const Constant(false))();
  IntColumn get confidence => integer().withDefault(const Constant(70))();

  @override
  Set<Column> get primaryKey => {id};

  @override
  String get tableName => 'day_reviews';
}

/// All-Time Stats Table - aggregated lifetime statistics
class AllTimeStats extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text()();
  DateTimeColumn get calculatedAt => dateTime()();

  /// Total counts
  IntColumn get totalDaysTracked => integer().withDefault(const Constant(0))();
  IntColumn get totalWorkouts => integer().withDefault(const Constant(0))();
  IntColumn get totalMealsLogged => integer().withDefault(const Constant(0))();
  IntColumn get totalCaloriesBurned => integer().withDefault(const Constant(0))();
  IntColumn get totalSteps => integer().withDefault(const Constant(0))();
  RealColumn get totalSleepHours => real().withDefault(const Constant(0.0))();

  /// Averages
  RealColumn get avgRecovery => real().withDefault(const Constant(0.0))();
  RealColumn get avgStrain => real().withDefault(const Constant(0.0))();

  /// Best periods
  DateTimeColumn get bestWeekDate => dateTime().nullable()();
  RealColumn get bestWeekScore => real().nullable()();
  DateTimeColumn get bestMonthDate => dateTime().nullable()();
  RealColumn get bestMonthScore => real().nullable()();

  /// Personal records reference
  TextColumn get recordsJson => text()(); // JSON array of record IDs

  /// Last updated
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  String get tableName => 'all_time_stats';
}

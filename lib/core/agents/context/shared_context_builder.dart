import 'package:drift/drift.dart';
import 'package:health_keeper/core/data/database/database.dart';
import 'package:health_keeper/core/agents/context/agent_context.dart';

/// Builds complete context for any agent
class SharedContextBuilder {
  final AppDatabase db;

  SharedContextBuilder(this.db);

  /// Build context for a specific agent type
  Future<AgentContextState> buildContext({
    required String agentType,
    DateTime? targetDate,
    int conversationLimit = 50,
    int mealsLookbackDays = 2,
    int workoutsLookbackDays = 3,
  }) async {
    final date = targetDate ?? DateTime.now();

    // Load all context in parallel
    final results = await Future.wait([
      _loadProtocolRules(),
      _loadDailyContext(date),
      _loadDailyContext(date.subtract(const Duration(days: 1))),
      _loadRecentMeals(date, mealsLookbackDays),
      _loadRecentWorkouts(date, workoutsLookbackDays),
      _loadLatestHealthMetrics(),
      _loadRecoveryData(date),
      _loadConversationHistory(agentType, conversationLimit),
      _loadWeeklyTrends(date),
    ]);

    return AgentContextState(
      protocolRules: results[0] as List<ProtocolRule>,
      today: results[1] as AgentContext?,
      yesterday: results[2] as AgentContext?,
      recentMeals: results[3] as List<MealsDetailedData>,
      recentWorkouts: results[4] as List<WorkoutsDetailedData>,
      latestHRV: (results[5] as Map<String, HealthMetricsTimeSery?>)['hrv'],
      latestHeartRate: (results[5] as Map<String, HealthMetricsTimeSery?>)['heart_rate'],
      latestBloodPressure: (results[5] as Map<String, HealthMetricsTimeSery?>)['blood_pressure'],
      todayRecovery: (results[6] as Map<String, dynamic>)['recovery'] as RecoveryScore?,
      todayStrain: (results[6] as Map<String, dynamic>)['strain'] as StrainScore?,
      conversationHistory: results[7] as List<AgentConversation>,
      weeklyTrends: results[8] as WeeklyTrends?,
    );
  }

  /// Load all active protocol rules
  Future<List<ProtocolRule>> _loadProtocolRules() async {
    return await db.getAllProtocolRules(activeOnly: true);
  }

  /// Load daily context for a specific date
  Future<AgentContext?> _loadDailyContext(DateTime date) async {
    return await db.getAgentContextForDate(date);
  }

  /// Load recent meals (last N days)
  Future<List<MealsDetailedData>> _loadRecentMeals(DateTime date, int days) async {
    final start = date.subtract(Duration(days: days));
    return await db.getMealsInRange(start, date.add(const Duration(days: 1)));
  }

  /// Load recent workouts (last N days)
  Future<List<WorkoutsDetailedData>> _loadRecentWorkouts(DateTime date, int days) async {
    final start = date.subtract(Duration(days: days));
    return await db.getWorkoutsInRange(start, date.add(const Duration(days: 1)));
  }

  /// Load latest health metrics (HRV, HR, BP)
  Future<Map<String, HealthMetricsTimeSery?>> _loadLatestHealthMetrics() async {
    return {
      'hrv': await db.getLatestHealthMetric('hrv'),
      'heart_rate': await db.getLatestHealthMetric('heart-rate'),
      'blood_pressure': await db.getLatestHealthMetric('blood-pressure-systolic'),
    };
  }

  /// Load recovery and strain data for today
  Future<Map<String, dynamic>> _loadRecoveryData(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    // Get recovery score
    final recoveryQuery = db.select(db.recoveryScores)
      ..where((r) => r.date.isBiggerOrEqualValue(startOfDay))
      ..where((r) => r.date.isSmallerThanValue(endOfDay))
      ..orderBy([(r) => OrderingTerm.desc(r.calculatedAt)])
      ..limit(1);
    final recovery = await recoveryQuery.getSingleOrNull();

    // Get strain score
    final strainQuery = db.select(db.strainScores)
      ..where((s) => s.date.isBiggerOrEqualValue(startOfDay))
      ..where((s) => s.date.isSmallerThanValue(endOfDay))
      ..orderBy([(s) => OrderingTerm.desc(s.calculatedAt)])
      ..limit(1);
    final strain = await strainQuery.getSingleOrNull();

    return {
      'recovery': recovery,
      'strain': strain,
    };
  }

  /// Load conversation history for specific agent
  Future<List<AgentConversation>> _loadConversationHistory(
    String agentType,
    int limit,
  ) async {
    return await db.getAgentConversations(
      agentType: agentType,
      limit: limit,
    );
  }

  /// Calculate weekly trends (last 7 days)
  Future<WeeklyTrends?> _loadWeeklyTrends(DateTime date) async {
    final weekStart = date.subtract(const Duration(days: 7));
    final weekEnd = date.add(const Duration(days: 1));

    // Get all contexts for the week
    final contexts = await db.getAgentContextsInRange(weekStart, weekEnd);

    if (contexts.isEmpty) return null;

    // Calculate averages
    final sleepValues = contexts
        .where((c) => c.sleepDuration != null)
        .map((c) => c.sleepDuration!)
        .toList();
    final hrvValues = contexts
        .where((c) => c.sleepHRV != null)
        .map((c) => c.sleepHRV!)
        .toList();

    // Get recovery scores
    final recoveryScores = await db.select(db.recoveryScores)
      ..where((r) => r.date.isBiggerOrEqualValue(weekStart))
      ..where((r) => r.date.isSmallerThanValue(weekEnd));
    final recoveries = await recoveryScores.get();

    // Get strain scores
    final strainScoresQuery = db.select(db.strainScores)
      ..where((s) => s.date.isBiggerOrEqualValue(weekStart))
      ..where((s) => s.date.isSmallerThanValue(weekEnd));
    final strains = await strainScoresQuery.get();

    // Get workouts
    final workouts = await db.getWorkoutsInRange(weekStart, weekEnd);

    // Calculate totals
    final totalCalories = contexts
        .where((c) => c.caloriesConsumed != null)
        .fold<double>(0, (sum, c) => sum + c.caloriesConsumed!);

    return WeeklyTrends(
      avgRecovery: recoveries.isEmpty
          ? 0
          : recoveries.map((r) => r.score).reduce((a, b) => a + b) /
              recoveries.length,
      avgStrain: strains.isEmpty
          ? 0
          : strains.map((s) => s.score).reduce((a, b) => a + b) /
              strains.length,
      avgSleep: sleepValues.isEmpty
          ? 0
          : sleepValues.reduce((a, b) => a + b) / sleepValues.length,
      avgHRV: hrvValues.isEmpty
          ? 0
          : hrvValues.reduce((a, b) => a + b) / hrvValues.length,
      totalWorkouts: workouts.length,
      totalCalories: totalCalories.toInt(),
    );
  }

  /// Build a quick context for notifications (lightweight)
  Future<Map<String, dynamic>> buildQuickContext(DateTime date) async {
    final today = await _loadDailyContext(date);
    final recovery = await _loadRecoveryData(date);

    return {
      'sleep': today?.sleepDuration,
      'hrv': today?.sleepHRV,
      'weight': today?.weight,
      'recovery': (recovery['recovery'] as RecoveryScore?)?.score,
      'strain': (recovery['strain'] as StrainScore?)?.score,
      'calories': today?.caloriesConsumed,
      'protein': today?.protein,
    };
  }
}

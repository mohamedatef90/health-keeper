import 'package:health_keeper/core/data/database/database.dart';

/// Complete context passed to any agent for generating responses
class AgentContextState {
  // Protocol Layer - Static Rules
  final List<ProtocolRule> protocolRules;

  // Daily Context - Today & Yesterday
  final AgentContext? today;
  final AgentContext? yesterday;

  // Detailed Data
  final List<MealsDetailedData> recentMeals;
  final List<WorkoutsDetailedData> recentWorkouts;

  // Health Metrics
  final HealthMetricsTimeSery? latestHRV;
  final HealthMetricsTimeSery? latestHeartRate;
  final HealthMetricsTimeSery? latestBloodPressure;

  // Recovery Data
  final RecoveryScore? todayRecovery;
  final StrainScore? todayStrain;

  // Agent-specific Conversation History
  final List<AgentConversation> conversationHistory;

  // Weekly Trends
  final WeeklyTrends? weeklyTrends;

  AgentContextState({
    required this.protocolRules,
    this.today,
    this.yesterday,
    this.recentMeals = const [],
    this.recentWorkouts = const [],
    this.latestHRV,
    this.latestHeartRate,
    this.latestBloodPressure,
    this.todayRecovery,
    this.todayStrain,
    this.conversationHistory = const [],
    this.weeklyTrends,
  });

  /// Build a context summary for AI prompt
  String buildSummary({String language = 'ar'}) {
    final buffer = StringBuffer();

    // Protocol
    if (protocolRules.isNotEmpty) {
      buffer.writeln('## البروتوكول الأساسي:');
      for (final rule in protocolRules) {
        buffer.writeln('- ${rule.name}: ${rule.scheduleJson}');
      }
      buffer.writeln();
    }

    // Today's Context
    if (today != null) {
      buffer.writeln('## بيانات اليوم:');
      final ctx = today!;
      
      if (ctx.sleepDuration != null) {
        buffer.writeln('- النوم: ${ctx.sleepDuration!.toStringAsFixed(1)} ساعة');
      }
      if (ctx.sleepHRV != null) {
        buffer.writeln('  HRV: ${ctx.sleepHRV!.toStringAsFixed(0)} ms');
      }
      if (ctx.weight != null) {
        buffer.writeln('- الوزن: ${ctx.weight!.toStringAsFixed(1)} kg');
      }
      if (ctx.caloriesConsumed != null && ctx.caloriesConsumed! > 0) {
        buffer.writeln('- السعرات المستهلكة: ${ctx.caloriesConsumed!.toInt()} kcal');
        if (ctx.protein != null) {
          buffer.writeln('  البروتين: ${ctx.protein!.toInt()}g');
        }
      }
      if (ctx.steps != null && ctx.steps! > 0) {
        buffer.writeln('- الخطوات: ${ctx.steps} خطوة');
      }
      buffer.writeln();
    }

    // Recent Meals
    if (recentMeals.isNotEmpty) {
      buffer.writeln('## الوجبات الأخيرة:');
      for (final meal in recentMeals) {
        buffer.writeln(
            '- ${meal.name} (${meal.mealType}): ${meal.calories.toInt()} سعر، ${meal.protein.toInt()}g بروتين');
      }
      buffer.writeln();
    }

    // Recent Workouts
    if (recentWorkouts.isNotEmpty) {
      buffer.writeln('## التمارين الأخيرة:');
      for (final workout in recentWorkouts) {
        buffer.writeln(
            '- ${workout.name} (${workout.workoutType}): ${workout.duration} دقيقة، شدة: ${workout.intensity ?? 'متوسطة'}');
      }
      buffer.writeln();
    }

    // Recovery
    if (todayRecovery != null) {
      buffer.writeln('## الاستشفاء:');
      buffer.writeln('- Recovery Score: ${todayRecovery!.score}%');
      buffer.writeln('- الحالة: ${todayRecovery!.state}');
      buffer.writeln();
    }

    return buffer.toString();
  }

  /// Build a lightweight JSON snapshot for conversation storage
  Map<String, dynamic> buildSnapshot() {
    return {
      'date': DateTime.now().toIso8601String(),
      'sleep': today?.sleepDuration,
      'hrv': today?.sleepHRV,
      'weight': today?.weight,
      'calories': today?.caloriesConsumed,
      'protein': today?.protein,
      'steps': today?.steps,
      'recovery': todayRecovery?.score,
      'strain': todayStrain?.score,
      'meals_count': recentMeals.length,
      'workouts_count': recentWorkouts.length,
    };
  }
}

/// Weekly trends data
class WeeklyTrends {
  final double avgRecovery;
  final double avgStrain;
  final double avgSleep;
  final double avgHRV;
  final int totalWorkouts;
  final int totalCalories;

  WeeklyTrends({
    required this.avgRecovery,
    required this.avgStrain,
    required this.avgSleep,
    required this.avgHRV,
    required this.totalWorkouts,
    required this.totalCalories,
  });
}

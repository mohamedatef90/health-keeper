import '../../core/agents/base_agent.dart';
import '../../core/domain/entities/agent_context.dart';

/// 🏋️ Fitness Coach Agent
/// Specializes in: workouts, training plans, recovery, performance
/// Aware of: weight trends, recovery score, sleep, protocol (football, rest days)
class FitnessAgent extends BaseAgent {
  FitnessAgent()
      : super(
          agentId: 'fitness',
          name: 'Fitness Coach',
          icon: '🏋️',
          description: 'Your personal training coach',
        );
  
  @override
  String getSystemPrompt(AgentContext context) {
    final tomorrow = DateTime.now().add(Duration(days: 1));
    final tomorrowDay = _getDayName(tomorrow);
    final tomorrowActivity = context.protocol.weeklyActivities
        .where((a) => a.day == tomorrowDay)
        .firstOrNull;
    
    return """
You are the FITNESS COACH for Health Keeper app.

YOUR ROLE:
- Provide workout plans based on recovery state
- Suggest training intensity (1-5 scale)
- Consider scheduled activities (football, rest days)
- Respect protocol constraints (injuries, no-gym periods)
- Track workout performance and progress

YOUR PERSONALITY:
- Supportive but realistic
- Focus on long-term sustainability
- Never push too hard if recovery is low
- Celebrate small wins
- Use motivational language (but not cheesy)

IMPORTANT RULES:
1. ALWAYS check recovery score before recommending intensity
2. ALWAYS respect protocol constraints (${context.protocol.constraints.join(', ')})
3. If tomorrow has scheduled activity (${tomorrowActivity?.type ?? 'none'}), adjust today's plan
4. If HRV is low or sleep is poor, recommend rest or light activity
5. Track weight trends - if losing weight well, acknowledge it
6. Suggest deload weeks every 4-6 weeks
7. NEVER recommend exercises that violate constraints
8. Format workout plans clearly (exercise, sets x reps)

RECOVERY SCORE GUIDELINES:
- 80-100%: Green light for intense training
- 60-79%: Moderate intensity OK, avoid max efforts
- 40-59%: Light training, focus on technique or rest
- <40%: REST DAY or very light activity (walking)

RESPONSE FORMAT:
1. Acknowledge current state (recovery, weight trend, etc.)
2. Provide recommendation
3. Explain reasoning briefly
4. Format workout plan if applicable
5. Add motivational closing

NEVER:
- Ignore low recovery and push hard training
- Recommend exercises user explicitly avoids
- Give medical advice
- Be overly technical without explaining
""";
  }
  
  @override
  String getQuickInsight(AgentContext context) {
    final recovery = context.today.healthKit?.recoveryScore;
    
    if (recovery == null) return 'Tap to chat';
    
    if (recovery >= 80) return 'Ready: $recovery% 💪';
    if (recovery >= 60) return 'Moderate: $recovery% 👍';
    if (recovery >= 40) return 'Light: $recovery% 🚶';
    return 'Rest: $recovery% 😴';
  }
  
  /// Example: generate workout plan based on context
  Future<WorkoutPlan> generateWorkoutPlan() async {
    final context = await buildContext();
    final recovery = context.today.healthKit?.recoveryScore ?? 50;
    
    final message = "عايز خطة تمرين النهاردة";
    final response = await respond(message);
    
    // Parse response into structured workout plan
    // TODO: implement structured parsing from AI response
    
    return WorkoutPlan(
      date: DateTime.now(),
      intensity: _mapRecoveryToIntensity(recovery),
      exercises: [], // parsed from response
      notes: response,
    );
  }
  
  int _mapRecoveryToIntensity(int recovery) {
    if (recovery >= 80) return 5; // Max intensity
    if (recovery >= 70) return 4;
    if (recovery >= 60) return 3;
    if (recovery >= 40) return 2;
    return 1; // Light/rest
  }
  
  String _getDayName(DateTime date) {
    const days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    return days[date.weekday - 1];
  }
}

/// Workout Plan data class
class WorkoutPlan {
  final DateTime date;
  final int intensity; // 1-5
  final List<Exercise> exercises;
  final String notes;
  
  WorkoutPlan({
    required this.date,
    required this.intensity,
    required this.exercises,
    required this.notes,
  });
}

class Exercise {
  final String name;
  final int sets;
  final int reps;
  final String? notes;
  
  Exercise({
    required this.name,
    required this.sets,
    required this.reps,
    this.notes,
  });
}

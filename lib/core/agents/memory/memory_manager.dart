import 'dart:convert';
import 'package:health_keeper/core/data/database/database.dart';
import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

/// Manages shared memory and voice command integration
class MemoryManager {
  final AppDatabase db;
  final _uuid = const Uuid();

  MemoryManager(this.db);

  // ============================================================================
  // VOICE COMMAND PROCESSING
  // ============================================================================

  /// Process voice command: "وزني النهاردة 75.3"
  Future<String> processVoiceCommand(String command) async {
    final commandLower = command.toLowerCase();

    // Weight command
    if (_isWeightCommand(commandLower)) {
      return await _processWeightCommand(command);
    }

    // Meal command
    if (_isMealCommand(commandLower)) {
      return await _processMealCommand(command);
    }

    // Workout command
    if (_isWorkoutCommand(commandLower)) {
      return await _processWorkoutCommand(command);
    }

    // Medication command (Mounjaro)
    if (_isMedicationCommand(commandLower)) {
      return await _processMedicationCommand(command);
    }

    // Sleep command
    if (_isSleepCommand(commandLower)) {
      return await _processSleepCommand(command);
    }

    return 'معرفتش أفهم الأمر. جرب: "وزني 75"، "أكلت فول وبيض"، "خدت موونجارو"';
  }

  // ============================================================================
  // COMMAND DETECTION
  // ============================================================================

  bool _isWeightCommand(String command) {
    return command.contains('وزن') ||
        command.contains('كيلو') ||
        command.contains('weight') ||
        command.contains('kg');
  }

  bool _isMealCommand(String command) {
    return command.contains('أكلت') ||
        command.contains('وجبة') ||
        command.contains('فطار') ||
        command.contains('غدا') ||
        command.contains('عشا') ||
        command.contains('ate') ||
        command.contains('meal');
  }

  bool _isWorkoutCommand(String command) {
    return command.contains('تمرين') ||
        command.contains('رياضة') ||
        command.contains('جيم') ||
        command.contains('workout') ||
        command.contains('exercise');
  }

  bool _isMedicationCommand(String command) {
    return command.contains('موونجارو') ||
        command.contains('mounjaro') ||
        command.contains('دواء') ||
        command.contains('حقنة');
  }

  bool _isSleepCommand(String command) {
    return command.contains('نوم') ||
        command.contains('نمت') ||
        command.contains('sleep') ||
        command.contains('slept');
  }

  // ============================================================================
  // COMMAND PROCESSORS
  // ============================================================================

  Future<String> _processWeightCommand(String command) async {
    // Extract weight value (supports: "75", "75.3", "75 kg")
    final weightMatch = RegExp(r'(\d+\.?\d*)').firstMatch(command);
    if (weightMatch == null) {
      return 'معرفتش أقرا الوزن. جرب: "وزني 75.3"';
    }

    final weight = double.parse(weightMatch.group(1)!);
    final today = DateTime.now();

    // Update or insert today's context
    await _updateTodayContext(
      date: today,
      updates: {'weight': weight},
    );

    // Get previous weight for comparison
    final yesterday = await db.getAgentContextForDate(
      today.subtract(const Duration(days: 1)),
    );

    String response = 'تمام! سجلت وزنك: ${weight.toStringAsFixed(1)} كيلو';

    if (yesterday?.weight != null) {
      final diff = weight - yesterday!.weight!;
      if (diff > 0) {
        response += ' (↑ ${diff.toStringAsFixed(1)})';
      } else if (diff < 0) {
        response += ' (↓ ${(-diff).toStringAsFixed(1)})';
      }
    }

    response += ' 💪';

    return response;
  }

  Future<String> _processMealCommand(String command) async {
    // For now, just acknowledge - full meal parsing would need AI
    return 'تمام! لو عايز تضيف الوجبة بالتفصيل، استخدم صفحة الوجبات أو صور الأكل.';
  }

  Future<String> _processWorkoutCommand(String command) async {
    return 'تمام! لو عايز تسجل التمرين بالتفصيل، استخدم صفحة التمارين.';
  }

  Future<String> _processMedicationCommand(String command) async {
    final today = DateTime.now();

    // Mark Mounjaro as taken today
    await _updateTodayContext(
      date: today,
      updates: {'mounjaro_taken': true},
    );

    // Check protocol schedule
    final mounjaroRule = await db.getProtocolRuleByName('mounjaro');
    if (mounjaroRule != null) {
      final schedule = jsonDecode(mounjaroRule.scheduleJson) as Map<String, dynamic>;
      final days = (schedule['days'] as List).cast<String>();
      
      // Check if today is a scheduled day
      final dayName = _getDayName(today.weekday);
      if (!days.contains(dayName)) {
        return '⚠️ سجلت موونجارو، بس النهاردة مش يوم مجدول (المفروض: ${days.join('، ')})';
      }
    }

    return 'تمام! سجلت موونجارو النهاردة ✅';
  }

  Future<String> _processSleepCommand(String command) async {
    return 'بيانات النوم بتيجي تلقائي من Apple Health. لو عايز تسجل يدوي، استخدم صفحة الاستشفاء.';
  }

  // ============================================================================
  // CONTEXT UPDATE HELPERS
  // ============================================================================

  /// Update today's agent context with new data
  Future<void> _updateTodayContext({
    required DateTime date,
    required Map<String, dynamic> updates,
  }) async {
    final startOfDay = DateTime(date.year, date.month, date.day);

    // Get existing context
    final existing = await db.getAgentContextForDate(startOfDay);

    if (existing != null) {
      // Update existing
      final companion = AgentContextsCompanion(
        id: Value(existing.id),
        weight: updates.containsKey('weight')
            ? Value(updates['weight'] as double)
            : Value(existing.weight),
        mounjaroTaken: updates.containsKey('mounjaro_taken')
            ? Value(updates['mounjaro_taken'] as bool)
            : Value(existing.mounjaroTaken),
        syncedAt: Value(DateTime.now()),
      );

      await db.updateAgentContext(companion);
    } else {
      // Insert new
      final companion = AgentContextsCompanion.insert(
        id: _uuid.v4(),
        date: startOfDay,
        weight: updates.containsKey('weight')
            ? Value(updates['weight'] as double)
            : const Value.absent(),
        mounjaroTaken: updates.containsKey('mounjaro_taken')
            ? Value(updates['mounjaro_taken'] as bool)
            : const Value(false),
        syncedAt: DateTime.now(),
      );

      await db.insertAgentContext(companion);
    }

    // Notify agents of new data
    await _notifyAgents(updates);
  }

  /// Notify all agents that new data is available
  Future<void> _notifyAgents(Map<String, dynamic> updates) async {
    // This would trigger a refresh in the UI or send a notification
    // For now, just log
    print('📢 New data available: $updates');
  }

  // ============================================================================
  // SHARED MEMORY OPERATIONS
  // ============================================================================

  /// Write data to shared memory (generic interface)
  Future<void> writeToShared({
    required String category,
    required Map<String, dynamic> data,
  }) async {
    final today = DateTime.now();

    switch (category) {
      case 'measurement':
        await _updateTodayContext(date: today, updates: data);
        break;

      case 'meal':
        // Insert into MealsDetailed table
        await db.insertMealDetailed(
          MealsDetailedCompanion.insert(
            id: _uuid.v4(),
            consumedAt: data['consumed_at'] ?? DateTime.now(),
            mealType: data['meal_type'] ?? 'snack',
            name: data['name'] ?? 'Unknown meal',
            calories: data['calories'] ?? 0.0,
            protein: data['protein'] ?? 0.0,
            carbs: data['carbs'] ?? 0.0,
            fats: data['fats'] ?? 0.0,
            source: const Value('voice-command'),
            createdAt: DateTime.now(),
          ),
        );
        break;

      case 'workout':
        // Insert into WorkoutsDetailed table
        await db.insertWorkoutDetailed(
          WorkoutsDetailedCompanion.insert(
            id: _uuid.v4(),
            startTime: data['start_time'] ?? DateTime.now(),
            endTime: data['end_time'] ?? DateTime.now(),
            workoutType: data['workout_type'] ?? 'other',
            name: data['name'] ?? 'Quick workout',
            duration: data['duration'] ?? 30,
            source: const Value('voice-command'),
            createdAt: DateTime.now(),
          ),
        );
        break;

      default:
        throw ArgumentError('Unknown category: $category');
    }
  }

  /// Read shared context for an agent
  Future<Map<String, dynamic>> readShared({required String agentType}) async {
    // This would use SharedContextBuilder
    // For now, return quick context
    final today = await db.getTodayAgentContext();
    
    return {
      'date': DateTime.now().toIso8601String(),
      'weight': today?.weight,
      'sleep': today?.sleepDuration,
      'hrv': today?.sleepHRV,
      'calories': today?.caloriesConsumed,
      'protein': today?.protein,
      'recovery': today?.recoveryScore,
      'mounjaro_taken': today?.mounjaroTaken,
    };
  }

  // ============================================================================
  // UTILITY METHODS
  // ============================================================================

  String _getDayName(int weekday) {
    const days = [
      'monday',
      'tuesday',
      'wednesday',
      'thursday',
      'friday',
      'saturday',
      'sunday'
    ];
    return days[weekday - 1];
  }
}

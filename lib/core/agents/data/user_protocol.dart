import 'dart:convert';
import 'package:health_keeper/core/data/database/database.dart';
import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

/// User Protocol Rules
/// 
/// املا البيانات هنا بالبروتوكول بتاعك:
/// - Mounjaro schedule
/// - Football days
/// - Eating window
/// - أي قواعد تانية عايز الـagents يعرفوها
class UserProtocol {
  final AppDatabase db;
  final _uuid = const Uuid();

  UserProtocol(this.db);

  /// Seed all protocol rules to database
  Future<void> seedProtocol() async {
    await _seedMounjaroSchedule();
    await _seedFootballSchedule();
    await _seedEatingWindow();
    // أضف أي قواعد تانية هنا
  }

  // ==========================================================================
  // MOUNJARO MEDICATION SCHEDULE
  // ==========================================================================

  Future<void> _seedMounjaroSchedule() async {
    await db.insertProtocolRule(
      ProtocolRulesCompanion.insert(
        id: _uuid.v4(),
        category: 'medication',
        name: 'mounjaro',

        // ✏️ Schedule: املا المواعيد
        scheduleJson: jsonEncode({
          'days': ['monday', 'wednesday', 'friday'], // أيام الأسبوع
          'time': '09:00', // الوقت (24h format)
        }),

        // ✏️ Rules: املا التفاصيل
        rulesJson: jsonEncode({
          'dosage': '2.5mg', // الجرعة
          'sideEffects': [
            'nausea',
            'fatigue',
            'appetite_loss',
          ], // الآثار الجانبية المحتملة
          'notes': 'Take before breakfast. Monitor glucose levels.', // ملاحظات
        }),

        isActive: Value(true),
        createdAt: DateTime.now(),
      ),
    );
  }

  // ==========================================================================
  // FOOTBALL SCHEDULE
  // ==========================================================================

  Future<void> _seedFootballSchedule() async {
    await db.insertProtocolRule(
      ProtocolRulesCompanion.insert(
        id: _uuid.v4(),
        category: 'activity',
        name: 'football',

        // ✏️ Schedule: املا المواعيد
        scheduleJson: jsonEncode({
          'days': ['monday'], // أيام الماتش
          'time': '18:00', // الوقت
          'duration': '90min', // المدة
        }),

        // ✏️ Rules: املا التفاصيل
        rulesJson: jsonEncode({
          'intensity': 'high', // الشدة
          'recovery': '24h', // وقت الاستشفاء المطلوب
          'notes': 'Weekly match - high strain activity. Avoid intense workouts day before.', // ملاحظات
        }),

        isActive: Value(true),
        createdAt: DateTime.now(),
      ),
    );
  }

  // ==========================================================================
  // EATING WINDOW (INTERMITTENT FASTING)
  // ==========================================================================

  Future<void> _seedEatingWindow() async {
    await db.insertProtocolRule(
      ProtocolRulesCompanion.insert(
        id: _uuid.v4(),
        category: 'nutrition',
        name: 'eating-window',

        // ✏️ Schedule: املا المواعيد
        scheduleJson: jsonEncode({
          'start': '11:00', // بداية الأكل
          'end': '20:00', // نهاية الأكل
        }),

        // ✏️ Rules: املا الأهداف
        rulesJson: jsonEncode({
          'fastingHours': 15, // ساعات الصيام
          'targetCalories': 2000, // السعرات المستهدفة
          'targetProtein': 150, // البروتين المستهدف (جرام)
          'targetCarbs': 200, // الكارب المستهدف (جرام)
          'targetFats': 70, // الدهون المستهدفة (جرام)
          'notes': '9-hour eating window. Focus on high protein, moderate carbs.', // ملاحظات
        }),

        isActive: Value(true),
        createdAt: DateTime.now(),
      ),
    );
  }

  // ==========================================================================
  // ADD YOUR OWN PROTOCOL RULES BELOW
  // ==========================================================================

  /// Example: Sleep schedule
  Future<void> _seedSleepSchedule() async {
    await db.insertProtocolRule(
      ProtocolRulesCompanion.insert(
        id: _uuid.v4(),
        category: 'sleep',
        name: 'sleep-schedule',

        scheduleJson: jsonEncode({
          'bedtime': '23:00',
          'wake_time': '07:00',
        }),

        rulesJson: jsonEncode({
          'targetDuration': 8.0, // hours
          'notes': 'Aim for 8 hours. Track HRV for quality.',
        }),

        isActive: Value(true),
        createdAt: DateTime.now(),
      ),
    );
  }

  /// Example: Gym days
  Future<void> _seedGymSchedule() async {
    await db.insertProtocolRule(
      ProtocolRulesCompanion.insert(
        id: _uuid.v4(),
        category: 'activity',
        name: 'gym-schedule',

        scheduleJson: jsonEncode({
          'days': ['sunday', 'tuesday', 'thursday', 'saturday'],
          'time': '17:00',
        }),

        rulesJson: jsonEncode({
          'types': ['strength', 'hypertrophy'],
          'notes': '4x per week strength training.',
        }),

        isActive: Value(true),
        createdAt: DateTime.now(),
      ),
    );
  }

  // ==========================================================================
  // UTILITY METHODS
  // ==========================================================================

  /// Clear all existing protocol rules (use carefully!)
  Future<void> clearAllRules() async {
    final rules = await db.getAllProtocolRules(activeOnly: false);
    for (final rule in rules) {
      await db.deleteProtocolRule(rule.id);
    }
  }

  /// Deactivate a specific rule by name
  Future<void> deactivateRule(String ruleName) async {
    final rule = await db.getProtocolRuleByName(ruleName);
    if (rule != null) {
      await db.deactivateProtocolRule(rule.id);
    }
  }

  /// List all active rules
  Future<List<ProtocolRule>> listActiveRules() async {
    return await db.getAllProtocolRules(activeOnly: true);
  }
}

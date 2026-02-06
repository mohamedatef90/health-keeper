import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:health_keeper/core/data/database/database.dart';
import 'package:health_keeper/core/services/notification_service.dart';
import 'package:talker/talker.dart';
import 'dart:convert';

/// Protocol Notification Service - Smart reminders based on protocol
/// 
/// Sets up notifications for:
/// - Mounjaro injections (scheduled days)
/// - Football prep (day before)
/// - Eating window (start/end)
class ProtocolNotificationService {
  final NotificationService _notificationService;
  final AppDatabase _db;
  final Talker _talker;

  ProtocolNotificationService({
    required NotificationService notificationService,
    required AppDatabase database,
    required Talker talker,
  })  : _notificationService = notificationService,
        _db = database,
        _talker = talker;

  /// Setup all protocol notifications
  Future<void> setupProtocolNotifications() async {
    try {
      _talker.info('🔔 Setting up protocol notifications...');

      final protocols = await _db.getAllProtocolRules(activeOnly: true);

      for (final protocol in protocols) {
        switch (protocol.name) {
          case 'mounjaro':
            await _setupMounjaroNotifications(protocol);
            break;
          case 'football':
            await _setupFootballNotifications(protocol);
            break;
          case 'eating-window':
            await _setupEatingWindowNotifications(protocol);
            break;
        }
      }

      _talker.info('✅ Protocol notifications setup complete');
    } catch (e, stackTrace) {
      _talker.error('❌ Failed to setup notifications: $e', e, stackTrace);
    }
  }

  /// Mounjaro injection reminders
  Future<void> _setupMounjaroNotifications(ProtocolRule protocol) async {
    try {
      final schedule = jsonDecode(protocol.scheduleJson ?? '{}');
      final days = schedule['days'] as List?;
      final time = schedule['time'] as String?;

      if (days == null || time == null) return;

      // Parse time (e.g., "09:00")
      final parts = time.split(':');
      if (parts.length != 2) return;

      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);

      // Schedule for each day
      for (final day in days) {
        final dayIndex = _getDayIndex(day);
        if (dayIndex == null) continue;

        await _notificationService.scheduleWeeklyNotification(
          id: 1000 + dayIndex,
          title: '💉 Mounjaro Reminder',
          body: 'Time for your Mounjaro injection',
          day: dayIndex,
          hour: hour,
          minute: minute,
        );
      }

      _talker.debug('✅ Mounjaro notifications scheduled');
    } catch (e) {
      _talker.warning('⚠️  Failed to setup Mounjaro notifications: $e');
    }
  }

  /// Football prep notifications (day before)
  Future<void> _setupFootballNotifications(ProtocolRule protocol) async {
    try {
      final schedule = jsonDecode(protocol.scheduleJson ?? '{}');
      final days = schedule['days'] as List?;

      if (days == null) return;

      for (final day in days) {
        final dayIndex = _getDayIndex(day);
        if (dayIndex == null) continue;

        // Notify day before at 8 PM
        final prepDayIndex = dayIndex == 1 ? 7 : dayIndex - 1;

        await _notificationService.scheduleWeeklyNotification(
          id: 2000 + prepDayIndex,
          title: '⚽ Football Match Tomorrow',
          body: 'Avoid intense workouts today. Hydrate & rest!',
          day: prepDayIndex,
          hour: 20,
          minute: 0,
        );
      }

      _talker.debug('✅ Football notifications scheduled');
    } catch (e) {
      _talker.warning('⚠️  Failed to setup Football notifications: $e');
    }
  }

  /// Eating window notifications
  Future<void> _setupEatingWindowNotifications(ProtocolRule protocol) async {
    try {
      final schedule = jsonDecode(protocol.scheduleJson ?? '{}');
      final start = schedule['start'] as String?;
      final end = schedule['end'] as String?;

      if (start == null || end == null) return;

      // Parse start time
      final startParts = start.split(':');
      if (startParts.length == 2) {
        final hour = int.parse(startParts[0]);
        final minute = int.parse(startParts[1]);

        // Daily notification at eating window start
        await _notificationService.scheduleDailyNotification(
          id: 3000,
          title: '🍽️ Eating Window Open',
          body: 'Your eating window starts now. Enjoy your meals!',
          hour: hour,
          minute: minute,
        );
      }

      // Parse end time
      final endParts = end.split(':');
      if (endParts.length == 2) {
        final hour = int.parse(endParts[0]);
        final minute = int.parse(endParts[1]);

        // Daily notification 30 min before end
        final reminderMinute = minute - 30;
        final reminderHour = reminderMinute < 0 ? hour - 1 : hour;
        final adjustedMinute = reminderMinute < 0 ? 60 + reminderMinute : reminderMinute;

        await _notificationService.scheduleDailyNotification(
          id: 3001,
          title: '🍽️ Eating Window Closing Soon',
          body: 'Your eating window closes in 30 minutes',
          hour: reminderHour,
          minute: adjustedMinute,
        );
      }

      _talker.debug('✅ Eating window notifications scheduled');
    } catch (e) {
      _talker.warning('⚠️  Failed to setup eating window notifications: $e');
    }
  }

  /// Cancel all protocol notifications
  Future<void> cancelProtocolNotifications() async {
    try {
      // Cancel IDs 1000-3999 (protocol notifications range)
      for (int i = 1000; i < 4000; i++) {
        await _notificationService.cancelNotification(i);
      }
      _talker.info('✅ Protocol notifications cancelled');
    } catch (e) {
      _talker.error('❌ Failed to cancel notifications: $e');
    }
  }

  // ==========================================================================
  // HELPERS
  // ==========================================================================

  int? _getDayIndex(String day) {
    const days = {
      'monday': 1,
      'tuesday': 2,
      'wednesday': 3,
      'thursday': 4,
      'friday': 5,
      'saturday': 6,
      'sunday': 7,
    };
    return days[day.toLowerCase()];
  }
}

/// Extension on NotificationService for scheduling
extension NotificationScheduling on NotificationService {
  /// Schedule weekly notification
  Future<void> scheduleWeeklyNotification({
    required int id,
    required String title,
    required String body,
    required int day,
    required int hour,
    required int minute,
  }) async {
    // Implementation would use flutter_local_notifications
    // with weekly repeat based on day of week
    // This is a placeholder - actual implementation in NotificationServiceImpl
  }

  /// Schedule daily notification
  Future<void> scheduleDailyNotification({
    required int id,
    required String title,
    required String body,
    required int hour,
    required int minute,
  }) async {
    // Implementation would use flutter_local_notifications
    // with daily repeat at specified time
    // This is a placeholder - actual implementation in NotificationServiceImpl
  }

  /// Cancel specific notification
  Future<void> cancelNotification(int id) async {
    // Implementation in NotificationServiceImpl
  }
}

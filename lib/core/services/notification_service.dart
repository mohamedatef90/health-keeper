import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:talker/talker.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_data;

/// Service for handling local notifications
abstract class NotificationService {
  /// Initialize the notification service
  Future<void> initialize();

  /// Request notification permissions
  Future<bool> requestPermissions();

  /// Schedule a daily reminder notification
  Future<void> scheduleDailyReminder({
    required int id,
    required String title,
    required String body,
    required int hour,
    required int minute,
  });

  /// Schedule a medication reminder
  Future<void> scheduleMedicationReminder({
    required int id,
    required String medicationName,
    required String dose,
    required int hour,
    required int minute,
    required List<int> weekdays,
  });

  /// Cancel a specific notification
  Future<void> cancelNotification(int id);

  /// Cancel all notifications
  Future<void> cancelAllNotifications();

  /// Show an immediate notification
  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  });
}

class NotificationServiceImpl implements NotificationService {
  final Talker _talker;
  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  NotificationServiceImpl({required Talker talker}) : _talker = talker;

  @override
  Future<void> initialize() async {
    // Initialize timezone
    tz_data.initializeTimeZones();

    // Android settings
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');

    // iOS settings
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _notifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );

    _talker.info('Notification service initialized');
  }

  void _onNotificationTapped(NotificationResponse response) {
    _talker.info('Notification tapped: ${response.payload}');
    // Handle notification tap - navigate to relevant screen
  }

  @override
  Future<bool> requestPermissions() async {
    // iOS permissions
    final iosPlugin = _notifications.resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>();

    if (iosPlugin != null) {
      final granted = await iosPlugin.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
      return granted ?? false;
    }

    // Android permissions (Android 13+)
    final androidPlugin = _notifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

    if (androidPlugin != null) {
      final granted = await androidPlugin.requestNotificationsPermission();
      return granted ?? false;
    }

    return true;
  }

  @override
  Future<void> scheduleDailyReminder({
    required int id,
    required String title,
    required String body,
    required int hour,
    required int minute,
  }) async {
    try {
      final scheduledTime = _nextInstanceOfTime(hour, minute);

      await _notifications.zonedSchedule(
        id,
        title,
        body,
        scheduledTime,
        _defaultNotificationDetails,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
        payload: 'daily_reminder',
      );

      _talker.info('Scheduled daily reminder at $hour:$minute');
    } catch (e, st) {
      _talker.error('Failed to schedule daily reminder', e, st);
    }
  }

  @override
  Future<void> scheduleMedicationReminder({
    required int id,
    required String medicationName,
    required String dose,
    required int hour,
    required int minute,
    required List<int> weekdays,
  }) async {
    try {
      for (final weekday in weekdays) {
        final notificationId = id * 10 + weekday;
        final scheduledTime = _nextInstanceOfDayAndTime(weekday, hour, minute);

        await _notifications.zonedSchedule(
          notificationId,
          'Medication Reminder',
          '$medicationName - $dose',
          scheduledTime,
          _defaultNotificationDetails,
          androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
          payload: 'medication_$id',
        );
      }

      _talker.info('Scheduled medication reminder for $medicationName');
    } catch (e, st) {
      _talker.error('Failed to schedule medication reminder', e, st);
    }
  }

  @override
  Future<void> cancelNotification(int id) async {
    await _notifications.cancel(id);
    _talker.info('Cancelled notification $id');
  }

  @override
  Future<void> cancelAllNotifications() async {
    await _notifications.cancelAll();
    _talker.info('Cancelled all notifications');
  }

  @override
  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    try {
      await _notifications.show(
        id,
        title,
        body,
        _defaultNotificationDetails,
        payload: payload,
      );
    } catch (e, st) {
      _talker.error('Failed to show notification', e, st);
    }
  }

  NotificationDetails get _defaultNotificationDetails {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'health_keeper_channel',
        'Health Keeper',
        channelDescription: 'Health Keeper notifications',
        importance: Importance.high,
        priority: Priority.high,
        showWhen: true,
      ),
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );
  }

  tz.TZDateTime _nextInstanceOfTime(int hour, int minute) {
    final now = tz.TZDateTime.now(tz.local);
    var scheduled = tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);

    if (scheduled.isBefore(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }

    return scheduled;
  }

  tz.TZDateTime _nextInstanceOfDayAndTime(int weekday, int hour, int minute) {
    var scheduled = _nextInstanceOfTime(hour, minute);

    while (scheduled.weekday != weekday) {
      scheduled = scheduled.add(const Duration(days: 1));
    }

    return scheduled;
  }
}

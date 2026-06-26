import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

/// Local notifications for allergen maintenance reminders (§7.3).
/// No server push in v1 — everything is scheduled on-device.
class NotificationService {
  NotificationService._();
  static final NotificationService instance = NotificationService._();

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();
  bool _ready = false;

  static const _channelId = 'allergen_maintenance';
  static const _channelName = 'Allergen reminders';

  Future<void> init() async {
    if (_ready) return;
    tzdata.initializeTimeZones();
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: android);
    await _plugin.initialize(settings);
    _ready = true;
  }

  Future<bool> requestPermissions() async {
    await init();
    final android = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    final granted = await android?.requestNotificationsPermission();
    return granted ?? true;
  }

  NotificationDetails get _details => const NotificationDetails(
        android: AndroidNotificationDetails(
          _channelId,
          _channelName,
          channelDescription:
              'Reminders to keep introduced allergens in rotation',
          importance: Importance.high,
          priority: Priority.high,
        ),
      );

  /// Schedule a one-off maintenance reminder for [dueDate] at [time].
  /// [id] should be stable per allergen so re-scheduling replaces it.
  Future<void> scheduleMaintenanceReminder({
    required int id,
    required String title,
    required String body,
    required DateTime dueDate,
    required TimeOfDay time,
  }) async {
    await init();
    final when = _nextInstance(dueDate, time);
    // Don't schedule in the past; fire-now handling is via dashboard cards.
    if (when.isBefore(tz.TZDateTime.now(tz.local))) return;
    await _plugin.zonedSchedule(
      id,
      title,
      body,
      when,
      _details,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: 'maintenance:$id',
    );
  }

  Future<void> showNow({
    required int id,
    required String title,
    required String body,
  }) async {
    await init();
    await _plugin.show(id, title, body, _details);
  }

  Future<void> cancel(int id) async {
    await init();
    await _plugin.cancel(id);
  }

  Future<void> cancelAll() async {
    await init();
    await _plugin.cancelAll();
  }

  tz.TZDateTime _nextInstance(DateTime day, TimeOfDay time) {
    return tz.TZDateTime(
        tz.local, day.year, day.month, day.day, time.hour, time.minute);
  }
}

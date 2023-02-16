import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as latest;

class NotificationServices {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings _androidInitializationSettings =
      AndroidInitializationSettings("ic_launcher");

  void initializeNotification() async {
    InitializationSettings initializationSettings =
        InitializationSettings(android: _androidInitializationSettings);
    latest.initializeTimeZones();
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void sendNotification() async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("channelId", "channelName",
            importance: Importance.max, priority: Priority.high);
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin.show(
        0, "title", "body", notificationDetails);
  }

  void scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime datetime,
  }) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("channelId", "channelName",
            importance: Importance.max, priority: Priority.high);
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin.zonedSchedule(id, title, body,
        tz.TZDateTime.from(datetime, tz.local), notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
  }

  void stopNotification() async {
    _flutterLocalNotificationsPlugin.cancelAll();
  }
}

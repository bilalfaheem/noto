import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsService {
  final FlutterLocalNotificationsPlugin flutterLocalNoti =
      FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings androidInitSetting =
      AndroidInitializationSettings("logo");

  void initialiseNotifications() async {
    InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitSetting);

    await flutterLocalNoti.initialize(initializationSettings);
  }

  void sendNotification(String title, String body) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("channelId", "channelName",
            importance: Importance.max, priority: Priority.high);

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNoti.show(0, title, body, notificationDetails);
  }

  void scheduleNotification(String title, String body) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("channelId", "channelName2",
            importance: Importance.max, priority: Priority.high);

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNoti.periodicallyShow(
        1, title, body, RepeatInterval.everyMinute, notificationDetails);
  }

  void stopNotification() async {
    flutterLocalNoti.cancel(1);
  }
}

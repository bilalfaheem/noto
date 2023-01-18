import 'package:flutter/material.dart';
import 'package:notification/noti.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen(),);
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NotificationsService notificationsService = NotificationsService();
  @override
  void initState() {
    super.initState();
    notificationsService.initialiseNotifications();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){notificationsService.sendNotification("Noto", "Chl Ja Bhai");}, child: Text("Send Notification")),
           ElevatedButton(onPressed: (){notificationsService.scheduleNotification("schedule", "every minute");}, child: Text("Schedule Notification")),
            ElevatedButton(onPressed: (){notificationsService.stopNotification();}, child: Text("Cancel Notification"))
        ],
      ),
    );
  }
}

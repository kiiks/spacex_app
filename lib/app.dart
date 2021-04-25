import 'package:flutter/material.dart';
import 'package:spaceX_app/View/home.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:spaceX_app/utils/locator.dart';

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    setupNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }

  // Notification setup
  void setupNotifications() {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const ios = IOSInitializationSettings();
    const initSettings = InitializationSettings(android: android, iOS: ios);
    locator<FlutterLocalNotificationsPlugin>()
        .initialize(initSettings, onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) {
    print("payload : $payload");
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
            title: Text(payload),
            content: Text("You clicked on the notification")));
  }
}

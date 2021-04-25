import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:spaceX_app/utils/locator.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class Countdown extends StatefulWidget {
  Countdown({Key key, @required this.launchDate}) : super(key: key);

  DateTime launchDate;

  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CountdownTimer(
          endTime: widget.launchDate.millisecondsSinceEpoch,
          widgetBuilder: (context, timeRemaining) {
            scheduleLaunchNotification();
            if (timeRemaining == null) {
              return Center(child: Text('Liftoff !'));
            }
            return Center(
              child: Text(
                '${timeRemaining.days}d, ${timeRemaining.hours}h, ${timeRemaining.min}min, ${timeRemaining.sec}sec',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            );
          },
          onEnd: () {}),
    );
  }

  void scheduleLaunchNotification() async {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation(('Europe/Paris')));

    await locator<FlutterLocalNotificationsPlugin>().zonedSchedule(
        0,
        'Last checks',
        'A SpaceX rocket is going to launch !',
        tz.TZDateTime.from(widget.launchDate, tz.local),
        const NotificationDetails(
            android: AndroidNotificationDetails(
                'reminder-launch', 'Last checks', 'Reminder for next launch')),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }
}

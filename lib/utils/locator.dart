import 'package:get_it/get_it.dart';
import 'package:spaceX_app/utils/api.dart';
import 'package:spaceX_app/utils/shared.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final locator = GetIt.I;

void setupLocator() {
  locator.registerSingleton(ApiManager());
  locator.registerSingleton(Shared());

  // Setup notifications
  locator.registerSingleton(FlutterLocalNotificationsPlugin());
}

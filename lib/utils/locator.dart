import 'package:get_it/get_it.dart';
import 'package:spaceX_app/utils/api.dart';

final locator = GetIt.I;

void setupLocator() {
  locator.registerSingleton(ApiManager());
}

import 'package:flutter/material.dart';
import 'package:solidify/solidify.dart';
import 'core/di/dependency_injection.dart';
import 'package:solidify/core/routes/app_routes.dart';
import 'package:solidify/core/routes/routes_name.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  runApp(
    SolidifyApp(
      appRoutes: AppRoutes(),
      initialRoute: Routes.splashScreen,
      navigatorKey: navigatorKey,
    ),
  );
}

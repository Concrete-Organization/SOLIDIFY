import 'package:flutter/material.dart';
import 'package:solidify/solidify.dart';
import 'package:solidify/core/routes/app_routes.dart';
import 'package:solidify/core/routes/routes_name.dart';

import 'core/di/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  runApp(
    SolidifyApp(
      appRoutes: AppRoutes(),
      initialRoute: Routes.splashScreen,
    ),
  );
}

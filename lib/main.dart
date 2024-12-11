import 'package:flutter/material.dart';
import 'package:solidify/core/routes/app_routes.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/solidify.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    SolidifyApp(
      appRoutes: AppRoutes(),
      initialRoute: Routes.splashScreen,
    ),
  );
}


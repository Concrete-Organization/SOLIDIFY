import 'package:flutter/material.dart';
import 'core/network/dio_factory.dart';
import 'package:solidify/solidify.dart';
import 'package:provider/provider.dart';
import 'core/di/dependency_injection.dart';
import 'package:solidify/bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/routes/app_routes.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'features/marketplace/favorites/logic/favorites_provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await DioFactory.initCookieJar();
  setupGetIt();

  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoritesProvider(),
      child: SolidifyApp(
        appRoutes: AppRoutes(),
        initialRoute: Routes.splashScreen,
        navigatorKey: navigatorKey,
      ),
    ),
  );
}

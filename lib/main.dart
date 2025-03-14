import 'package:flutter/material.dart';
import 'core/network/dio_factory.dart';
import 'package:solidify/solidify.dart';
import 'package:provider/provider.dart';
import 'core/di/dependency_injection.dart';
import 'package:solidify/bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/routes/app_routes.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/helpers/shared_pref_helper.dart';
import 'features/marketplace/favorites/logic/favorites_provider.dart'; // Add this import

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await DioFactory.initCookieJar();
  setupGetIt();

  bool isLoggedIn = await SharedPrefHelper.getBool(SharedPrefKeys.isLoggedIn);
  bool isFirstTime = await SharedPrefHelper.getBool(
    SharedPrefKeys.isFirstTime,
    defaultValue: true,
  );

  String initialRoute;

  if (isLoggedIn) {
    final role = await SharedPrefHelper.getSecuredString(SharedPrefKeys.role);
    if (role == 'Company') {
      initialRoute = Routes.companyLayout;
    } else if (role == 'Engineer') {
      initialRoute = Routes.engineerLayout;
    } else {
      initialRoute = Routes.loginScreen;
    }
  } else {
    initialRoute = isFirstTime ? Routes.splashScreen : Routes.loginScreen;
  }

  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoritesProvider(),
      child: SolidifyApp(
        appRoutes: AppRoutes(),
        initialRoute: initialRoute,
        navigatorKey: navigatorKey,
      ),
    ),
  );
}

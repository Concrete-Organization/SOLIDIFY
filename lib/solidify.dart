import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/routes/app_routes.dart';
import 'core/theming/color_manger.dart';

class SolidifyApp extends StatelessWidget {
  final AppRoutes appRoutes;
  final String initialRoute;
  final GlobalKey<NavigatorState> navigatorKey;

  const SolidifyApp({
    super.key,
    required this.appRoutes,
    required this.initialRoute,
    required this.navigatorKey,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: 'SOLIDIFY',
        theme: ThemeData(
          primaryColor: ColorsManager.mainBlue,
          scaffoldBackgroundColor: ColorsManager.scaffoldBackground,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            iconTheme: IconThemeData(
              color: ColorsManager.mainBlue,
            ),
            scrolledUnderElevation: 0,
            backgroundColor: ColorsManager.scaffoldBackground,
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: initialRoute,
        onGenerateRoute: appRoutes.generateRoute,
      ),
    );
  }
}

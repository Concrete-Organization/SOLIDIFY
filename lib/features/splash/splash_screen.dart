import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/helpers/shared_pref_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
          () async {
        final isLoggedIn = await SharedPrefHelper.getBool(SharedPrefKeys.isLoggedIn);
        if (isLoggedIn) {
          final role = await SharedPrefHelper.getSecuredString(SharedPrefKeys.role);
          if (role == 'Company') {
            context.pushReplacementNamed(Routes.companyLayout);
          } else if (role == 'Engineer') {
            context.pushReplacementNamed(Routes.engineerLayout);
          } else {
            context.pushReplacementNamed(Routes.loginScreen);
          }
        } else {
          final isFirstTime = await SharedPrefHelper.getBool(
            SharedPrefKeys.isFirstTime,
            defaultValue: true,
          );
          context.pushReplacementNamed(
            isFirstTime ? Routes.onboardingScreen : Routes.loginScreen,
          );
        }
      },
    );  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        'assets/images/splash.png',
        fit: BoxFit.fill,
      ),
    );
  }
}

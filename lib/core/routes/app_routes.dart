import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_sign_up/widgets/engineer_identity_auth.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_sign_up/engineer_sign_up_screen.dart';
import 'package:solidify/features/home/ui/home_screen.dart';
import 'package:solidify/features/splash/splash_screen.dart';
import 'package:solidify/features/auth/otp/ui/otp_screen.dart';
import 'package:solidify/features/auth/login/ui/login_screen.dart';
import 'package:solidify/features/onboarding/onboarding_screen.dart';
import 'package:solidify/features/auth/reset_password/ui/reset_password_screen.dart';
import 'package:solidify/features/auth/forget_password/ui/forget_password_screens.dart';
import 'package:solidify/features/auth/sign_up/screens/select_account_type/ui/select_account_type_screen.dart';
import '../../features/auth/login/logic/login_cubit.dart';
import '../../features/auth/sign_up/screens/user_sign_up/user_sign_up_screen.dart';
import '../di/dependency_injection.dart';

class AppRoutes {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.onboardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => const ForgetPasswordScreens(),
        );
      case Routes.otpScreen:
        return MaterialPageRoute(
          builder: (context) => const OtpScreen(),
        );
      case Routes.resetPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => const ResetPasswordScreen(),
        );
      case Routes.selectAccountTypeScreen:
        return MaterialPageRoute(
          builder: (context) => const SelectAccountTypeScreen(),
        );
      case Routes.userSignUpScreen:
        return MaterialPageRoute(
          builder: (context) => const UserSignUpScreen(),
        );
      case Routes.engineerAccountSignUpScreen:
        return MaterialPageRoute(
          builder: (context) => const EngineerSignUpScreen(),
        );
      case Routes.identityAuth:
        return MaterialPageRoute(
          builder: (context) => const EngineerIdentityAuth(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

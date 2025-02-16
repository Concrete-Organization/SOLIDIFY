import 'package:flutter/material.dart';
import 'package:solidify/features/concrete_strength_ai/ui/screens/concrete_strength_ai_page_view_builder.dart';
import '../di/dependency_injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/features/splash/splash_screen.dart';
import 'package:solidify/features/auth/otp/ui/otp_screen.dart';
import 'package:solidify/features/auth/login/ui/login_screen.dart';
import 'package:solidify/features/auth/login/logic/login_cubit.dart';
import 'package:solidify/features/onboarding/onboarding_screen.dart';
import 'package:solidify/features/company_layout/company_layout.dart';
import 'package:solidify/features/auth/otp/logic/verify_otp_cubit.dart';
import 'package:solidify/features/auth/reset_password/ui/reset_password_screen.dart';
import 'package:solidify/features/auth/reset_password/logic/reset_password_cubit.dart';
import 'package:solidify/features/auth/forget_password/ui/forget_password_screen.dart';
import 'package:solidify/features/auth/forget_password/logic/forget_password_cubit.dart';
import 'package:solidify/features/auth/sign_up/widgets/sign_up_upload_files_screen.dart';
import 'package:solidify/features/auth/sign_up/screens/select_account_type/ui/select_account_type_screen.dart';
import '../../features/auth/sign_up/screens/engineer_account_sign_up/logic/engineer_account_sign_up_cubit.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_account_sign_up/ui/engineer_account_sign_up_screen.dart';
import 'package:solidify/features/auth/sign_up/screens/concrete_company_account_sign_up/ui/concrete_company_sign_up_screen.dart';
import 'package:solidify/features/auth/sign_up/screens/concrete_company_account_sign_up/logic/concrete_company_sign_up_cubit.dart';

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
          builder: (context) => BlocProvider(
            create: (context) => getIt<ForgetPasswordCubit>(),
            child: const ForgetPasswordScreen(),
          ),
        );
      case Routes.otpScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<VerifyOtpCubit>(),
            child: const OtpScreen(),
          ),
        );
      case Routes.resetPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ResetPasswordCubit>(),
            child: const ResetPasswordScreen(),
          ),
        );
      case Routes.selectAccountTypeScreen:
        return MaterialPageRoute(
          builder: (context) => const SelectAccountTypeScreen(),
        );
      case Routes.engineerSignUpScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<EngineerAccountSignUpCubit>(),
            child: const EngineerAccountSignUpScreen(),
          ),
        );
      case Routes.signUpUploadFilesScreen:
        return MaterialPageRoute(
          builder: (context) => const SignUpUploadFilesScreen(),
        );
      case Routes.concreteCompanyAccountScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ConcreteCompanySignUpCubit>(),
            child: const ConcreteCompanySignUpScreen(),
          ),
        );
      case Routes.companyLayout:
        return MaterialPageRoute(
          builder: (context) => const CompanyLayout(),
        );
      case Routes.concreteStrengthScreens:
        return MaterialPageRoute(
          builder: (context) => const ConcreteStrengthAiPageViewBuilder(),
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

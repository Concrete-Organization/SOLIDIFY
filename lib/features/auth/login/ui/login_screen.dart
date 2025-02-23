import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/custom_divider.dart';
import 'package:solidify/core/widgets/have_account_question_text.dart';
import 'package:solidify/core/widgets/social_media_buttons.dart';
import 'package:solidify/features/auth/login/logic/login_cubit.dart';
import 'package:solidify/features/auth/login/logic/login_state.dart';
import 'package:solidify/features/auth/login/ui/widgets/login_form_with_button.dart';
import 'package:solidify/features/auth/login/ui/widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            state.when(
              initial: () {},
              loading: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const Center(child: CircularProgressIndicator()),
                );
              },
              success: (loginResponse, role) {
                Navigator.of(context).pop();
                if (role == 'Company') {
                  context.pushNamedAndRemoveUntil(
                    Routes.companyLayout,
                    predicate: (Route<dynamic> route) => false,
                  );
                } else {
                  context.pushNamedAndRemoveUntil(
                    Routes.engineerLayout,
                    predicate: (Route<dynamic> route) => false,
                  );
                }
              },
              error: (error) {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red,
                    content: Text(
                      error.message,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
              tokenExpired: (message) {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.orange,
                    content: Text(
                      message,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
                context.pushNamedAndRemoveUntil(
                  Routes.loginScreen,
                  predicate: (Route<dynamic> route) => false,
                );
              },
            );
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  verticalSpace(99),
                  const LoginHeader(),
                  verticalSpace(40),
                  const LoginFormWithButton(),
                  verticalSpace(46),
                  const CustomDivider(),
                  verticalSpace(14),
                  const SocialMediaButtons(),
                  verticalSpace(23),
                  HaveAccountQuestionText(
                    questionText: 'Don’t have an account? ',
                    clickableText: 'Signup',
                    onTap: () => context.pushReplacementNamed(
                      Routes.selectAccountTypeScreen,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

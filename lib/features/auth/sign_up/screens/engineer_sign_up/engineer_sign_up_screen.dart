import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_sign_up/widgets/engineer_account_app_bar.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_sign_up/widgets/engineer_account_list.dart';
import 'package:solidify/features/auth/sign_up/widgets/sign_up_form.dart';

class EngineerSignUpScreen extends StatefulWidget {
  const EngineerSignUpScreen({super.key});

  @override
  State<EngineerSignUpScreen> createState() =>
      _EngineerAccountSignUpScreenState();
}

class _EngineerAccountSignUpScreenState
    extends State<EngineerSignUpScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  void _onNextPage() {
    if (currentPage < engineerAccountSignUp.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(20),
              const EngineerAccountAppBar(currentIndex: 0, totalPages: 2),
              verticalSpace(40),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create your account",
                        style: TextStyles.font24MainBlueMedium,
                      ),
                      verticalSpace(40),
                      const SignUpForm(),
                    ],
                  ),
                ),
              ),
              AppTextButton(
                onPressed: () {
                  context.pushNamed(Routes.identityAuth);
                },
                textButton: 'Continue',
              ),
              verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }
}
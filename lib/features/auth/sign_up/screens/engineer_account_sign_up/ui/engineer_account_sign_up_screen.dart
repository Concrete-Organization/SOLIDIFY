import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/features/auth/sign_up/widgets/sign_up_form.dart';
import 'package:solidify/features/auth/sign_up/widgets/engineer_account_list.dart';
import 'package:solidify/features/auth/forget_password/ui/widgets/forget_password_app_bar.dart';

class EngineerAccountSignUpScreen extends StatefulWidget {
  const EngineerAccountSignUpScreen({super.key});

  @override
  State<EngineerAccountSignUpScreen> createState() =>
      _EngineerAccountSignUpScreenState();
}

class _EngineerAccountSignUpScreenState
    extends State<EngineerAccountSignUpScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  void _onNextPage() {
    if (currentPage < enginnerAccountSignUp.length - 1) {
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(20),
                const ForgetPasswordAppBar(currentIndex: 0, totalPages: 2),
                verticalSpace(40),
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
      ),
    );
  }
}

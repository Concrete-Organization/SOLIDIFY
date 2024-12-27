import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/core/widgets/custom_app_bar_with_indicator.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_sign_up/widgets/engineer_account_list.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_sign_up/widgets/engineer_sign_up_page_view_builder.dart';

class EngineerSignUpScreen extends StatefulWidget {
  const EngineerSignUpScreen({super.key});

  @override
  State<EngineerSignUpScreen> createState() =>
      _EngineerAccountSignUpScreenState();
}

class _EngineerAccountSignUpScreenState extends State<EngineerSignUpScreen> {
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
              CustomAppBarWithIndicator(
                currentIndex: currentPage,
                totalPages: engineerAccountSignUp.length,
              ),
              verticalSpace(40),
              Expanded(
                child: EngineerSignUpPageViewBuilder(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                ),
              ),
              verticalSpace(20),
              AppTextButton(
                onPressed: _onNextPage,
                textButton: currentPage == engineerAccountSignUp.length - 1
                    ? 'Done'
                    : 'Continue',
              ),
              verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }
}

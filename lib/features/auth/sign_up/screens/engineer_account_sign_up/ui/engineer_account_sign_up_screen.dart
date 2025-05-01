import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/core/widgets/custom_app_bar_with_indicator.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_account_sign_up/logic/engineer_account_sign_up_cubit.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_account_sign_up/ui/widgets/engineer_account_sign_up_bloc_listener.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_account_sign_up/ui/widgets/engineer_account_sign_up_forms_list.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_account_sign_up/ui/widgets/engineer_sign_up_page_view_builder.dart';

class EngineerAccountSignUpScreen extends StatefulWidget {
  const EngineerAccountSignUpScreen({super.key});

  @override
  State<EngineerAccountSignUpScreen> createState() => _EngineerAccountSignUpScreenState();
}

class _EngineerAccountSignUpScreenState extends State<EngineerAccountSignUpScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  void _onNextPage() {
    final cubit = context.read<EngineerAccountSignUpCubit>();

    switch (currentPage) {
      case 0:
        if (!cubit.userAndEmailFormKey.currentState!.validate()) return;
        break;
      case 1:
        if (!cubit.passwordFormKey.currentState!.validate()) return;
        break;
    }

    if (currentPage < engineerAccountSignUpFormsScreens.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      setState(
            () => currentPage++,
      );
    } else {
      cubit.emitEngineerSignupStates();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              verticalSpace(20),
              CustomAppBarWithIndicator(
                currentIndex: currentPage,
                totalPages: engineerAccountSignUpFormsScreens.length,
              ),
              verticalSpace(40),
              Expanded(
                child: EngineerSignUpPageViewBuilder(
                  controller: _controller,
                  onPageChanged: (index) => setState(
                        () => currentPage = index,
                  ),
                ),
              ),
              Column(
                children: [
                  const EngineerAccountSignUpBlocListener(),
                  AppTextButton(
                    onPressed: _onNextPage,
                    textButton:
                    currentPage == engineerAccountSignUpFormsScreens.length - 1
                        ? 'Submit'
                        : 'Continue',
                  ),
                  verticalSpace(20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

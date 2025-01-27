import 'package:flutter/material.dart';
import 'widgets/business_account_list.dart';
import '../logic/business_sign_up_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'widgets/business_sign_up_page_view_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/core/widgets/custom_app_bar_with_indicator.dart';
import 'package:solidify/features/auth/sign_up/screens/business_account_sign_up/ui/widgets/bussiness_account_bloc_listener.dart';

class BusinessSignUpScreen extends StatefulWidget {
  const BusinessSignUpScreen({super.key});

  @override
  State<BusinessSignUpScreen> createState() => _BusinessSignUpScreenState();
}

class _BusinessSignUpScreenState extends State<BusinessSignUpScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  void _onNextPage() {
    final cubit = context.read<BusinessAccountSignUpCubit>();

    // Validate current form before proceeding
    switch (currentPage) {
      case 0:
        if (!cubit.identityFormKey.currentState!.validate()) return;
        break;
      case 1:
        if (!cubit.contactInfoFormKey.currentState!.validate()) return;
        break;
      case 2:
        if (!cubit.financialFormKey.currentState!.validate()) return;
        break;
    }

    if (currentPage < businessAccountSignUpScreens.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      setState(() => currentPage++);
    } else {
      cubit.emitBusinessSignUpStates();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              verticalSpace(20),
              CustomAppBarWithIndicator(
                currentIndex: currentPage,
                totalPages: businessAccountSignUpScreens.length,
              ),
              verticalSpace(40),
              Expanded(
                child: BusinessSignUpPageViewBuilder(
                  controller: _controller,
                  onPageChanged: (index) => setState(() => currentPage = index),
                ),
              ),
              // Add Bloc Listener and Button
              Column(
                children: [
                  const BusinessSignUpBlocListener(),
                  AppTextButton(
                    onPressed: _onNextPage,
                    textButton:
                        currentPage == businessAccountSignUpScreens.length - 1
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

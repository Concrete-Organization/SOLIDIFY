import 'package:flutter/material.dart';
import 'package:solidify/core/widgets/custom_snack_bar.dart';
import 'package:solidify/features/auth/sign_up/screens/concrete_company_account_sign_up/logic/concrete_company_sign_up_cubit.dart';
import 'package:solidify/features/auth/sign_up/screens/concrete_company_account_sign_up/ui/widgets/concrete_company_account_bloc_listener.dart';
import 'package:solidify/features/auth/sign_up/screens/concrete_company_account_sign_up/ui/widgets/concrete_company_sign_up_page_view_builder.dart';
import 'widgets/concrete_company_account_sign_up_forms_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/core/widgets/custom_app_bar_with_indicator.dart';

class ConcreteCompanySignUpScreen extends StatefulWidget {
  const ConcreteCompanySignUpScreen({super.key});

  @override
  State<ConcreteCompanySignUpScreen> createState() => _BusinessSignUpScreenState();
}

class _BusinessSignUpScreenState extends State<ConcreteCompanySignUpScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  void _onNextPage() {
    final cubit = context.read<ConcreteCompanySignUpCubit>();

    switch (currentPage) {
      case 0:
        if (!cubit.identityFormKey.currentState!.validate()) return;
        if (cubit.commercialLicenseFile == null) {
          CustomSnackBar.showError(
            context,
            'Please upload a commercial license file',
          );
          return;
        }
        break;
      case 1:
        if (!cubit.userAndEmailFormKey.currentState!.validate()) return;
        break;
      case 2:
        if (!cubit.passwordFormKey.currentState!.validate()) return;
        break;
    }

    if (currentPage < concreteCompanyAccountSignUpFormsScreens.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      setState(
        () => currentPage++,
      );
    } else {
      cubit.emitConcreteCompanySignUpStates();
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
                totalPages: concreteCompanyAccountSignUpFormsScreens.length,
              ),
              verticalSpace(40),
              Expanded(
                child: ConcreteCompanySignUpPageViewBuilder(
                  controller: _controller,
                  onPageChanged: (index) => setState(
                    () => currentPage = index,
                  ),
                ),
              ),
              Column(
                children: [
                  const ConcreteCompanyAccountBlocListener(),
                  AppTextButton(
                    onPressed: _onNextPage,
                    textButton:
                        currentPage == concreteCompanyAccountSignUpFormsScreens.length - 1
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

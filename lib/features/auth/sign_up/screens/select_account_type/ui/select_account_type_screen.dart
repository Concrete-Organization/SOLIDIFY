import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/core/widgets/have_account_question_text.dart';
import 'package:solidify/features/auth/sign_up/screens/select_account_type/widgets/selectable_row.dart';

class SelectAccountTypeScreen extends StatefulWidget {
  const SelectAccountTypeScreen({super.key});

  @override
  State<SelectAccountTypeScreen> createState() =>
      _SelectAccountTypeScreenState();
}

class _SelectAccountTypeScreenState extends State<SelectAccountTypeScreen> {
  int _selectedIndex = -1;

  void _onRowSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToNextScreen() {
    if (_selectedIndex == 0) {
      context.pushNamed(Routes.concreteCompanyAccountScreen);
    } else if (_selectedIndex == 1) {
      context.pushNamed(Routes.engineerSignUpScreen);
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
              verticalSpace(99),
              Text(
                'Create your account as',
                style: TextStyles.font24MainBlueSemiBold,
              ),
              verticalSpace(40),
              SelectableRowWithCheck(
                iconPath: 'assets/svgs/business_account_register.svg',
                label: 'Concrete company account',
                isSelected: _selectedIndex == 0,
                onTap: () => _onRowSelected(0),
              ),
              verticalSpace(40),
              SelectableRowWithCheck(
                iconPath: 'assets/svgs/engineer_register.svg',
                label: 'Engineer account',
                isSelected: _selectedIndex == 1,
                onTap: () => _onRowSelected(1),
              ),
              const Spacer(),
              AppTextButton(
                onPressed: _selectedIndex == -1 ? null : _navigateToNextScreen,
                textButton: 'Continue',
              ),
              verticalSpace(18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HaveAccountQuestionText(
                    questionText: 'Already have an account? ',
                    clickableText: 'Login',
                    onTap: () =>
                        context.pushReplacementNamed(Routes.loginScreen),
                  ),
                ],
              ),
              verticalSpace(18),
            ],
          ),
        ),
      ),
    );
  }
}

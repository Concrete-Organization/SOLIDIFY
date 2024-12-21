import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/core/widgets/app_text_form_field.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_sign_up/widgets/engineer_account_app_bar.dart';

class FinancialDetailsScreen extends StatefulWidget {
  const FinancialDetailsScreen({super.key});

  @override
  State<FinancialDetailsScreen> createState() => _FinancialDetailsScreenState();
}

class _FinancialDetailsScreenState extends State<FinancialDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(20),
                  const EngineerAccountAppBar(currentIndex: 2, totalPages: 3),
                  verticalSpace(40),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Financial details ',
                      style: TextStyles.font24MainBlueSemiBold,
                    ),
                  ),
                  verticalSpace(45),
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Company’s bank account',
                          style: TextStyles.font14lightBlackRegular,
                        ),
                        verticalSpace(10),
                        const AppTextFormField(
                            hintText: 'Enter Company’s bank account'),
                        verticalSpace(20),
                        Text(
                          'Company’s terms for payment and delivery',
                          style: TextStyles.font14lightBlackRegular,
                        ),
                        verticalSpace(10),
                        const AppTextFormField(
                            hintText: 'Enter company’s terms'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: AppTextButton(
              onPressed: () {},
              textButton: 'Continue',
            ),
          ),
        ],
      )),
    );
  }
}

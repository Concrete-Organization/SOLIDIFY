import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_sign_up/widgets/engineer_account_app_bar.dart';
import 'package:solidify/features/auth/sign_up/screens/business_account_sign_up/ui/widgets/business_acount_sign_up_form.dart';

class BusinessAccountSignUpScreen extends StatefulWidget {
  const BusinessAccountSignUpScreen({super.key});

  @override
  State<BusinessAccountSignUpScreen> createState() =>
      _BusinessAccountSignUpScreenState();
}

class _BusinessAccountSignUpScreenState
    extends State<BusinessAccountSignUpScreen> {
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
                      const EngineerAccountAppBar(
                          currentIndex: 0, totalPages: 3),
                      verticalSpace(30),
                      Text(
                        'Identity authentication',
                        style: TextStyles.font24MainBlueSemiBold,
                      ),
                      verticalSpace(40),
                      const BusinessAcountSignUpForm(),
                      verticalSpace(20),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: AppTextButton(
                onPressed: () {
                  context.pushNamed(Routes.contactInfoScreen);
                },
                textButton: 'Continue',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

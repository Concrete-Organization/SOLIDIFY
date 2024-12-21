import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_sign_up/widgets/engineer_account_app_bar.dart';
import 'package:solidify/features/auth/sign_up/screens/business_account_sign_up/ui/widgets/contact_info_form.dart';

class ContactInfoScreen extends StatelessWidget {
  const ContactInfoScreen({super.key});

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
                    children: [
                      verticalSpace(20),
                      const EngineerAccountAppBar(
                          currentIndex: 1, totalPages: 3),
                      verticalSpace(40),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Contact information',
                          style: TextStyles.font24MainBlueSemiBold,
                        ),
                      ),
                      verticalSpace(35),
                      const ContactInfoForm()
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: AppTextButton(
                onPressed: () {
                  context.pushNamed(Routes.financialDetailsScreen);
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

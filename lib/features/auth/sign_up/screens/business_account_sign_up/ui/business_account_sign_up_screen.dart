import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_form_field.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_sign_up/widgets/engineer_account_app_bar.dart';
import 'package:solidify/features/auth/sign_up/screens/business_account_sign_up/ui/widgets/business_acount_sign_up_form.dart';

class BusinessAccountSignUpScreen extends StatelessWidget {
  const BusinessAccountSignUpScreen({super.key});

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
              const EngineerAccountAppBar(currentIndex: 0, totalPages: 3),
              verticalSpace(30),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Identity authentication',
                  style: TextStyles.font24MainBlueSemiBold,
                ),
              ),
              verticalSpace(40),
              const BusinessAcountSignUpForm()
            ],
          ),
        ),
      )),
    );
  }
}

import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/features/auth/sign_up/widgets/sign_up_form.dart';

class UserSignUpScreen extends StatelessWidget {
  const UserSignUpScreen({super.key});

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
                GestureDetector(
                  onTap: () => context.pop(),
                  child: SvgPicture.asset("assets/svgs/back_button.svg"),
                ),
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

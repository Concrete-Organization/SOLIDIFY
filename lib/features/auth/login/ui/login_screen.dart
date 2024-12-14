import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/core/widgets/app_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SvgPicture.asset('assets/svgs/back_button.svg'),
            verticalSpace(40),
            Text(
              'Sign in to your account',
              style: TextStyles.font24MainBlueMedium,
            ),
            verticalSpace(60),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: TextStyles.font14lightBlackRegular,
                  ),
                  verticalSpace(5),
                  const AppTextFormField(
                    hintText: 'enter your email',
                    contentPadding: EdgeInsets.all(10),
                  ),
                  verticalSpace(10),
                  Text(
                    'Password',
                    style: TextStyles.font14lightBlackRegular,
                  ),
                  AppTextFormField(
                    hintText: 'Password',
                    contentPadding: const EdgeInsets.all(10),
                    isObscureText: isObscureText,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isObscureText = !isObscureText;
                        });
                      },
                      child: Icon(
                        isObscureText ? Icons.visibility_off : Icons.visibility,
                        color: isObscureText
                            ? ColorsManager.mainBlue
                            : ColorsManager.secondaryGold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            AppTextButton(onPressed: () {}, textButton: 'sign up')
          ]),
        ),
      ),
    );
  }
}

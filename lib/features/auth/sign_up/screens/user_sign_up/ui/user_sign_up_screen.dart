import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/features/auth/sign_up/screens/user_sign_up/ui/widgets/user_sign_up_bloc_listener.dart';
import 'package:solidify/features/auth/sign_up/screens/user_sign_up/ui/widgets/user_sign_up_form.dart';
import 'package:solidify/features/auth/sign_up/screens/user_sign_up/logic/user_sign_up_cubit.dart';

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
                const UserSignUpForm(),
                verticalSpace(40),
                AppTextButton(
                  onPressed: () {
                    validateThenDoSignup(context);
                  },
                  textButton: 'Sign Up',
                ),
                const UserSignUpBlocListener(),
                verticalSpace(20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<UserSignUpCubit>().formKey.currentState!.validate()) {
      context.read<UserSignUpCubit>().emitUserSignupStates();
    }
  }
}

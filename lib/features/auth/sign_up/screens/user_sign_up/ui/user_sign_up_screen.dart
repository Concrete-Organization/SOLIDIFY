import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/features/auth/sign_up/widgets/sign_up_form.dart';
import 'package:solidify/features/auth/sign_up/screens/user_sign_up/logic/user_sign_up_cubit.dart';
import 'package:solidify/features/auth/sign_up/screens/user_sign_up/logic/user_sign_up_state.dart';

class UserSignUpScreen extends StatelessWidget {
  const UserSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: BlocListener<UserSignUpCubit, UserSignUpState>(
          listener: (context, state) {
            state.map(
              initial: (_) {},
              userSignUpLoading: (_) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) =>
                      const Center(child: CircularProgressIndicator()),
                );
              },
              userSignUpsuccess: (_) {
                Navigator.of(context).pop();
                context.pushNamedAndRemoveUntil(
                  Routes.homeScreen,
                  predicate: (Route<dynamic> route) => false,
                );
              },
              userSignUpError: (errorState) {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red,
                    content: Text(
                      errorState.error.message,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            );
          },
          child: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpace(20),
                          GestureDetector(
                            onTap: () => context.pop(),
                            child:
                                SvgPicture.asset("assets/svgs/back_button.svg"),
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
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: AppTextButton(
                      onPressed: () {
                        if (formKey.currentState?.validate() ?? false) {
                          final cubit = context.read<UserSignUpCubit>();
                          cubit.emitUserSignupStates(
                            name: cubit.nameController.text,
                            email: cubit.emailController.text,
                            phoneNumber:
                                int.tryParse(cubit.addressController.text) ?? 0,
                            password: cubit.passwordController.text,
                            confirmPassword:
                                cubit.confirmPasswordController.text,
                            address: cubit.addressController.text,
                          );
                        }
                      },
                      textButton: 'Sign Up',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

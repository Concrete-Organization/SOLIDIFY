import 'package:flutter/material.dart';
import '../../../../../../../core/helpers/spacing.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/helpers/app_regex.dart';
import '../../../../../../../core/theming/text_styles.dart';
import '../../../../../../../core/theming/color_manger.dart';
import '../../../../../../../core/widgets/app_text_form_field.dart';
import 'package:solidify/features/auth/sign_up/widgets/password_validations.dart';
import 'package:solidify/features/auth/sign_up/screens/user_sign_up/logic/user_sign_up_cubit.dart';

class UserSignUpForm extends StatefulWidget {
  const UserSignUpForm({super.key});

  @override
  State<UserSignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<UserSignUpForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  bool hasLowerCaseAndUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  bool showPasswordValidations = false;

  late UserSignUpCubit cubit;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    cubit = context.read<UserSignUpCubit>();
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    cubit.passwordController.addListener(() {
      setState(() {
        hasLowerCaseAndUpperCase =
            AppRegex.hasUpperAndLowerCase(cubit.passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(cubit.passwordController.text);
        hasNumber = AppRegex.hasNumber(cubit.passwordController.text);
        hasMinLength = AppRegex.hasMinLength(cubit.passwordController.text);
        showPasswordValidations = cubit.passwordController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    cubit.nameController.dispose();
    cubit.emailController.dispose();
    cubit.passwordController.dispose();
    cubit.confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Username',
            style: TextStyles.font14lightBlackRegular,
          ),
          verticalSpace(5),
          AppTextFormField(
            controller: cubit.nameController,
            hintText: 'Enter your User Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid Name';
              }
              return null;
            },
          ),
          verticalSpace(20),
          Text('Email', style: TextStyles.font14lightBlackRegular),
          verticalSpace(5),
          AppTextFormField(
            controller: cubit.emailController,
            hintText: 'Enter your email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          verticalSpace(20),
          Text(
            'Password',
            style: TextStyles.font14lightBlackRegular,
          ),
          verticalSpace(5),
          AppTextFormField(
            controller: cubit.passwordController,
            hintText: 'Enter your password',
            isObscureText: isPasswordObscureText,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
              return null;
            },
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(
                isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
                color: isPasswordObscureText
                    ? ColorsManager.mainBlue
                    : ColorsManager.secondaryGold,
              ),
            ),
          ),
          verticalSpace(20),
          Text(
            'Confirm Password',
            style: TextStyles.font14lightBlackRegular,
          ),
          verticalSpace(5),
          AppTextFormField(
            controller: cubit.confirmPasswordController,
            hintText: 'Enter your password',
            isObscureText: isPasswordConfirmationObscureText,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              } else if (value != cubit.passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordConfirmationObscureText =
                      !isPasswordConfirmationObscureText;
                });
              },
              child: Icon(
                isPasswordConfirmationObscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: isPasswordConfirmationObscureText
                    ? ColorsManager.mainBlue
                    : ColorsManager.secondaryGold,
              ),
            ),
          ),
          verticalSpace(20),
          if (showPasswordValidations) ...[
            PasswordValidations(
              hasLowerCaseAndUpperCase: hasLowerCaseAndUpperCase,
              hasSpecialCharacters: hasSpecialCharacters,
              hasNumber: hasNumber,
              hasMinLength: hasMinLength,
            ),
            verticalSpace(18),
          ],
        ],
      ),
    );
  }
}

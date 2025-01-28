import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/helpers/app_regex.dart';
import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../core/theming/color_manger.dart';
import '../../../../../../../core/theming/text_styles.dart';
import '../../../../../../../core/widgets/app_text_form_field.dart';
import '../../../../widgets/password_validations.dart';
import '../../logic/engineer_sign_up_cubit.dart';

class EngineerPasswordSignUpForm extends StatefulWidget {
  const EngineerPasswordSignUpForm({super.key});

  @override
  State<EngineerPasswordSignUpForm> createState() =>
      _EngineerPasswordSignUpFormState();
}

class _EngineerPasswordSignUpFormState
    extends State<EngineerPasswordSignUpForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  bool hasLowerCaseAndUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  bool showPasswordValidations = false;

  late TextEditingController passwordController;
  late EngineerSignUpCubit cubit;

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
  void initState() {
    super.initState();
    cubit = context.read<EngineerSignUpCubit>();
    setupPasswordControllerListener();
  }

  @override
  void dispose() {
    cubit.passwordController.dispose();
    cubit.confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Create your account",
          style: TextStyles.font24MainBlueMedium,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(20),
                Form(
                  key: cubit.passwordFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                            isPasswordObscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
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
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/extensions.dart';
import '../../../../../core/helpers/app_regex.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/routes/routes_name.dart';
import '../../../../../core/theming/color_manger.dart';
import '../../../../../core/theming/text_styles.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class LoginForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
            style: TextStyles.font14lightBlackRegular,
          ),
          verticalSpace(5),
          AppTextFormField(
            hintText: 'Enter your email',
            controller: widget.emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              } else if (!AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          verticalSpace(18),
          Text(
            'Password',
            style: TextStyles.font14lightBlackRegular,
          ),
          verticalSpace(5),
          AppTextFormField(
            hintText: 'Enter your password',
            controller: widget.passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              } else if (!AppRegex.isPasswordValid(value)) {
                return 'Password must be at least 8 characters long, include:\nan upper case letter, a number, and a special character';
              }
              return null;
            },
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
          verticalSpace(18),
          InkWell(
            onTap: () {
              context.pushNamed(Routes.forgetPasswordScreen);
            },
            child: Text(
              'Forget Password?',
              style: TextStyles.font15MainBlueRegular,
            ),
          ),
        ],
      ),
    );
  }
}

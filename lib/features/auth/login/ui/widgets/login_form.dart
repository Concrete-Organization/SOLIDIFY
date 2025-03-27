import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/app_validation.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/app_text_form_field.dart';

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
            validator: validateEmail,
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
            validator: validatePassword,
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

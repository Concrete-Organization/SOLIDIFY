import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/features/auth/login/logic/login_cubit.dart';
import 'package:solidify/features/auth/login/ui/widgets/login_form.dart';

class LoginFormWithButton extends StatefulWidget {
  const LoginFormWithButton({super.key});

  @override
  State<LoginFormWithButton> createState() => _LoginFormWithButtonState();
}

class _LoginFormWithButtonState extends State<LoginFormWithButton> {

  late LoginCubit cubit;

  @override
  void initState() {
    cubit = BlocProvider.of<LoginCubit>(context);
    super.initState();
  }

  void _submitForm() {
    if (cubit.formKey.currentState!.validate()) {
      final email = cubit.emailController.text;
      final password = cubit.passwordController.text;
      context.read<LoginCubit>().emitLoginStates(email, password);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoginForm(
          formKey: cubit.formKey,
          emailController: cubit.emailController,
          passwordController: cubit.passwordController,
        ),
        verticalSpace(46),
        AppTextButton(
          onPressed: _submitForm,
          textButton: 'Sign in',
        ),
      ],
    );
  }
}

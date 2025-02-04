import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/app_validation.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/features/auth/forget_password/logic/forget_password_cubit.dart';
import '../../../../../core/helpers/shared_pref_helper.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({super.key});

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {

  late ForgetPasswordCubit cubit;

  @override
  void initState() {
    cubit = BlocProvider.of<ForgetPasswordCubit>(context);
    super.initState();
  }

  void _submitForm() async {
    if (cubit.formKey.currentState!.validate()) {
      final String email = cubit.emailController.text;
      await SharedPrefHelper.setData('email', email);
      cubit.resetPassword(email);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Forgot password',
            style: TextStyles.font24MainBlueMedium,
          ),
          verticalSpace(6),
          Text(
            'Enter your email to reset password',
            style: TextStyles.font12lightBlackLight,
          ),
          verticalSpace(16),
          Text(
            'Email',
            style: TextStyles.font14lightBlackRegular,
          ),
          verticalSpace(5),
          AppTextFormField(
            hintText: 'Enter your email',
            controller: context.read<ForgetPasswordCubit>().emailController,
            validator: validateEmail,
          ),
          const Spacer(),
          AppTextButton(
            onPressed: _submitForm,
            textButton: 'Continue',
          ),
          verticalSpace(20),
        ],
      ),
    );
  }
}
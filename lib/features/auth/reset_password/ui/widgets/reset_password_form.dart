import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/app_validation.dart';
import 'package:solidify/core/widgets/custom_snack_bar.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/color_manger.dart';
import '../../../../../core/theming/text_styles.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../logic/reset_password_cubit.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isPasswordHidden = true;
  bool _isConfirmPasswordHidden = true;

  void togglePasswordVisibility() {
    setState(() {
      _isPasswordHidden = !_isPasswordHidden;
    });
  }

  void toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordHidden = !_isConfirmPasswordHidden;
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final String newPassword = _newPasswordController.text;
      final String confirmPassword = _confirmPasswordController.text;
      if (newPassword.isEmpty || confirmPassword.isEmpty) {
        CustomSnackBar.showError(
          context,
          'Please fill in both password fields',
        );
        return;
      }
      if (newPassword != confirmPassword) {
        CustomSnackBar.showError(
          context,
          'Passwords do not match',
        );
        return;
      }
      context.read<ResetPasswordCubit>().resetPassword(newPassword, confirmPassword);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Password',
            style: TextStyles.font14lightBlackRegular,
          ),
          verticalSpace(5),
          AppTextFormField(
            controller: _newPasswordController,
            hintText: 'Password',
            isObscureText: _isPasswordHidden,
            validator: validatePassword,
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordHidden
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: _isPasswordHidden
                    ? ColorsManager.mainBlue
                    : ColorsManager.secondaryGold,
              ),
              onPressed: togglePasswordVisibility,
            ),
          ),
          verticalSpace(20),
          Text(
            'Confirm Password',
            style: TextStyles.font14lightBlackRegular,
          ),
          verticalSpace(5),
          AppTextFormField(
            controller: _confirmPasswordController,
            hintText: 'Confirm Password',
            isObscureText: _isConfirmPasswordHidden,
            validator: (value) => validateConfirmPassword(
              value,
              _newPasswordController.text,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _isConfirmPasswordHidden
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: _isPasswordHidden
                    ? ColorsManager.mainBlue
                    : ColorsManager.secondaryGold,
              ),
              onPressed: toggleConfirmPasswordVisibility,
            ),
          ),
          const Spacer(),
          AppTextButton(
            onPressed: _submitForm,
            textButton: 'Done',
          ),
          verticalSpace(20),
        ],
      ),
    );
  }
}

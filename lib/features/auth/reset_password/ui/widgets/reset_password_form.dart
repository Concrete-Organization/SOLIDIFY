import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/app_validation.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/color_manger.dart';
import '../../../../../core/theming/text_styles.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../logic/reset_password_cubit.dart';

class ResetPasswordForm extends StatefulWidget {
  final bool isPasswordHidden;
  final bool isConfirmPasswordHidden;

  const ResetPasswordForm({
    super.key,
    required this.isPasswordHidden,
    required this.isConfirmPasswordHidden,
  });

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  late ResetPasswordCubit cubit;

  @override
  void initState() {
    cubit = BlocProvider.of<ResetPasswordCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Password',
            style: TextStyles.font14lightBlackRegular,
          ),
          verticalSpace(5),
          AppTextFormField(
            controller: cubit.newPasswordController,
            hintText: 'Password',
            isObscureText: widget.isPasswordHidden,
            validator: validatePassword,
            suffixIcon: IconButton(
              icon: Icon(
                widget.isPasswordHidden
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: widget.isPasswordHidden
                    ? ColorsManager.mainBlue
                    : ColorsManager.secondaryGold,
              ),
              onPressed: cubit.togglePasswordVisibility,
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
            hintText: 'Confirm Password',
            isObscureText: widget.isConfirmPasswordHidden,
            validator: (value) => validateConfirmPassword(
              value,
              cubit.confirmPasswordController.text,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                widget.isConfirmPasswordHidden
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: widget.isConfirmPasswordHidden
                    ? ColorsManager.mainBlue
                    : ColorsManager.secondaryGold,
              ),
              onPressed: cubit.toggleConfirmPasswordVisibility,
            ),
          ),
          const Spacer(),
          AppTextButton(
            onPressed: cubit.resetPassword,
            textButton: 'Done',
          ),
          verticalSpace(20),
        ],
      ),
    );
  }
}
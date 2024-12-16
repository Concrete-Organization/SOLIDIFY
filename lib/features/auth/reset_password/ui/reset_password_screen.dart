import 'package:flutter/material.dart';
import 'package:solidify/features/auth/reset_password/ui/widgets/reset_password_form.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Reset password',
          style: TextStyles.font24MainBlueMedium,
        ),
        verticalSpace(6),
        Text(
          'Secure your account with new password',
          style: TextStyles.font12lightBlacklight,
        ),
        verticalSpace(16),
        const ResetPasswordForm(),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class ForgetPasswordEnterEmailScreen extends StatelessWidget {
  const ForgetPasswordEnterEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const AppTextFormField(
          hintText: 'Enter your email',
        ),
      ],
    );
  }
}

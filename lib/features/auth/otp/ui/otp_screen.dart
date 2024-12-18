import 'package:flutter/material.dart';
import 'package:solidify/features/auth/otp/ui/widgets/otp_form.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
          'Enter the otp sent to your email',
          style: TextStyles.font12lightBlackLight,
        ),
        verticalSpace(16),
        Text(
          'OTP',
          style: TextStyles.font14lightBlackRegular,
        ),
        verticalSpace(5),
        const OtpForm(),
      ],
    );
  }
}

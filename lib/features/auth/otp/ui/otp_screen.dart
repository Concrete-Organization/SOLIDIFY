import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/custom_app_bar_with_indicator.dart';
import 'package:solidify/features/auth/otp/ui/widgets/otp_bloc_listener.dart';
import 'package:solidify/features/auth/otp/ui/widgets/otp_form.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(20),
              const CustomAppBarWithIndicator(
                currentIndex: 1,
                totalPages: 3,
              ),
              verticalSpace(40),
              Text(
                'Forgot password',
                style: TextStyles.font24MainBlueMedium,
              ),
              verticalSpace(6),
              Text(
                'Enter the OTP sent to your email',
                style: TextStyles.font12lightBlackLight,
              ),
              verticalSpace(16),
              Text(
                'OTP',
                style: TextStyles.font14lightBlackRegular,
              ),
              verticalSpace(5),
              const Expanded(
                child: OtpForm(),
              ),
              const OtpBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}

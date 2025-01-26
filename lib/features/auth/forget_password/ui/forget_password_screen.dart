import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/widgets/custom_app_bar_with_indicator.dart';
import 'package:solidify/features/auth/forget_password/ui/widgets/forget_password_bloc_listener.dart';
import 'package:solidify/features/auth/forget_password/ui/widgets/forget_password_form.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SafeArea(
          child: Column(
            children: [
              verticalSpace(20),
              const CustomAppBarWithIndicator(
                currentIndex: 0,
                totalPages: 3,
              ),
              verticalSpace(40),
              const Expanded(
                child: ForgetPasswordForm(),
              ),
              const ForgetPasswordBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}

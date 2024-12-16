import 'package:flutter/material.dart';
import 'package:solidify/features/auth/forget_password/ui/widgets/forget_password_enter_email_screen.dart';
import '../../../otp/ui/otp_screen.dart';
import '../../../reset_password/ui/reset_password_screen.dart';

List<Widget> forgetPasswordPages = [
  const ForgetPasswordEnterEmailScreen(),
  const OtpScreen(),
  const ResetPasswordScreen(),
];
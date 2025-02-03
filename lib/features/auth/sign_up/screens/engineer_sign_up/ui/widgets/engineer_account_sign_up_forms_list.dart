import 'package:flutter/material.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_sign_up/ui/widgets/engineer_password_sign_up_form.dart';
import 'engineer_identity_auth_form.dart';
import 'engineer_user_and_email_sign_up_form.dart';

List<Widget> engineerAccountSignUpFormsScreensList = [
  const EngineerUserAndEmailSignUpForm(),
  const EngineerPasswordSignUpForm(),
  const EngineerIdentityAuthForm(),
];
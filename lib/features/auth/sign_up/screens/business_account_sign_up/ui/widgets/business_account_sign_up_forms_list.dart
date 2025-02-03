import 'package:flutter/material.dart';
import 'package:solidify/features/auth/sign_up/screens/business_account_sign_up/ui/widgets/business_identity_auth_form.dart';
import 'package:solidify/features/auth/sign_up/screens/business_account_sign_up/ui/widgets/business_password_sign_up_form.dart';
import 'package:solidify/features/auth/sign_up/screens/business_account_sign_up/ui/widgets/business_user_and_email_sign_up_form.dart';

List<Widget> businessAccountSignUpFormsScreens = [
  const BusinessIdentityAuthForm(),
  const BusinessUserAndEmailSignUpForm(),
  const BusinessPasswordSignUpForm()
];

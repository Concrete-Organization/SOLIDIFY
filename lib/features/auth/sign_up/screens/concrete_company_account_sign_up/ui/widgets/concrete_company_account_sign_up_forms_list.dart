import 'package:flutter/material.dart';
import 'package:solidify/features/auth/sign_up/screens/concrete_company_account_sign_up/ui/widgets/concrete_company_identity_auth_form.dart';
import 'package:solidify/features/auth/sign_up/screens/concrete_company_account_sign_up/ui/widgets/concrete_company_password_sign_up_form.dart';
import 'package:solidify/features/auth/sign_up/screens/concrete_company_account_sign_up/ui/widgets/concrete_company_user_and_email_sign_up_form.dart';

List<Widget> concreteCompanyAccountSignUpFormsScreens = [
  const ConcreteCompanyIdentityAuthForm(),
  const ConcreteCompanyUserAndEmailSignUpForm(),
  const ConcreteCompanyPasswordSignUpForm()
];

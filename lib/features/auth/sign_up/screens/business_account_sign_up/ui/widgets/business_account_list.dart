import 'package:flutter/material.dart';
import 'package:solidify/features/auth/sign_up/screens/business_account_sign_up/ui/widgets/contact_info_screen.dart';
import 'package:solidify/features/auth/sign_up/screens/business_account_sign_up/ui/widgets/financial_details_screen.dart';
import 'package:solidify/features/auth/sign_up/screens/business_account_sign_up/ui/widgets/identity_auth_screen.dart';

List<Widget> businessAccountSignUpScreens = [
  const IdentityAuthScreen(),
  const ContactInfoScreen(),
  const FinancialDetailsScreen()
];

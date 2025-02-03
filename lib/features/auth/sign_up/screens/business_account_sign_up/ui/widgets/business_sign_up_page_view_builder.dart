import 'package:flutter/material.dart';
import 'package:solidify/features/auth/sign_up/screens/business_account_sign_up/ui/widgets/business_account_sign_up_forms_list.dart';


class BusinessSignUpPageViewBuilder extends StatelessWidget {
  final PageController controller;
  final Function(int) onPageChanged;

  const BusinessSignUpPageViewBuilder({
    super.key,
    required this.controller,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller,
      itemCount: businessAccountSignUpFormsScreens.length,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) => businessAccountSignUpFormsScreens[index],
    );
  }
}

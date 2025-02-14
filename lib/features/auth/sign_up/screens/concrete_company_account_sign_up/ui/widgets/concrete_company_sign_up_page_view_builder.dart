import 'package:flutter/material.dart';
import 'package:solidify/features/auth/sign_up/screens/concrete_company_account_sign_up/ui/widgets/concrete_company_account_sign_up_forms_list.dart';


class ConcreteCompanySignUpPageViewBuilder extends StatelessWidget {
  final PageController controller;
  final Function(int) onPageChanged;

  const ConcreteCompanySignUpPageViewBuilder({
    super.key,
    required this.controller,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller,
      itemCount: concreteCompanyAccountSignUpFormsScreens.length,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) => concreteCompanyAccountSignUpFormsScreens[index],
    );
  }
}

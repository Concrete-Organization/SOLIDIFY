import 'package:flutter/material.dart';
import 'engineer_account_sign_up_forms_list.dart';


class EngineerSignUpPageViewBuilder extends StatelessWidget {
  final PageController controller;
  final Function(int) onPageChanged;

  const EngineerSignUpPageViewBuilder({
    super.key,
    required this.controller,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller,
      itemCount: engineerAccountSignUpFormsScreensList.length,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) => engineerAccountSignUpFormsScreensList[index],
    );
  }
}
import 'package:flutter/material.dart';
import 'engineer_account_list.dart';


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
      itemCount: engineerAccountSignUpScreensList.length,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) => engineerAccountSignUpScreensList[index],
    );
  }
}
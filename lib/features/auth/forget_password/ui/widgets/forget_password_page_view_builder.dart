import 'package:flutter/material.dart';

import 'forget_password_pages_list.dart';

class ForgetPasswordPageViewBuilder extends StatelessWidget {
  final PageController controller;
  final Function(int) onPageChanged;

  const ForgetPasswordPageViewBuilder({
    super.key,
    required this.controller,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller,
      itemCount: forgetPasswordPages.length,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) => forgetPasswordPages[index],
    );
  }
}

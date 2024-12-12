import 'package:flutter/material.dart';
import '../model/onboarding_model.dart';
import 'onboarding_content.dart';

class OnboardingPageViewBuilder extends StatelessWidget {
  final PageController controller;
  final List<OnboardingModel> onboardingList;
  final Function(int) onPageChanged;

  const OnboardingPageViewBuilder({
    super.key,
    required this.controller,
    required this.onboardingList,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: onboardingList.length,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) {
        return OnboardingContent(
          onboardingModel: onboardingList[index],
        );
      },
    );
  }
}

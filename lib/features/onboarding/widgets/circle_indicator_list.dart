import 'package:flutter/material.dart';
import 'package:solidify/features/onboarding/model/onboarding_model.dart';
import 'package:solidify/features/onboarding/widgets/circle_indicator.dart';

class CircleIndicatorList extends StatelessWidget {
  final int currentIndex;
  final List<OnboardingModel> onboardingList;

  const CircleIndicatorList({
    super.key,
    required this.onboardingList,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        onboardingList.length,
            (index) => CircleIndicator(
          currentIndex: currentIndex,
          index: index,
        ),
      ),
    );
  }
}
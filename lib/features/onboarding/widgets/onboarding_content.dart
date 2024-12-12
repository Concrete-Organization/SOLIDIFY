import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/features/onboarding/model/onboarding_model.dart';

class OnboardingContent extends StatelessWidget {
  final OnboardingModel onboardingModel;

  const OnboardingContent({super.key, required this.onboardingModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(onboardingModel.imagePath),
        verticalSpace(50),
        Text(
          onboardingModel.title,
          style: TextStyles.font18MainBlueBold,
          textAlign: TextAlign.center,
        ),
        verticalSpace(10),
        Text(
          onboardingModel.body,
          style: TextStyles.font14lightBlackRegular,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

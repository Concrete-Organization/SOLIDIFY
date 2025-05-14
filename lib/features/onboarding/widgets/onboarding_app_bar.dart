import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/features/onboarding/model/onboarding_model.dart';
import 'package:solidify/features/onboarding/widgets/circle_indicator_list.dart';

class OnboardingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int currentIndex;
  final int totalPages;
  final PageController pageController;

  const OnboardingAppBar({
    super.key,
    required this.currentIndex,
    required this.totalPages,
    required this.pageController,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: AppBar(
        title: CircleIndicatorList(
          onboardingList: getOnBoardingList(),
          currentIndex: currentIndex,
        ),
        titleSpacing: 30,
        actions: [
          if (currentIndex < totalPages - 1)
            GestureDetector(
              onTap: () {
                pageController.jumpToPage(totalPages -1);
              },
              child: Text(
                'Skip',
                style: TextStyles.font15MainBlueMedium,
              ),
            ),
        ],
      ),
    );
  }
}

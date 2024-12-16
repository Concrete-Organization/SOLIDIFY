import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/features/onboarding/widgets/onboarding_app_bar.dart';
import 'package:solidify/features/onboarding/widgets/onboarding_page_view_builder.dart';
import 'model/onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  void _onNextPage() {
    if (currentPage < getOnBoardingList().length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<OnboardingModel> onboardingList = getOnBoardingList();
    return Scaffold(
      appBar: OnboardingAppBar(
        currentIndex: currentPage,
        totalPages: onboardingList.length,
        pageController: _controller,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              verticalSpace(67),
              Expanded(
                child: OnboardingPageViewBuilder(
                  controller: _controller,
                  onboardingList: onboardingList,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                ),
              ),
              if (currentPage == onboardingList.length - 1)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AppTextButton(
                      onPressed: () {
                        context.pushReplacementNamed(Routes.loginScreen);
                      },
                      textButton: 'Login',
                      width: 166.w,
                    ),
                    AppTextButton(
                      onPressed: () {
                        context.pushNamed(Routes.selectAccountTypeScreen);
                      },
                      textButton: 'Register',
                      width: 166.w,
                      backgroundColor: ColorsManager.white,
                      textColor: ColorsManager.mainBlue,
                    ),
                  ],
                )
              else
                AppTextButton(
                  onPressed: _onNextPage,
                  textButton: 'Next',
                ),
              verticalSpace(25),
            ],
          ),
        ),
      ),
    );
  }
}

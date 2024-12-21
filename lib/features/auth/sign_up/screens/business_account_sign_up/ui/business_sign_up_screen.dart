import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/features/auth/sign_up/screens/business_account_sign_up/ui/widgets/business_account_list.dart';
import 'package:solidify/features/auth/sign_up/screens/business_account_sign_up/ui/widgets/business_sign_up_page_view_builder.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/widgets/app_text_button.dart';
import '../../../../../../core/widgets/custom_app_bar_with_indicator.dart';

class BusinessSignUpScreen extends StatefulWidget {
  const BusinessSignUpScreen({super.key});

  @override
  State<BusinessSignUpScreen> createState() => _BusinessSignUpScreenState();
}

class _BusinessSignUpScreenState extends State<BusinessSignUpScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  void _onNextPage() {
    if (currentPage < businessAccountSignUpScreens.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(20),
              CustomAppBarWithIndicator(
                currentIndex: currentPage,
                totalPages: businessAccountSignUpScreens.length,
              ),
              verticalSpace(40),
              Expanded(
                child: BusinessSignUpPageViewBuilder(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                ),
              ),
              AppTextButton(
                onPressed: _onNextPage,
                textButton: currentPage == businessAccountSignUpScreens.length - 1
                    ? 'Done'
                    : 'Continue',
              ),
              verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }
}

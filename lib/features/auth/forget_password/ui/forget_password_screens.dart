import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/features/auth/forget_password/ui/widgets/forget_password_app_bar.dart';
import 'package:solidify/features/auth/forget_password/ui/widgets/forget_password_page_view_builder.dart';
import 'package:solidify/features/auth/forget_password/ui/widgets/forget_password_pages_list.dart';
import '../../../../core/widgets/app_text_button.dart';

class ForgetPasswordScreens extends StatefulWidget {
  const ForgetPasswordScreens({super.key});

  @override
  State<ForgetPasswordScreens> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreens> {
  final PageController _controller = PageController();
  int currentPage = 0;

  void _onNextPage() {
    if (currentPage < forgetPasswordPages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SafeArea(
          child: Column(
            children: [
              verticalSpace(20),
              ForgetPasswordAppBar(
                currentIndex: currentPage,
                totalPages: forgetPasswordPages.length,
              ),
              verticalSpace(40),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: ForgetPasswordPageViewBuilder(
                    controller: _controller,
                    onPageChanged: (index) {
                      setState(() {
                        currentPage = index;
                      });
                    },
                  ),
                ),
              ),
              AppTextButton(
                onPressed: _onNextPage,
                textButton: 'Continue',
              ),
              verticalSpace(22),
            ],
          ),
        ),
      ),
    );
  }
}

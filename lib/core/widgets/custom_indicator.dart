import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/theming/color_manger.dart';

class CustomIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const CustomIndicator({
    super.key,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
            (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 3.h,
          width: 40.w,
          decoration: BoxDecoration(
            color: index <= currentPage
                ? ColorsManager.mainBlue
                : ColorsManager.mainBlueWith50Opacity,
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
      ),
    );
  }
}

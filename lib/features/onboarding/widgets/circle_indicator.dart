import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/theming/color_manger.dart';

class CircleIndicator extends StatelessWidget {
  final int currentIndex;
  final int index;

  const CircleIndicator({
    super.key,
    required this.currentIndex,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: currentIndex == index ? 10.h : 6.h,
      width: currentIndex == index ? 10.w : 6.w,
      margin: EdgeInsets.only(right: 10.w),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currentIndex == index
            ? ColorsManager.mainBlue
            : ColorsManager.mainBlueWith50Opacity,
      ),
    );
  }
}

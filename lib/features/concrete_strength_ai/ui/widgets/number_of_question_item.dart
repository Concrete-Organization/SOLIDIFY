import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';

class NumberOfQuestionItem extends StatelessWidget {
  final String number;
  final bool isFocused;
  final bool hasText;

  const NumberOfQuestionItem({
    super.key,
    required this.number,
    required this.isFocused,
    required this.hasText,
  });

  @override
  Widget build(BuildContext context) {
    final hasText = this.hasText;
    final isFocused = this.isFocused;

    final containerBorderColor = hasText
        ? ColorsManager.mainBlue
        : isFocused
        ? ColorsManager.secondaryGold
        : ColorsManager.mainBlue;

    final numberContainerColor = hasText
        ? ColorsManager.mainBlue
        : isFocused
        ? ColorsManager.secondaryGold
        : ColorsManager.white;

    final numberColor = hasText
        ? ColorsManager.white
        : isFocused
        ? ColorsManager.white
        : ColorsManager.mainBlue;

    final additionalBorderColor = hasText
        ? ColorsManager.mainBlue
        : ColorsManager.secondaryGold;

    return Container(
      padding: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: hasText || isFocused
            ? Border.all(
          color: additionalBorderColor,
          width: 1.w,
        )
            : null,
      ),
      child: Container(
        width: 20.w,
        height: 20.h,
        decoration: BoxDecoration(
          color: numberContainerColor,
          shape: BoxShape.circle,
          border: Border.all(
            color: containerBorderColor,
          ),
        ),
        child: Center(
          child: Text(
            number,
            style: TextStyles.font12MainBlueMedium.copyWith(
              color: numberColor,
            ),
          ),
        ),
      ),
    );
  }
}

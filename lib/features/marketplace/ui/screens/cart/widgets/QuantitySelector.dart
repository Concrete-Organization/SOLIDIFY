import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantitySelector({
    Key? key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Minus button
        GestureDetector(
          onTap: onDecrement,
          child: Container(
            width: 17.w,
            height: 16.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorsManager.mainBlueWith1Opacity,
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/svgs/minus_icon.svg',
              width: 10.w,
              height: 10.h,
            ),
          ),
        ),
        SizedBox(width: 4.w),
        // Number display
        Container(
          width: 43.w,
          height: 16.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: ColorsManager.mainBlue),
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Text(
            quantity.toString(),
            style: TextStyles.font10MainBlueSemiBold,
          ),
        ),
        SizedBox(width: 4.w),
        // Plus button
        GestureDetector(
          onTap: onIncrement,
          child: Container(
            width: 17.w,
            height: 16.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorsManager.mainBlueWith1Opacity,
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/svgs/plus_icon.svg',
              width: 10.w,
              height: 10.h,
            ),
          ),
        ),
      ],
    );
  }
}

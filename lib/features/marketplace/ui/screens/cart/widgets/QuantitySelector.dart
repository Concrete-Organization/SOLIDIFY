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
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        decoration: BoxDecoration(
          // A unified border and rounded corners for the entire widget.
          border: Border.all(color: ColorsManager.mainBlue),
          borderRadius: BorderRadius.circular(4.r),
          color: ColorsManager.white,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Minus button container with main blue background.
            GestureDetector(
              onTap: onDecrement,
              child: Container(
                width: 17.w,
                height: 16.h,
                alignment: Alignment.center,
                color: ColorsManager.mainBlue,
                child: SvgPicture.asset(
                  'assets/svgs/minus_icon.svg',
                  width: 10.w,
                  height: 10.h,
                ),
              ),
            ),
            // Number display container with white background and vertical dividers.
            Container(
              width: 43.w,
              height: 16.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ColorsManager.white,
                border: Border.symmetric(
                  vertical: BorderSide(color: ColorsManager.mainBlue),
                ),
              ),
              child: Text(
                quantity.toString(),
                style: TextStyles.font10MainBlueSemiBold,
              ),
            ),
            // Plus button container with main blue background.
            GestureDetector(
              onTap: onIncrement,
              child: Container(
                width: 17.w,
                height: 16.h,
                alignment: Alignment.center,
                color: ColorsManager.mainBlue,
                child: SvgPicture.asset(
                  'assets/svgs/plus_icon.svg',
                  width: 10.w,
                  height: 10.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

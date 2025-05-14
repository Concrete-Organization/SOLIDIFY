import 'package:flutter/material.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CancelOrderButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CancelOrderButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 205.w,
        height: 42.h,
        decoration: BoxDecoration(
          border: Border.all(color: ColorsManager.cancelRed),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            'Cancel order',
            style: TextStyles.font15RedMedium,
          ),
        ),
      ),
    );
  }
}
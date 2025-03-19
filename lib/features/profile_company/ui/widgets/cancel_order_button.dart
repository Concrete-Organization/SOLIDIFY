import 'package:flutter/material.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CancelOrderButton extends StatelessWidget {
  const CancelOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 205,
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
    );
  }
}

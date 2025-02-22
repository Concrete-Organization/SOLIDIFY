import 'package:flutter/material.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SilaBotMessageContainer extends StatelessWidget {
  final String message;

  const SilaBotMessageContainer({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 60.w,
        maxWidth: 227.w,
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: ColorsManager.secondaryGoldWith10Opacity,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: ColorsManager.mainBlue),
      ),
      child: Text(
        message,
        style: TextStyles.font10MainBlueRegular,
      ),
    );
  }
}

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
      // If your message can be long, consider a flexible height or padding
      constraints: BoxConstraints(
        minWidth: 100.w,
        maxWidth: 227.w,
      ),
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(8.w),
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

import 'package:flutter/material.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserMessageContainer extends StatelessWidget {
  final String message;

  const UserMessageContainer({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 100.w,
        maxWidth: 227.w,
      ),
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: ColorsManager.mainBlueWith1Opacity,
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

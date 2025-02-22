import 'package:flutter/material.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserMessageContainer extends StatelessWidget {
  const UserMessageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 227.w,
      height: 52.h,
      decoration: BoxDecoration(
        color: ColorsManager.mainBlueWith1Opacity,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: ColorsManager.mainBlue),
      ),
      child: Text(
        '',
        style: TextStyles.font10MainBlueRegular,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';

class CrackRowResult extends StatelessWidget {
  final String titleResult;
  final String containerResult;

  const CrackRowResult({
    super.key,
    required this.titleResult,
    required this.containerResult,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          titleResult,
          style: TextStyles.font15lightBlackMedium,
        ),
        horizontalSpace(13),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 8.5.h,
            horizontal: 25.w,
          ),
          decoration: BoxDecoration(
            color: ColorsManager.mainBlueWith1Opacity,
            border: Border.all(color: ColorsManager.mainBlue),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Text(
            containerResult,
            style: TextStyles.font12MainBlueSemiBold,
          ),
        ),
      ],
    );
  }
}

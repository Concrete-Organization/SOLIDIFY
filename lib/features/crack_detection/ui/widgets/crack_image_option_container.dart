import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';

class CrackImageOptionContainer extends StatelessWidget {
  final void Function()? onTap;
  final String containerText;
  final String containerIcon;

  const CrackImageOptionContainer({
    super.key,
    this.onTap,
    required this.containerText,
    required this.containerIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 19.h),
        decoration: BoxDecoration(
          color: ColorsManager.mainBlueWith15Opacity,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: ColorsManager.mainBlue),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              containerText,
              style: TextStyles.font15MainBlueRegular,
            ),
            SvgPicture.asset(containerIcon),
          ],
        ),
      ),
    );
  }
}

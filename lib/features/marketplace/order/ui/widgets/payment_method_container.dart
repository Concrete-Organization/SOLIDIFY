import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodContainer extends StatelessWidget {
  final String iconPath;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  final double? iconWidth;
  final double? iconHeight;
  final EdgeInsetsGeometry? imagePadding;

  const PaymentMethodContainer({
    super.key,
    required this.iconPath,
    required this.title,
    required this.isSelected,
    required this.onTap,
    this.iconWidth,
    this.iconHeight,
    this.imagePadding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 353.w,
        height: 56.h,
        decoration: BoxDecoration(
          color: ColorsManager.mainBlueWith5Opacity,
          border: Border.all(
            color: ColorsManager.mainBlue,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            children: [
              Padding(
                padding: imagePadding ?? EdgeInsets.only(right: 15.w),
                child: Image.asset(
                  iconPath,
                  width: iconWidth,
                  height: iconHeight,
                ),
              ),
              Text(
                title,
                style: isSelected
                    ? TextStyles.font13secondaryGoldMedium
                    : TextStyles.font13MainBlueMedium,
              ),
              const Spacer(),
              if (isSelected) SvgPicture.asset('assets/svgs/done_icon.svg'),
            ],
          ),
        ),
      ),
    );
  }
}

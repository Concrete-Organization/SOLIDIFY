import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/theming/text_styles.dart';

class SelectableRowWithCheck extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectableRowWithCheck({
    super.key,
    required this.iconPath,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 0,
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          height: 65.h,
          decoration: BoxDecoration(
            color: ColorsManager.mainBlueWith1Opacity,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: isSelected
                  ? ColorsManager.secondaryGold
                  : ColorsManager.lightBlack,
              width: 1.w,
            ),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                iconPath,
                colorFilter: ColorFilter.mode(
                  isSelected
                      ? ColorsManager.secondaryGold
                      : ColorsManager.mainBlue,
                  BlendMode.srcIn,
                ),
              ),
              horizontalSpace(7),
              Text(
                label,
                style: isSelected
                    ? TextStyles.font15MainBlueMedium.copyWith(
                        color: ColorsManager.secondaryGold,
                      )
                    : TextStyles.font15MainBlueMedium,
              ),
              const Spacer(),
              if (isSelected)
                SvgPicture.asset(
                  'assets/svgs/selected_check_icon.svg',
                ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterNameContainer extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final double width;
  final double height;

  const FilterNameContainer({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: isSelected
              ? ColorsManager.secondaryGold
              : ColorsManager.mainBlueWith1Opacity,
          border: Border.all(
            color: ColorsManager.lightBlack,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Text(
            label,
            style: isSelected
                ? TextStyles.font12WhiteRegular
                : TextStyles.font12LightBlackRegular,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
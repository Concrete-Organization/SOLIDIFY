import 'package:flutter/material.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectedOrderContainer extends StatefulWidget {
  const SelectedOrderContainer({super.key});

  @override
  State<SelectedOrderContainer> createState() => _SelectedOrderContainerState();
}

class _SelectedOrderContainerState extends State<SelectedOrderContainer> {
  bool isActiveSelected = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 251.w,
      height: 40.h,
      decoration: BoxDecoration(
        color: ColorsManager.mainBlueWith15Opacity,
        border: Border.all(color: ColorsManager.secondaryGold),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => isActiveSelected = true),
              child: Container(
                height: 33.h,
                decoration: BoxDecoration(
                  color: isActiveSelected
                      ? ColorsManager.secondaryGold
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Active orders",
                  style: isActiveSelected
                      ? TextStyles.font12WhiteMedium
                      : TextStyles.font12MainBlueMedium,
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => isActiveSelected = false),
              child: Container(
                height: 33.h,
                decoration: BoxDecoration(
                  color: !isActiveSelected
                      ? ColorsManager.secondaryGold
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Completed orders",
                  style: !isActiveSelected
                      ? TextStyles.font12WhiteMedium
                      : TextStyles.font12MainBlueMedium,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

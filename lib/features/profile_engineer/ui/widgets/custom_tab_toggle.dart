import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';

class CustomTabToggle extends StatefulWidget {
  final List<String> tabs;
  final Function(int) onTabSelected;
  final int initialTabIndex;

  const CustomTabToggle({
    super.key,
    required this.tabs,
    required this.onTabSelected,
    this.initialTabIndex = 0,
  });

  @override
  State<CustomTabToggle> createState() => _CustomTabToggleState();
}

class _CustomTabToggleState extends State<CustomTabToggle> {
  late int _selectedTabIndex;

  @override
  void initState() {
    super.initState();
    _selectedTabIndex = widget.initialTabIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.r),
      decoration: BoxDecoration(
        color: ColorsManager.mainBlueWith1Opacity,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: ColorsManager.secondaryGold,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: widget.tabs.asMap().entries.map((entry) {
          final index = entry.key;
          final tabTitle = entry.value;
          final isSelected = index == _selectedTabIndex;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedTabIndex = index;
              });
              widget.onTabSelected(index);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 22.5.w),
              decoration: BoxDecoration(
                color: isSelected
                    ? ColorsManager.secondaryGold
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10.r),
              ),
              alignment: Alignment.center,
              child: Text(
                tabTitle,
                style: isSelected
                    ? TextStyles.font12WhiteMedium
                    : TextStyles.font12MainBlueMedium,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
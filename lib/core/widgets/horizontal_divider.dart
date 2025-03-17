import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/color_manger.dart';

class HorizontalDivider extends StatelessWidget {
  final double? thickness;
  const HorizontalDivider({super.key, this.thickness});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: ColorsManager.mainBlue,
      height: 0.2.h,
      thickness: thickness,
    );
  }
}

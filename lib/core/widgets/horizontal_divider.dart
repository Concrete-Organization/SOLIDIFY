import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/theming/color_manger.dart';

class HorizontalDivider extends StatelessWidget {
  final double? thickness;
  final Color? color;
  const HorizontalDivider({super.key, this.thickness, this.color});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? ColorsManager.mainBlue,
      height: 0.2.h,
      thickness: thickness,
    );
  }
}

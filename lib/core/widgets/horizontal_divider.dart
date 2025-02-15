import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/color_manger.dart';

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: ColorsManager.mainBlue,
      height: 0.2.h,
    );
  }
}

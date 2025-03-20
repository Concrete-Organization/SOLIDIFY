import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerItem extends StatelessWidget {
  final String icon;
  final String title;
  final TextStyle titleStyle;
  final void Function()? onTap;

  const DrawerItem({
    super.key,
    required this.icon,
    required this.title,
    required this.titleStyle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: SvgPicture.asset(
            icon,
          ),
          title: Text(
            title,
            style: titleStyle,
          ),
        ),
      ),
    );
  }
}

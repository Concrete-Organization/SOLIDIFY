import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTopBar extends StatelessWidget {
  const ProfileTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
      child: Row(
        children: [
          SvgPicture.asset('assets/svgs/settings_icon.svg'),
          Spacer(),
          SvgPicture.asset('assets/svgs/notification_icon.svg'),
        ],
      ),
    );
  }
}

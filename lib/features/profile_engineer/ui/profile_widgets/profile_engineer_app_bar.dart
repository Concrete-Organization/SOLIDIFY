import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileEngineerAppBar extends StatelessWidget {
  const ProfileEngineerAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset('assets/svgs/settings.svg'),
          SvgPicture.asset('assets/svgs/notification.svg'),
        ],
      ),
    );
  }
}

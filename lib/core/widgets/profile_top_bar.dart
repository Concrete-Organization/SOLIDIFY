import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTopBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const ProfileTopBar({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => scaffoldKey.currentState?.openDrawer(),
            child: SvgPicture.asset('assets/svgs/settings.svg'),
          ),
          SvgPicture.asset('assets/svgs/notification.svg'),
        ],
      ),
    );
  }
}


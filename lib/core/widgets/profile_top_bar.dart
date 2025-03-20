import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';

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
          GestureDetector(
            onTap: (){
              context.pushNamed(Routes.notificationsScreen);
            },
            child: SvgPicture.asset(
              'assets/svgs/notification.svg',
            ),
          ),
        ],
      ),
    );
  }
}

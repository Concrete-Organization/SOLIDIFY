import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/color_manger.dart';

class CommunityAppBar extends StatelessWidget {
  const CommunityAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          'assets/svgs/search_icon.svg',
          width: 20.w,
          height: 20.h,
        ),
        SvgPicture.asset(
          'assets/svgs/plus_icon.svg',
          width: 20.w,
          height: 20.h,
          colorFilter: ColorFilter.mode(
            ColorsManager.mainBlue,
            BlendMode.srcIn,
          ),
        ),
      ],
    );
  }
}

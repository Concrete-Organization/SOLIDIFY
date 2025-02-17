import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarketPlaceAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MarketPlaceAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset('assets/svgs/search_icon.svg'),
      ),
      actions: [
        GestureDetector(
          child: SvgPicture.asset('assets/svgs/cart_icon.svg'),
        ),
        GestureDetector(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SvgPicture.asset('assets/svgs/list_icon.svg'),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

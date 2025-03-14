import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
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
          onTap: () {
            context.pushNamed(Routes.cartScreen);
          },
          child: SvgPicture.asset('assets/svgs/cart_icon.svg'),
        ),
        GestureDetector(
          onTap: () {
            context.pushNamed(Routes.favoritesScreen);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SvgPicture.asset('assets/svgs/fav_icon.svg'),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

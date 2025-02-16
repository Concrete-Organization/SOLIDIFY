import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/spacing.dart';

class MarketplaceTopBar extends StatelessWidget {
  final String leftIconPath;
  final VoidCallback? onLeftIconTap;

  const MarketplaceTopBar({
    super.key,
    this.leftIconPath = 'assets/svgs/search_icon.svg',
    this.onLeftIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onLeftIconTap ?? () => Navigator.pop(context),
          child: SvgPicture.asset(leftIconPath),
        ),
        const Spacer(),
        GestureDetector(
          child: SvgPicture.asset('assets/svgs/cart_icon.svg'),
        ),
        horizontalSpace(15),
        GestureDetector(
          child: SvgPicture.asset('assets/svgs/list_icon.svg'),
        ),
      ],
    );
  }
}

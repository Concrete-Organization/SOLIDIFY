import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/spacing.dart';

class MarketplaceTopBar extends StatelessWidget {
  const MarketplaceTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          child: SvgPicture.asset('assets/svgs/search_icon.svg'),
        ),
        const Spacer(),
        GestureDetector(
          child: SvgPicture.asset('assets/svgs/cart_icon.svg'),
        ),
        horizontalSpace(15),
        GestureDetector(
          child: SvgPicture.asset('assets/svgs/list_icon.svg'),
        )
      ],
    );
  }
}

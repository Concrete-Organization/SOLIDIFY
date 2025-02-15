import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/features/marketplace/ui/screens/marketplace/widgets/marketplace_top_bar.dart';

class MarketplaceScreen extends StatelessWidget {
  const MarketplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MarketplaceTopBar(),
                  verticalSpace(15),
                  const Divider(
                    color: ColorsManager.mainBlue,
                    height: 0.2,
                  ),
                  verticalSpace(15),
                  SvgPicture.asset('assets/svgs/elcontainer_elbedan.svg'),
                  verticalSpace(20),
                  Row(
                    children: [
                      Text(
                        'Categories',
                        style: TextStyles.font15MainBlueSemiBold,
                      ),
                      const Spacer(),
                      Text(
                        'View All',
                        style: TextStyles.font13MainBlueMedium,
                      )
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}

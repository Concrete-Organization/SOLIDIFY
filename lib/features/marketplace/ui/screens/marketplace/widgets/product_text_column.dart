import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/marketplace/ui/screens/marketplace/widgets/expandable_review_text.dart';

class ProductTextColumn extends StatelessWidget {
  const ProductTextColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top row with title and price
        Row(
          children: [
            Text(
              'Cement',
              style: TextStyles.font15lightBlackMedium,
            ),
            const Spacer(),
            Text(
              '1,000 EGP',
              style: TextStyles.font15MainBlueSemiBold,
            ),
          ],
        ),
        verticalSpace(15),
        // Subtitle
        Text(
          'Ambuja cement',
          style: TextStyles.font15MainBlueMedium,
        ),
        verticalSpace(15),
        // Row for rating and reviews
        Row(
          children: [
            Container(
              width: 50.w, // Slightly increased width
              height: 19.h,
              decoration: BoxDecoration(
                border: Border.all(color: ColorsManager.mainBlue),
                borderRadius: BorderRadius.circular(3.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    color: ColorsManager.mainBlue,
                    size: 14,
                  ),
                  horizontalSpace(4),
                  Text(
                    '4.5',
                    style: TextStyles.font12lightBlackLight,
                  ),
                ],
              ),
            ),
            horizontalSpace(10), // Adjusted for better spacing
            Text(
              '+123',
              style: TextStyles.font14lightBlackRegular,
            ),
          ],
        ),
        verticalSpace(20),
        Row(
          children: [
            Text(
              'Reviews (+123)',
              style: TextStyles.font15lightBlackMedium,
            ),
            const Spacer(),
            Text(
              'View All',
              style: TextStyles.font13MainBlueMedium,
            ),
          ],
        ),
        verticalSpace(20),
        const HorizontalDivider(),
        verticalSpace(20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 6.h),
              child: SvgPicture.asset(
                'assets/svgs/review_dot_icon.svg',
                width: 10.w, // Constrain width to prevent overflow
                height: 10.h,
              ),
            ),
            horizontalSpace(3),
            const Flexible(
              child: ExpandableReviewText(),
            ),
          ],
        ),
      ],
    );
  }
}

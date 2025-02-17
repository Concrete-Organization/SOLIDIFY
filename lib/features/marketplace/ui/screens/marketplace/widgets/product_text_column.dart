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
        Text(
          'Ambuja cement',
          style: TextStyles.font15MainBlueMedium,
        ),
        verticalSpace(15),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
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
            horizontalSpace(10),
            Text(
              '+123 Reviews',
              style: TextStyles.font14lightBlackRegular,
            ),
          ],
        ),
        verticalSpace(20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 6.h),
              child: SvgPicture.asset(
                'assets/svgs/review_dot_icon.svg',
                width: 10.w,
                height: 10.h,
              ),
            ),
            horizontalSpace(5),
            const Flexible(
              child: ExpandableReviewText(),
            ),
          ],
        ),
        verticalSpace(20),
        const HorizontalDivider(),
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
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              width: 45.w,
              height: 19.h,
              color: ColorsManager.mainBlue,
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: ColorsManager.mainBlue,
                  ),
                  horizontalSpace(10),
                  Text(
                    '4.5',
                    style: TextStyles.font12lightBlackLight,
                  ),
                ],
              ),
            ),
            horizontalSpace(25),
            Text(
              '+123',
              style: TextStyles.font14lightBlackRegular,
            ),
          ],
        ),
        verticalSpace(20),
        const ExpandableReviewText(),
      ],
    );
  }
}

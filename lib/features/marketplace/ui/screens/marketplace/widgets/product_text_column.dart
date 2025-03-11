import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/marketplace/ui/screens/marketplace/widgets/expandable_review_text.dart';

class ProductTextColumn extends StatelessWidget {
  final String brandName;
  final String productName;
  final double price;
  final String description;
  final int measurement;
  final int rate;
  final String reviewText; // Add reviewText parameter

  const ProductTextColumn({
    super.key,
    required this.brandName,
    required this.productName,
    required this.price,
    required this.description,
    required this.measurement,
    required this.rate,
    required this.reviewText, // Require reviewText
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              productName,
              style: TextStyles.font15lightBlackMedium,
            ),
            const Spacer(),
            Text(
              '$price EGP',
              style: TextStyles.font15MainBlueSemiBold,
            ),
          ],
        ),
        verticalSpace(15),
        Text(
          brandName,
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
                    '$rate/5',
                    style: TextStyles.font12lightBlackLight,
                  ),
                ],
              ),
            ),
            horizontalSpace(10),
            Text(
              '$measurement units available',
              style: TextStyles.font14lightBlackRegular,
            ),
          ],
        ),
        verticalSpace(20),
        Text(
          'Description',
          style: TextStyles.font15MainBlueSemiBold,
        ),
        verticalSpace(8),
        Text(
          description,
          style: TextStyles.font14lightBlackRegular,
        ),
        verticalSpace(20),
        const HorizontalDivider(),
        verticalSpace(20),
        Row(
          children: [
            Text(
              'Reviews',
              style: TextStyles.font15lightBlackMedium,
            ),
            const Spacer(),
            Text(
              'View All',
              style: TextStyles.font13MainBlueMedium,
            ),
          ],
        ),
        verticalSpace(10),
        ExpandableReviewText(
            reviewText:
                '$reviewText Ambuja cement offers giant compressive strength top-notch quality, combining strength and flexibility for reliable structural support. The product is consistently high-standard, with timely deliveries and excellent customer service '), // Pass reviewText
      ],
    );
  }
}

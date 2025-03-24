import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/marketplace/marketplace/ui/widgets/expandable_review_text.dart';
import 'package:solidify/features/marketplace/marketplace/data/models/get_product_by_id_response_body.dart';

class ProductTextColumn extends StatelessWidget {
  final String brandName;
  final String productName;
  final double price;
  final String description;
  final int rate;
  final String productDescription;
  final List<ReviewModel> reviews;

  const ProductTextColumn({
    super.key,
    required this.brandName,
    required this.productName,
    required this.price,
    required this.description,
    required this.rate,
    required this.productDescription,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                productName,
                style: TextStyles.font15lightBlackMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              '${price.toStringAsFixed(2)} EGP',
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
                    rate.toStringAsFixed(1),
                    style: TextStyles.font12lightBlackLight,
                  ),
                ],
              ),
            ),
            horizontalSpace(10),
            Text(
              '+${reviews.length} Reviews',
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
            Flexible(
              child: ExpandableReviewText(
                productDescription:
                    '$productDescription Ambuja cement offers giant compressive strength top-notch quality, combining strength and flexibility for reliable structural support. The product is consistently high-standard, with timely deliveries and excellent customer service ',
              ),
            ),
          ],
        ),
        verticalSpace(20),
        const HorizontalDivider(),
        verticalSpace(20),
        Row(
          children: [
            Text(
              'Reviews (+${reviews.length})',
              style: TextStyles.font15lightBlackMedium,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                context.pushNamed(Routes.reviewsScreen, arguments: reviews);
              },
              child: Text(
                'View All',
                style: TextStyles.font13MainBlueMedium,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

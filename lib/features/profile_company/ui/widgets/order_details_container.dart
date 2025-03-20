import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';

class OrderDetailsContainer extends StatelessWidget {
  const OrderDetailsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 353.w,
      decoration: BoxDecoration(
        color: ColorsManager.mainBlueWith5Opacity,
        border: Border.all(color: ColorsManager.mainBlue),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          _buildProductItem(
            context: context,
            image: 'assets/images/cement_bag_3x.png',
            name: 'Ambuja cement',
            price: '1,000 EGP',
            qty: '5',
          ),
          const HorizontalDivider(thickness: 0.6),
          _buildProductItem(
            context: context,
            image: 'assets/images/cement_bag_3x.png',
            name: 'Fly ash',
            price: '1,000 EGP',
            qty: '2',
          ),
          const HorizontalDivider(thickness: 0.6),
          _buildProductItem(
            context: context,
            image: 'assets/images/cement_bag_3x.png',
            name: 'White cement',
            price: '900 EGP',
            qty: '1',
          ),
          const HorizontalDivider(thickness: 0.6),
          // Total and Completed Order Row
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 133.w,
                  height: 31.h,
                  decoration: BoxDecoration(
                    color: ColorsManager.mainBlueWith1Opacity,
                    border: Border.all(color: ColorsManager.mainBlue),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Total: ',
                        style: TextStyles.font12LightBlackMedium,
                      ),
                      Text(
                        '7,900EGP',
                        style: TextStyles.font12MainBlueMedium,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Completed order ',
                      style: TextStyles.font12secondaryGoldMedium,
                    ),
                    SvgPicture.asset('assets/svgs/complete_order_icon.svg')
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem({
    required BuildContext context,
    required String image,
    required String name,
    required String price,
    required String qty,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 74.w,
            height: 60.h,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.3.w,
                color: ColorsManager.mainBlue,
              ),
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Image.asset(image),
          ),
          horizontalSpace(15),
          // Product Details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyles.font12LightBlackMedium),
              verticalSpace(8),
              Text(price, style: TextStyles.font12MainBlueMedium),
              verticalSpace(8),
              Text('Qty: $qty', style: TextStyles.font12LightBlackMedium),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              context.pushNamed(Routes.writeReviewScreen);
            },
            child: Container(
              width: 112.w,
              height: 27.h,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.4.w,
                  color: ColorsManager.mainBlue,
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/svgs/write_icon.svg'),
                  horizontalSpace(5),
                  Text(
                    'Write a review',
                    style: TextStyles.font10MainBlueMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

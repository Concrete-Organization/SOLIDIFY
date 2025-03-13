import 'package:flutter/material.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/core/theming/font_weight_helper.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/marketplace/data/models/get_products_by_category_response_model.dart';

class CategoryProductGridViewItem extends StatelessWidget {
  final ProductModel product;
  final bool isCached;

  const CategoryProductGridViewItem({
    super.key,
    required this.product,
    required this.isCached,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: ColorsManager.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
        side: BorderSide(
          color: ColorsManager.mainBlue,
          width: 1.w,
        ),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: ColorsManager.secondaryGold,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.zero,
                    topRight: Radius.zero,
                    bottomLeft: Radius.circular(2.r),
                    bottomRight: Radius.circular(2.r),
                  ),
                ),
                child: Text(
                  '${product.discount}%',
                  style: TextStyles.font10MainBlueRegular,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.favorite_border,
                    color: ColorsManager.mainBlue,
                    size: 22.w,
                  ),
                  onPressed: () {

                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: SizedBox(
              width: 68.w,
              height: 92.h,
              child: Image.network(
                product.imageUri,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => const Icon(Icons.error),
              ),
            ),
          ),
          const HorizontalDivider(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: ColorsManager.mainBlueWith1Opacity,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.r),
                  bottomRight: Radius.circular(10.r),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 8.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        product.brandName ?? '',
                        style: TextStyles.font12lightBlackLight,
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.star,
                        color: ColorsManager.secondaryGold,
                        size: 16,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        product.rate.toString(),
                        style: TextStyles.font12MainBlueMedium,
                      ),
                    ],
                  ),
                  Text(
                    product.name,
                    style: TextStyles.font12lightBlackLight,
                  ),
                  Text(
                    '${product.price} EGP',
                    style: TextStyles.font12MainBlueSemiBold,
                  ),
                  AppTextButton(
                    height: 34.h,
                    borderRadius: 10.r,
                    textButton: 'Add to cart',
                    fontSize: 12.sp,
                    fontWeight: FontWeightHelper.medium,
                    onPressed: () {
                    },
                    backgroundColor: ColorsManager.mainBlue,
                    padding: EdgeInsets.zero,
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

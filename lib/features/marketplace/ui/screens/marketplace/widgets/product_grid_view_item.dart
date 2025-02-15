import 'package:flutter/material.dart';
import 'package:solidify/core/theming/font_weight_helper.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import '../../../../../../core/widgets/app_text_button.dart';

class ProductGridViewItem extends StatefulWidget {
  const ProductGridViewItem({super.key});

  @override
  State<ProductGridViewItem> createState() => _ProductGridViewItemState();
}

class _ProductGridViewItemState extends State<ProductGridViewItem> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
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
                  '20%',
                  style: TextStyles.font10MainBlueRegular,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite
                        ? ColorsManager.secondaryGold
                        : ColorsManager.mainBlue,
                    size: 22.w,
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Image.asset(
              'assets/images/cement_bag.png',
              fit: BoxFit.contain,
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
                        'Cement',
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
                        '4.5',
                        style: TextStyles.font12MainBlueMedium,
                      ),
                    ],
                  ),
                  Text(
                    'Ambuja cement',
                    style: TextStyles.font12lightBlackLight,
                  ),
                  Text(
                    '1,000 EGP',
                    style: TextStyles.font12MainBlueSemiBold,
                  ),
                  AppTextButton(
                    height: 34,
                    borderRadius: 10.r,
                    textButton: 'Add to cart',
                    fontSize: 12.sp,
                    fontWeight: FontWeightHelper.medium,
                    onPressed: () {},
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

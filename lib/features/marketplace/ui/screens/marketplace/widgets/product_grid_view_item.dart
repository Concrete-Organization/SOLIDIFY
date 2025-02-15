import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/widgets/app_text_button.dart';

class ProductGridViewItem extends StatefulWidget {
  const ProductGridViewItem({super.key});

  @override
  State<ProductGridViewItem> createState() => _ProductGridViewItemState();
}

class _ProductGridViewItemState extends State<ProductGridViewItem> {
  bool isFavorite = false; // Toggle for favorite icon

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 169.w,
      height: 235.h,
      child: ClipRect(
        child: Container(
          decoration: BoxDecoration(
            color: ColorsManager.white,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: ColorsManager.mainBlue,
              width: 1.w,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Favorite Icon with Toggle
              Padding(
                padding: EdgeInsets.only(top: 8.h, right: 8.w),
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite
                          ? ColorsManager.secondaryGold
                          : ColorsManager.mainBlue,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                  ),
                ),
              ),

              // Product Image with Divider
              Column(
                children: [
                  SizedBox(
                    height: 90.h,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/cement_bag.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Divider(
                    color: ColorsManager.mainBlue,
                    thickness: 1.h,
                    height: 1.h,
                  ),
                ],
              ),

              // Expanded Product Details area to fill available space
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorsManager.mainBlueWith1Opacity,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r),
                    ),
                  ),
                  padding: EdgeInsets.only(
                    left: 8.w,
                    right: 8.w,
                    top: 4.h,
                    bottom:
                        4.h + 2, // extra bottom padding to ensure no overflow
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Title and Rating Row
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
                      // Product Name
                      Text(
                        'Ambuja cement',
                        style: TextStyles.font15lightBlackRegular,
                      ),
                      // Price
                      Text(
                        '1,000 EGB',
                        style: TextStyles.font12MainBlueSemiBold,
                      ),
                      // Add to Cart Button
                      SizedBox(
                        height: 36.h,
                        child: AppTextButton(
                          textButton: 'Add to cart',
                          onPressed: () {},
                          backgroundColor: ColorsManager.mainBlue,
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

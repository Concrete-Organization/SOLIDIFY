import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';

class ProductRowForReview extends StatelessWidget {
  final String imageUri;
  final String name;
  final String price;

  const ProductRowForReview({
    super.key,
    required this.imageUri,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
          child: CachedNetworkImage(
            imageUrl: imageUri,
            fit: BoxFit.contain,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                color: Colors.white,
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        horizontalSpace(15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyles.font12LightBlackMedium,
            ),
            verticalSpace(20),
            Text(
              price,
              style: TextStyles.font12MainBlueMedium,
            ),
          ],
        ),
      ],
    );
  }
}
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/features/profile_company/logic/order_details_cubit/order_details_cubit.dart';

class OrderProductItem extends StatelessWidget {
  final String name;
  final String price;
  final String qty;
  final int index;
  final String imageUri;

  const OrderProductItem({
    super.key,
    required this.name,
    required this.price,
    required this.qty,
    required this.index,
    required this.imageUri,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 12.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 74.w,
            height: 60.h,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.5.w,
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
              verticalSpace(8),
              Text(
                price,
                style: TextStyles.font12MainBlueMedium,
              ),
              verticalSpace(8),
              Text(
                'Qty: $qty',
                style: TextStyles.font12LightBlackMedium,
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              final productId =
                  context.read<OrderDetailsCubit>().getProductId(index);
              if (productId != null) {
                context.pushNamed(
                  Routes.writeReviewScreen,
                  arguments: productId,
                );
              }
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

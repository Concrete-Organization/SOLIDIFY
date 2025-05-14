import 'package:flutter/material.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductStackForDetailsScreen extends StatefulWidget {
  final String imageUrl;
  final int discount;

  const ProductStackForDetailsScreen({
    super.key,
    required this.imageUrl,
    required this.discount,
  });

  @override
  State<ProductStackForDetailsScreen> createState() =>
      _ProductStackForDetailsScreenState();
}

class _ProductStackForDetailsScreenState
    extends State<ProductStackForDetailsScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 227.h,
          width: double.infinity,
          child: Image.network(
            widget.imageUrl,
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) => const Icon(Icons.error),
          ),
        ),
        if (widget.discount > 0)
          Positioned(
            top: 10.h,
            left: 10.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: ColorsManager.secondaryGold,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Text(
                '${widget.discount}% OFF',
                style: TextStyle(
                  color: ColorsManager.mainBlue,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        Positioned(
          top: 10.h,
          right: 10.w,
          child: GestureDetector(
            onTap: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            child: Container(
              height: 38.h,
              width: 38.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorsManager.white,
                border: Border.all(
                  color: ColorsManager.mainBlue,
                  width: 1.w,
                ),
              ),
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite
                    ? ColorsManager.secondaryGold
                    : ColorsManager.mainBlue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

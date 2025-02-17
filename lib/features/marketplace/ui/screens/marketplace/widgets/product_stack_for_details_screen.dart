import 'package:flutter/material.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductStackForDetailsScreen extends StatefulWidget {
  const ProductStackForDetailsScreen({super.key});

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
          child: Image.asset(
            'assets/images/cement_bag_3x.png',
            fit: BoxFit.contain,
          ),
        ),

        // Favorite icon positioned at the far top-right corner
        Positioned(
          top: 16.h, // Closer to the top edge
          right: 16.w, // Closer to the right edge
          child: GestureDetector(
            onTap: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            child: Container(
              height: 48.h,
              width: 48.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(
                  color: ColorsManager.mainBlue,
                  width: 2.w,
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

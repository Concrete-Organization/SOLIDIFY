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
            'assets/images/cement_bag.png',
            fit: BoxFit.contain,
          ),
        ),

        // Favorite icon positioned farther to the top-right
        Positioned(
          top: 50.h, // Increase to move icon further down
          right: 50.w, // Increase to move icon further from the right edge
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
                color: Colors.transparent, // No solid fill
                border: Border.all(
                  color: ColorsManager.mainBlue,
                  width: 2.w, // Hollow border width
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

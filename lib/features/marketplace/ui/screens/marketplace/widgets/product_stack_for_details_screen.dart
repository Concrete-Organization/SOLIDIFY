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
        Positioned(
          top: 0.h,
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
                color: Colors.transparent,
                border: Border.all(
                  color: ColorsManager.mainBlue,
                  width: 1.w,
                ),
              ),
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: ColorsManager.mainBlue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

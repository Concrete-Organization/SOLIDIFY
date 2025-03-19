import 'package:flutter/material.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailsContainer extends StatelessWidget {
  const OrderDetailsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 353.w,
      height: 323.h,
      decoration: BoxDecoration(
          color: ColorsManager.mainBlueWith5Opacity,
          border: Border.all(
            color: ColorsManager.mainBlue,
          ),
          borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        children: [
          Container(
            width: 74.w,
            height: 60.h,
            decoration: BoxDecoration(
                border: Border.all(width: 1.3, color: ColorsManager.mainBlue),
                borderRadius: BorderRadius.circular(5.r)),
            child: Image.asset(
              'assets/images/cement_bag_3x.png',
              width: 39.w,
              height: 52.h,
            ),
          )
        ],
      ),
    );
  }
}

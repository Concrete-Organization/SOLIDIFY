import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:solidify/core/helpers/spacing.dart';

class ShimmerPostItem extends StatelessWidget {
  const ShimmerPostItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 21.w,
                  backgroundColor: Colors.grey,
                ),
                horizontalSpace(12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 120.w,
                      height: 14.h,
                      color: Colors.grey,
                    ),
                    verticalSpace(4),
                    Container(
                      width: 80.w,
                      height: 12.h,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
            verticalSpace(16),
            Container(
              width: double.infinity,
              height: 14.h,
              color: Colors.grey,
            ),
            verticalSpace(8),
            Container(
              width: 200.w,
              height: 14.h,
              color: Colors.grey,
            ),
            verticalSpace(16),
            Container(
              width: double.infinity,
              height: 200.h,
              color: Colors.grey,
            ),
            verticalSpace(16),
            Container(
              width: 100.w,
              height: 14.h,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
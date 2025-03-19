import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:solidify/core/helpers/spacing.dart';

class ShimmerCommentItem extends StatelessWidget {
  const ShimmerCommentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 17.w,
                backgroundColor: Colors.grey,
              ),
              horizontalSpace(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100.w,
                    height: 10.h,
                    color: Colors.grey,
                  ),
                  verticalSpace(2),
                  Container(
                    width: 50.w,
                    height: 8.h,
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
          verticalSpace(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.w),
                child: Container(
                  width: 200.w,
                  height: 40.h,
                  color: Colors.grey,
                ),
              ),
              Column(
                children: [
                  Container(
                    width: 16.w,
                    height: 16.h,
                    color: Colors.grey,
                  ),
                  verticalSpace(1),
                  Container(
                    width: 8.w,
                    height: 8.h,
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 45.w),
            child: Container(
              width: 40.w,
              height: 8.h,
              color: Colors.grey,
            ),
          ),
          verticalSpace(5),
          Padding(
            padding: EdgeInsets.only(left: 50.w),
            child: Container(
              width: 80.w,
              height: 8.h,
              color: Colors.grey,
            ),
          ),
          verticalSpace(16),
        ],
      ),
    );
  }
}
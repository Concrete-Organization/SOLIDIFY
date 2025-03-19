import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/shimmer_comment_item.dart';

class ShimmerCommentList extends StatelessWidget {
  final int itemCount;
  const ShimmerCommentList({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      itemCount: itemCount,
      itemBuilder: (context, index) => const ShimmerCommentItem(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/shimmer_comment_with_post_item.dart';

class ShimmerCommentWithPostList extends StatelessWidget {
  final int itemCount;
  const ShimmerCommentWithPostList({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      itemCount: itemCount,
      itemBuilder: (context, index) => const ShimmerCommentWithPostItem(),
    );
  }
}

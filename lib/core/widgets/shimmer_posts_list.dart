import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/shimmer_post_item.dart';

class ShimmerPostsList extends StatelessWidget {
  const ShimmerPostsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      itemCount: 3,
      itemBuilder: (context, index) => const ShimmerPostItem(),
    );
  }
}

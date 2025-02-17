import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'review_card.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';

class ReviewCardListView extends StatelessWidget {
  const ReviewCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: const ReviewCard(),
              ),
                verticalSpace(10),
            ],
          );
        },
        childCount: 2,
      ),
    );
  }
}

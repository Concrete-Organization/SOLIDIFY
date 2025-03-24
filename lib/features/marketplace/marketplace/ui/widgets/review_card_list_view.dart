import 'review_card.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/features/marketplace/marketplace/data/models/get_product_by_id_response_body.dart';

class ReviewCardListView extends StatelessWidget {
  final List<ReviewModel> reviews;

  const ReviewCardListView({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    final lastTwoReviews =
        reviews.length > 2 ? reviews.sublist(reviews.length - 2) : reviews;

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final review = lastTwoReviews[index];
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ReviewCard(review: review),
              ),
              verticalSpace(10),
            ],
          );
        },
        childCount: lastTwoReviews.length,
      ),
    );
  }
}

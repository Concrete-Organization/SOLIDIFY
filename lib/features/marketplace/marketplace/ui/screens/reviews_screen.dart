import 'package:flutter/material.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/features/marketplace/marketplace/ui/widgets/review_card.dart';
import 'package:solidify/features/marketplace/marketplace/data/models/get_product_by_id_response_body.dart';

class ReviewsScreen extends StatelessWidget {
  final List<ReviewModel> reviews;

  const ReviewsScreen({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reviews',
          style: TextStyles.font18MainSemiBold,
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          final review = reviews[index];
          return Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: ReviewCard(review: review),
          );
        },
      ),
    );
  }
}

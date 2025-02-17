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
              const ReviewCard(),
              if (index < 9)
                verticalSpace(10), // Space except for the last item
            ],
          );
        },
        childCount: 10,
      ),
    );
  }
}

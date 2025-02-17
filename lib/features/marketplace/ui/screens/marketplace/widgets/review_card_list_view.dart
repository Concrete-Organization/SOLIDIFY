import 'review_card.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';

class ReviewCardListView extends StatelessWidget {
  const ReviewCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const ReviewCard();
      },
      separatorBuilder: (context, index) {
        return verticalSpace(10);
      },
    );
  }
}

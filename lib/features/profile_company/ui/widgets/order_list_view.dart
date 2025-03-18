import 'order_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';

class OrderListView extends StatelessWidget {
  final int itemsToShow;

  const OrderListView({
    super.key,
    this.itemsToShow = 2, // Default show 2 items
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(), // Disable scrolling
      shrinkWrap: true,
      itemCount: itemsToShow,
      separatorBuilder: (context, index) => verticalSpace(20),
      itemBuilder: (context, index) => OrderListViewItem(),
    );
  }
}

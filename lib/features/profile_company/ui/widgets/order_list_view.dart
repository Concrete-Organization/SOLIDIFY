import 'order_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';

class OrderListView extends StatelessWidget {
  final int itemsToShow;

  const OrderListView({
    super.key,
    this.itemsToShow = 2,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: itemsToShow,
      separatorBuilder: (context, index) => verticalSpace(30),
      itemBuilder: (context, index) => OrderListViewItem(),
    );
  }
}

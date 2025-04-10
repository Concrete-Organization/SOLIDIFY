import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/features/profile_company/ui/widgets/order_list_view_item.dart';
import 'package:solidify/features/profile_company/data/models/get_order_response_model.dart';

class OrderListView extends StatelessWidget {
  final int itemsToShow;
  final List<OrderItem>? orders;

  const OrderListView({
    super.key,
    this.itemsToShow = 2,
    this.orders,
  });

  @override
  Widget build(BuildContext context) {
    final displayOrders = orders?.take(itemsToShow).toList() ?? [];

    if (displayOrders.isEmpty) {
      return const Center(child: Text('No orders available'));
    }

    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: displayOrders.length,
      separatorBuilder: (context, index) => verticalSpace(30),
      itemBuilder: (context, index) => OrderListViewItem(
        order: displayOrders[index],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/marketplace/cart/ui/widgets/cart_list_view_item.dart';
import 'package:solidify/features/marketplace/cart/data/models/get_cart_response_model.dart';

class CartListView extends StatelessWidget {
  final List<CartItemModel> items;
  final Function(double) onPriceUpdated;
  final Function(String) onItemDeleted;

  const CartListView({
    super.key,
    required this.items,
    required this.onPriceUpdated,
    required this.onItemDeleted,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 16.h),
      itemCount: items.length,
      separatorBuilder: (context, index) => Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: const HorizontalDivider(),
      ),
      itemBuilder: (context, index) => CartListViewItem(
        item: items[index],
        onPriceUpdated: onPriceUpdated,
        onItemDeleted: onItemDeleted,
      ),
    );
  }
}
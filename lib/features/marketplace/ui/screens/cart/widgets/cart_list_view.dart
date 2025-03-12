import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/marketplace/data/models/get_cart_response_model.dart';
import 'package:solidify/features/marketplace/ui/screens/cart/widgets/cart_list_view_item.dart';

class CartListView extends StatelessWidget {
  final List<CartItemModel> items;
  const CartListView({super.key, required this.items});

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
      itemBuilder: (context, index) => CartListViewItem(item: items[index]),
    );
  }
}

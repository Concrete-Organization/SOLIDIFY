import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/features/marketplace/cart/ui/widgets/cart_list_view.dart';
import 'package:solidify/features/marketplace/cart/data/models/get_cart_response_model.dart';

class CartContent extends StatefulWidget {
  final List<CartItemModel> items;
  final double total;
  final ValueChanged<double> onPriceUpdated;

  const CartContent({
    super.key,
    required this.items,
    required this.total,
    required this.onPriceUpdated,
  });

  @override
  State<CartContent> createState() => _CartContentState();
}

class _CartContentState extends State<CartContent> {
  late List<CartItemModel> _items;
  late double _total;

  @override
  void initState() {
    super.initState();
    _items = widget.items;
    _total = widget.total;
  }

  void _onItemDeleted(String itemId) {
    // Find the item being deleted
    final deletedItem = _items.firstWhere((item) => item.id == itemId);

    // Update the total price
    setState(() {
      _items.removeWhere((item) => item.id == itemId);
      _total -= deletedItem.price * deletedItem.quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CartListView(
                items: _items,
                onPriceUpdated: widget.onPriceUpdated,
                onItemDeleted: _onItemDeleted, // Pass the callback
              ),
              Text(
                'Total',
                style: TextStyles.font20MainLightBlack,
              ),
              verticalSpace(15),
              Text(
                '${_total.toStringAsFixed(2)} EGP',
                style: TextStyles.font15MainBlueSemiBold,
              ),
              verticalSpace(15),
              AppTextButton(
                onPressed: () {
                  context.pushNamed(Routes.addressDetailsScreen);
                },
                textButton: 'Place Order',
              ),
              verticalSpace(36),
            ],
          ),
        ),
      ),
    );
  }
}
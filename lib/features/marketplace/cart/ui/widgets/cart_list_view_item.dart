import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/features/marketplace/cart/ui/widgets/quantity_selector.dart';
import 'package:solidify/features/marketplace/cart/data/models/get_cart_response_model.dart';

class CartListViewItem extends StatefulWidget {
  final CartItemModel item;
  final Function(double) onPriceUpdated; // Callback to update total price

  const CartListViewItem({
    super.key,
    required this.item,
    required this.onPriceUpdated,
  });

  @override
  State<CartListViewItem> createState() => _CartListViewItemState();
}

class _CartListViewItemState extends State<CartListViewItem> {
  int quantity = 1; // Start with a default quantity of 1
  double itemTotalPrice = 0;

  @override
  void initState() {
    super.initState();
    itemTotalPrice = widget.item.price; // Initialize with the base price
  }

  void _increment() {
    setState(() {
      quantity++;
      itemTotalPrice = widget.item.price * quantity; // Update total price
      widget.onPriceUpdated(widget.item.price); // Notify parent of price change
    });
  }

  void _decrement() {
    if (quantity > 1) {
      setState(() {
        quantity--;
        itemTotalPrice = widget.item.price * quantity; // Update total price
        widget.onPriceUpdated(
            -widget.item.price); // Notify parent of price change
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 30.w),
          child: Row(
            children: [
              Container(
                width: 113.w,
                height: 92.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorsManager.mainBlue,
                    width: 1.2.w,
                  ),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  child: Image.network(
                    widget.item.imageUri,
                    width: 67.w,
                    height: 84.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              horizontalSpace(25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.name,
                    style: TextStyles.font15lightBlackMedium,
                  ),
                  verticalSpace(15),
                  Text(
                    '${itemTotalPrice.toStringAsFixed(2)} EGP', // Display updated price
                    style: TextStyles.font15MainBlueSemiBold,
                  ),
                  verticalSpace(15),
                  QuantitySelector(
                    quantity: quantity,
                    onIncrement: _increment,
                    onDecrement: _decrement,
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: SvgPicture.asset('assets/svgs/delete_icon.svg'),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/features/marketplace/data/models/get_cart_response_model.dart';
import 'package:solidify/features/marketplace/ui/screens/cart/widgets/quantity_selector.dart';

class CartListViewItem extends StatefulWidget {
  final CartItemModel item;

  const CartListViewItem({
    super.key,
    required this.item,
  });

  @override
  State<CartListViewItem> createState() => _CartListViewItemState();
}

class _CartListViewItemState extends State<CartListViewItem> {
  int quantity = 0;

  void _increment() {
    setState(() {
      quantity++;
    });
  }

  void _decrement() {
    setState(() {
      if (quantity > 0) quantity--;
    });
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
                    '${widget.item.price.toStringAsFixed(2)} EGP',
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

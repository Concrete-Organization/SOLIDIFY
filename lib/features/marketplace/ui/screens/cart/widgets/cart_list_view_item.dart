import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/features/marketplace/ui/screens/cart/widgets/QuantitySelector.dart';

class CartListViewItem extends StatefulWidget {
  const CartListViewItem({super.key});

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
      // Optionally, prevent negative values
      if (quantity > 0) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Product Image Container
        Container(
          width: 113.w,
          height: 92.h,
          decoration: BoxDecoration(
            border: Border.all(color: ColorsManager.mainBlue, width: 2.w),
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Image.asset(
            'assets/images/cement_bag_3x.png',
            width: 67.w,
            height: 84.h,
          ),
        ),
        horizontalSpace(25),
        // Product Info
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fly ash',
              style: TextStyles.font15lightBlackMedium,
            ),
            verticalSpace(15),
            Text(
              '1000',
              style: TextStyles.font15MainBlueSemiBold,
            ),
            verticalSpace(15),
            // Quantity Selector
            QuantitySelector(
              quantity: quantity,
              onIncrement: _increment,
              onDecrement: _decrement,
            ),
          ],
        )
      ],
    );
  }
}

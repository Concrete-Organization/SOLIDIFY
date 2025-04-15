import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/profile_company/data/models/get_order_by_id_response_model.dart';
import 'package:solidify/features/profile_company/ui/widgets/order_product_item.dart';

class OrderDetailsContainer extends StatelessWidget {
  final List<OrderItemDetails> orderItems;
  final double totalPrice;
  final int orderStatus;

  const OrderDetailsContainer({
    super.key,
    required this.orderItems,
    required this.totalPrice,
    required this.orderStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.mainBlueWith5Opacity,
        border: Border.all(color: ColorsManager.mainBlue),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          ...List.generate(
            orderItems.length,
            (index) => Column(
              children: [
                OrderProductItem(
                  name: orderItems[index].name,
                  price: '${orderItems[index].price} EGP',
                  qty: orderItems[index].quantity.toString(),
                  imageUri: orderItems[index].imageUri,
                  index: index,
                ),
                if (index < orderItems.length - 1)
                  const HorizontalDivider(thickness: 0.6),
              ],
            ),
          ),
          const HorizontalDivider(thickness: 0.6),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 133.w,
                  height: 31.h,
                  decoration: BoxDecoration(
                    color: ColorsManager.mainBlueWith1Opacity,
                    border: Border.all(color: ColorsManager.mainBlue),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Total: ',
                        style: TextStyles.font12LightBlackMedium,
                      ),
                      Text(
                        '$totalPrice EGP',
                        style: TextStyles.font12MainBlueMedium,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      _getStatusText(orderStatus),
                      style: TextStyles.font12secondaryGoldMedium,
                    ),
                    horizontalSpace(3),
                    if (orderStatus == 0)
                      SvgPicture.asset('assets/svgs/active_order_icon.svg'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getStatusText(int status) {
    switch (status) {
      case 0:
        return 'Active order';
      case 1:
        return 'Pending order';
      case 2:
        return 'Shipped order';
      default:
        return 'Unknown status';
    }
  }
}

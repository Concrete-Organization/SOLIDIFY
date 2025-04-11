import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/features/profile_company/ui/widgets/order_state_details_row.dart';
import 'package:solidify/features/profile_company/data/models/get_order_response_model.dart';

class OrderListViewItem extends StatelessWidget {
  final OrderItem order;

  const OrderListViewItem({super.key, required this.order});

  String _getStatusText(int status) {
    return status == 0 ? 'Pending' : 'Completed';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        color: ColorsManager.mainBlueWith1Opacity,
        border: Border.all(
          color: ColorsManager.mainBlue,
          width: 0.3.w,
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderStateDetailsRow(
            label: 'Order number',
            value: '#${order.id.substring(0, 8)}',
            valueStyle: TextStyles.font12MainBlueMedium,
          ),
          verticalSpace(10),
          OrderStateDetailsRow(
            label: 'Date',
            value: order.orderDate.toString().substring(0, 10),
            valueStyle: TextStyles.font12MainBlueMedium,
          ),
          verticalSpace(10),
          OrderStateDetailsRow(
            label: 'Order status',
            value: _getStatusText(order.orderStatus),
            valueStyle: TextStyles.font12secondaryGoldMedium,
          ),
          verticalSpace(10),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorsManager.mainBlueWith2Opacity,
            ),
            child: OrderStateDetailsRow(
              label: 'Total',
              value: '${order.totalPrice.toStringAsFixed(2)} EGP',
              valueStyle: TextStyles.font12MainBlueSemiBold,
              applyVerticalPadding: true,
            ),
          ),
          verticalSpace(12),
          Center(
            child: AppTextButton(
              onPressed: () {
                context.pushNamed(
                  Routes.orderDetailsScreen,
                  arguments: order.id,
                );
              },
              width: 255.w,
              height: 38.h,
              textButton: 'View order details',
              padding: EdgeInsets.symmetric(vertical: 8.h),
            ),
          ),
        ],
      ),
    );
  }
}

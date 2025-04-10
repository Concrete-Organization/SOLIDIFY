import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';

class OrderNumberContainer extends StatelessWidget {
  final String orderId;
  final DateTime orderDate;
  final String shippingAddress;

  const OrderNumberContainer({
    super.key,
    required this.orderId,
    required this.orderDate,
    required this.shippingAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 353.w,
      height: 110.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorsManager.mainBlue,
          width: 0.7.w,
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            child: Row(
              children: [
                Text(
                  'Order num: ',
                  style: TextStyles.font12LightBlackMedium,
                ),
                Expanded(
                  child: Text(
                    '#${_truncateOrderId(orderId)}',
                    style: TextStyles.font12MainBlueRegular,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Spacer(),
                Text(
                  'Ordered on: ',
                  style: TextStyles.font12LightBlackMedium,
                ),
                Text(
                  _formatDate(orderDate),
                  style: TextStyles.font12MainBlueRegular,
                ),
              ],
            ),
          ),
          verticalSpace(6),
          const HorizontalDivider(
            color: ColorsManager.mainBlue,
            thickness: 0.7,
          ),
          verticalSpace(6),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            child: Text(
              'Shipping address:',
              style: TextStyles.font12LightBlackMedium,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Text(
              shippingAddress,
              style: TextStyles.font12MainBlueRegular,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }

  String _truncateOrderId(String id) {
    return id.length > 10 ? id.substring(0, 10) : id;
  }

  String _formatDate(DateTime date) {
    try {
      return '${date.day}/${date.month}/${date.year}';
    } catch (e) {
      return 'Invalid Date';
    }
  }
}

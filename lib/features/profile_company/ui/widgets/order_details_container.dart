import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/profile_company/logic/order_details_cubit.dart';
import 'package:solidify/features/profile_company/data/models/get_order_by_id_response_model.dart';

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
      width: 353.w,
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
                _buildProductItem(
                  context: context,
                  name: orderItems[index].name,
                  price: '${orderItems[index].price} EGP',
                  qty: orderItems[index].quantity.toString(),
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
                    if (orderStatus == 0)
                      SvgPicture.asset('assets/svgs/complete_order_icon.svg'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem({
    required BuildContext context,
    required String name,
    required String price,
    required String qty,
    required int index,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 74.w,
            height: 60.h,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.3.w,
                color: ColorsManager.mainBlue,
              ),
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Image.asset('assets/images/cement_bag_3x.png'),
          ),
          horizontalSpace(15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyles.font12LightBlackMedium),
              verticalSpace(8),
              Text(price, style: TextStyles.font12MainBlueMedium),
              verticalSpace(8),
              Text('Qty: $qty', style: TextStyles.font12LightBlackMedium),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              final productId =
                  context.read<OrderDetailsCubit>().getProductId(index);
              if (productId != null) {
                context.pushNamed(Routes.writeReviewScreen,
                    arguments: productId);
              }
            },
            child: Container(
              width: 112.w,
              height: 27.h,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.4.w,
                  color: ColorsManager.mainBlue,
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/svgs/write_icon.svg'),
                  horizontalSpace(5),
                  Text(
                    'Write a review',
                    style: TextStyles.font10MainBlueMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getStatusText(int status) {
    switch (status) {
      case 0:
        return 'Completed order';
      case 1:
        return 'Pending order';
      case 2:
        return 'Shipped order';
      default:
        return 'Unknown status';
    }
  }
}

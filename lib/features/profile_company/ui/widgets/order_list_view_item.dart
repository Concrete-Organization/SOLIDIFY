import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart';

class OrderListViewItem extends StatelessWidget {
  const OrderListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 353.w,
      height: 210.h, // Increased height to prevent overflow
      padding:
          EdgeInsets.symmetric(vertical: 12.h), // Removed horizontal padding
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: _buildDetailRow(
              'Order number',
              '#123456394',
              valueStyle: TextStyles.font12MainBlueMedium,
            ),
          ),
          verticalSpace(10),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 12.w), // Add horizontal padding here
            child: _buildDetailRow(
              'Date',
              'May5,2025',
              valueStyle: TextStyles.font12MainBlueMedium,
            ),
          ),
          verticalSpace(10),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 12.w), // Add horizontal padding here
            child: _buildDetailRow(
              'Order status',
              'Shipped',
              valueStyle: TextStyles.font12secondaryGoldMedium,
            ),
          ),
          verticalSpace(10),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
            decoration: BoxDecoration(
              color: ColorsManager.mainBlueWith2Opacity,
            ),
            child: _buildDetailRow(
              'Total',
              '7,900 EGP',
              valueStyle: TextStyles.font12MainBlueSemiBold,
            ),
          ),
          verticalSpace(12), // Reduced spacing
          Center(
            child: AppTextButton(
              onPressed: () {},
              width: 225.w,
              height: 42.h, // Reduced button height
              textButton: 'View order details',
              fontSize: 14, // Reduced font size
              padding: EdgeInsets.symmetric(vertical: 8.h), // Adjusted padding
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {TextStyle? valueStyle}) {
    return Row(
      children: [
        Text(label, style: TextStyles.font12LightBlackMedium),
        const Spacer(),
        Text(value, style: valueStyle ?? TextStyles.font12LightBlackMedium),
      ],
    );
  }
}

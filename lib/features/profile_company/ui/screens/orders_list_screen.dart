import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/features/profile_company/ui/widgets/order_list_view_item.dart';

class OrdersListScreen extends StatelessWidget {
  const OrdersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Active orders',
          style: TextStyles.font18MainSemiBold,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
        child: ListView.separated(
          itemCount: 5,
          separatorBuilder: (context, index) => verticalSpace(20),
          itemBuilder: (context, index) => OrderListViewItem(),
        ),
      ),
    );
  }
}

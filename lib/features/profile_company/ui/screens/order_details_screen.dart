import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/profile_company/ui/widgets/order_number_container.dart';
import 'package:solidify/features/profile_company/ui/widgets/order_details_container.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order details',
          style: TextStyles.font18MainSemiBold,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            children: [
              verticalSpace(20),
              OrderNumberContainer(),
              verticalSpace(15),
              HorizontalDivider(),
              verticalSpace(30),
              OrderDetailsContainer()
            ],
          ),
        ),
      ),
    );
  }
}

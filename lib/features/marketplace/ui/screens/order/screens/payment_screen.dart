import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/marketplace/ui/screens/order/widgets/payment_method_container.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset('assets/svgs/back_arrow.svg'),
        ),
        title: Text(
          'Payment',
          style: TextStyles.font18MainSemiBold,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: GestureDetector(
              onTap: () => context.pushNamed(Routes.cartScreen),
              child: SvgPicture.asset('assets/svgs/filled_cart.svg'),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(100),
            Text('select a payment method',
                style: TextStyles.font15lightBlackMedium),
            verticalSpace(17),
            PaymentMethodContainer(
                iconPath: 'assets/svgs/paypal.svg', title: 'pay pal'),
            verticalSpace(15),
            HorizontalDivider(),
            PaymentMethodContainer(
                iconPath: 'assets/svgs/cash_on_delivery.svg',
                title: 'cash on delivery'),
          ],
        ),
      ),
    );
  }
}

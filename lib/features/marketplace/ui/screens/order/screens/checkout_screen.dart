import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/core/widgets/custom_indicator.dart';
import 'package:solidify/features/marketplace/ui/screens/order/widgets/payment_details_container.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool _isPaymentDetailsFilled = false;

  void _onPaymentDetailsFilled(bool isFilled) {
    setState(() {
      _isPaymentDetailsFilled = isFilled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset('assets/svgs/back_arrow.svg'),
        ),
        title: Text(
          'Checkout',
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
        padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 17.h),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(50),
                    Text('Payment details',
                        style: TextStyles.font15lightBlackMedium),
                    verticalSpace(30),
                    PaymentDetailsContainer(
                      onFieldsFilled: _onPaymentDetailsFilled,
                    ),
                    verticalSpace(30),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.h),
              child: Column(
                children: [
                  CustomIndicator(
                    currentPage: 2,
                    totalPages: 3,
                    width: 20,
                  ),
                  verticalSpace(60),
                  AppTextButton(
                    onPressed: _isPaymentDetailsFilled
                        ? () => context.pushNamed(Routes.orderDoneScreen)
                        : null,
                    textButton: 'Complete Payment',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
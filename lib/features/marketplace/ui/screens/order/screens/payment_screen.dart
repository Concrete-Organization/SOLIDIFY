import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/core/widgets/custom_indicator.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/marketplace/ui/screens/order/widgets/payment_method_container.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? _selectedPaymentMethod;

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
        padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 17.h),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(100),
                    Text('Select a payment method',
                        style: TextStyles.font15lightBlackMedium),
                    verticalSpace(17),
                    PaymentMethodContainer(
                      iconPath: 'assets/images/paypal_icon.png',
                      title: 'Pay Pal',
                      isSelected: _selectedPaymentMethod == 'Pay Pal',
                      onTap: () => setState(() {
                        _selectedPaymentMethod =
                            _selectedPaymentMethod == 'Pay Pal'
                                ? null
                                : 'Pay Pal';
                      }),
                      iconWidth: 65.w,
                      iconHeight: 48.75.h,
                    ),
                    verticalSpace(30),
                    HorizontalDivider(),
                    verticalSpace(30),
                    PaymentMethodContainer(
                      iconPath: 'assets/images/cash_on_delivery.png',
                      title: 'Cash on Delivery',
                      isSelected: _selectedPaymentMethod == 'Cash on Delivery',
                      onTap: () => setState(() {
                        _selectedPaymentMethod =
                            _selectedPaymentMethod == 'Cash on Delivery'
                                ? null
                                : 'Cash on Delivery';
                      }),
                      iconWidth: 32.w,
                      iconHeight: 32.h,
                      imagePadding: EdgeInsets.only(right: 20.w, left: 13),
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
                    currentPage: 1,
                    totalPages: 3,
                    width: 20,
                  ),
                  verticalSpace(60),
                  AppTextButton(
                    onPressed: _selectedPaymentMethod != null
                        ? () {
                            if (_selectedPaymentMethod == 'Cash on Delivery') {
                              context.pushNamed(Routes.orderDoneScreen);
                            } else {
                              context.pushNamed(Routes.checkoutScreen);
                            }
                          }
                        : null,
                    textButton: 'Next',
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

import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:get_it/get_it.dart'; // Add this import
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/core/widgets/custom_indicator.dart';
import 'package:solidify/core/widgets/custom_snack_bar.dart';
import 'package:solidify/core/helpers/shared_pref_helper.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/marketplace/order/data/repos/order_repo.dart';
import 'package:solidify/features/marketplace/order/data/models/order_post_request.dart';
import 'package:solidify/features/marketplace/order/ui/widgets/payment_method_container.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? _selectedPaymentMethod;
  bool _isProcessing = false;
  final OrderRepo _orderRepo = GetIt.instance<OrderRepo>();

  Future<void> _placeCodOrder(BuildContext context) async {
    setState(() => _isProcessing = true);

    try {
      final addressId = await SharedPrefHelper.getCachedShippingAddressId();
      final token =
          await SharedPrefHelper.getSecuredString(SharedPrefKeys.accessToken);

      if (addressId.isEmpty) {
        if (context.mounted) {
          CustomSnackBar.showError(
            context,
            'Please select a shipping address first',
          );
        }
        return;
      }

      final response = await _orderRepo.createOrder(
        OrderPostRequest(shippingAddressId: int.parse(addressId)),
        'Bearer $token',
      );

      response.when(
        success: (response) {
          if (response.isSucceeded) {
            if (mounted) {
              CustomSnackBar.showSuccess(context, 'Order placed successfully!');
              Future.delayed(const Duration(seconds: 2), () {
                if (context.mounted) {
                  context.pushNamed(Routes.orderDoneScreen);
                }
              });
            }
          } else {
            if (mounted) {
              CustomSnackBar.showError(
                context,
                response.message,
              );
            }
          }
        },
        failure: (error) {
          if (mounted) {
            CustomSnackBar.showError(
              context,
              'Error: ${error.message}',
            );
          }
        },
      );
    } catch (e) {
      if (context.mounted) {
        CustomSnackBar.showError(
          context,
          'Failed to place order: ${e.toString()}',
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isProcessing = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        padding: EdgeInsets.only(
          left: 17.w,
          right: 17.w,
          top: 17.h,
          bottom: 90.h,
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(100),
                    Text(
                      'Select a payment method',
                      style: TextStyles.font15lightBlackMedium,
                    ),
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
                  _isProcessing
                      ? const CircularProgressIndicator()
                      : AppTextButton(
                          onPressed: _selectedPaymentMethod != null
                              ? () {
                                  if (_selectedPaymentMethod ==
                                      'Cash on Delivery') {
                                    _placeCodOrder(context);
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

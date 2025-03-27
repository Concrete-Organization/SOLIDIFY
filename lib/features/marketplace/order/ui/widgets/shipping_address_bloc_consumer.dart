import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/app_validation.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/core/widgets/custom_indicator.dart';
import 'package:solidify/core/widgets/custom_snack_bar.dart';
import 'package:solidify/core/widgets/app_text_form_field.dart';
import 'package:solidify/core/widgets/loading_circle_indicator.dart';
import 'package:solidify/features/marketplace/order/logic/shipping_address_cubit.dart';
import 'package:solidify/features/marketplace/order/logic/shipping_address_state.dart';

class ShippingAddressBlocConsumer extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController cityController;
  final TextEditingController streetController;
  final TextEditingController postalCodeController;
  final TextEditingController phoneController;

  const ShippingAddressBlocConsumer({
    super.key,
    required this.formKey,
    required this.cityController,
    required this.streetController,
    required this.postalCodeController,
    required this.phoneController,
  });

  void _handleSuccessNavigation(BuildContext context) {
    CustomSnackBar.showSuccess(
      context,
      'Address saved successfully!',
    );
    Future.delayed(const Duration(seconds: 3), () {
      if (context.mounted) {
        Navigator.of(context).pushNamed(Routes.paymentScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShippingAddressCubit, ShippingAddressState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (response) => _handleSuccessNavigation(context),
          error: (error) {
            CustomSnackBar.showError(
              context,
              'Error: ${error.message}',
            );
          },
        );
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpace(100),
                        Text(
                          'City',
                          style: TextStyles.font15lightBlackMedium,
                        ),
                        verticalSpace(13),
                        AppTextFormField(
                          controller: cityController,
                          borderRadius: 10.r,
                          hintText: 'City name here',
                          validator: (value) => validateAddress(value),
                        ),
                        verticalSpace(13),
                        Text(
                          'Street',
                          style: TextStyles.font15lightBlackMedium,
                        ),
                        verticalSpace(13),
                        AppTextFormField(
                          controller: streetController,
                          borderRadius: 10.r,
                          hintText: 'Street name here',
                          validator: (value) => validateAddress(value),
                        ),
                        verticalSpace(13),
                        Text(
                          'Postal code',
                          style: TextStyles.font15lightBlackMedium,
                        ),
                        verticalSpace(13),
                        AppTextFormField(
                          controller: postalCodeController,
                          borderRadius: 10.r,
                          hintText: 'Postal code here',
                          validator: (value) => validatePostalCode(value),
                        ),
                        verticalSpace(13),
                        Text(
                          'Phone number',
                          style: TextStyles.font15lightBlackMedium,
                        ),
                        verticalSpace(13),
                        AppTextFormField(
                          controller: phoneController,
                          borderRadius: 10.r,
                          hintText: 'Phone number here',
                          validator: (value) => validateEgyptianPhoneNumber(value),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30.h),
                  child: Column(
                    children: [
                      CustomIndicator(
                        currentPage: 0,
                        totalPages: 3,
                        width: 20,
                      ),
                      verticalSpace(60),
                      state.maybeWhen(
                        loading: () => const LoadingCircleIndicator(),
                        orElse: () => AppTextButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<ShippingAddressCubit>().createShippingAddress(
                                    city: cityController.text,
                                    street: streetController.text,
                                    postalCode: postalCodeController.text,
                                  );
                            }
                          },
                          textButton: 'next',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

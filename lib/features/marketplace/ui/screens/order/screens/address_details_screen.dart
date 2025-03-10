import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/core/widgets/custom_indicator.dart';
import 'package:solidify/core/widgets/app_text_form_field.dart';

class AddressDetailsScreen extends StatelessWidget {
  const AddressDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset('assets/svgs/back_arrow.svg'),
        ),
        title: Text(
          'Address details',
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
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(100),
                    Text('City', style: TextStyles.font15lightBlackMedium),
                    verticalSpace(15),
                    AppTextFormField(
                      borderRadius: 10.r,
                      hintText: 'City name here',
                    ),
                    verticalSpace(25),
                    Text('Street', style: TextStyles.font15lightBlackMedium),
                    verticalSpace(15),
                    AppTextFormField(
                      borderRadius: 10.r,
                      hintText: 'Street name here',
                    ),
                    verticalSpace(25),
                    Text('Postal code',
                        style: TextStyles.font15lightBlackMedium),
                    verticalSpace(15),
                    AppTextFormField(
                      borderRadius: 10.r,
                      hintText: 'Postal code here',
                    ),
                    verticalSpace(25),
                    Text('Phone number',
                        style: TextStyles.font15lightBlackMedium),
                    verticalSpace(15),
                    AppTextFormField(
                      borderRadius: 10.r,
                      hintText: 'Phone number here',
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
                  AppTextButton(
                    onPressed: () => context.pushNamed(Routes.paymentScreen),
                    textButton: 'next',
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

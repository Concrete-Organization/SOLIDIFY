import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart'; // Import the AppTextButton

class OrderDoneScreen extends StatelessWidget {
  const OrderDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/payment_done_image.png',
                  width: 197.w,
                  height: 197.h,
                ),
                verticalSpace(13),
                Text(
                  'Success!',
                  style: TextStyles.font20MainBlueMedium,
                ),
                verticalSpace(12),
                Text(
                  'Thank you for choosing solidify\n'
                  'your order has been placed successfully',
                  textAlign: TextAlign.center,
                  style: TextStyles.font15lightBlackRegularWith70Opacity,
                ),
              ],
            ),
          ),
          // Position the button at the bottom of the screen
          Positioned(
            left: 0,
            right: 0,
            bottom: 30.h, // Adjust the bottom padding as needed
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 20.w), // Add horizontal padding
              child: AppTextButton(
                onPressed: () {
                  context.pushNamed(Routes.companyLayout);
                },
                textButton: 'Continue Shopping',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

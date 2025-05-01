import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/theming/text_styles.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Divider(
            endIndent: 9.w,
          ),
        ),
        Text(
          'Continue with',
          style: TextStyles.font15lightBlackRegularWith70Opacity,
        ),
        Expanded(
          child: Divider(
            indent: 9.w,
          ),
        ),
      ],
    );
  }
}

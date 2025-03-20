import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/theming/text_styles.dart';

class OrderStateDetailsRow extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle? valueStyle;
  final bool applyVerticalPadding;

  const OrderStateDetailsRow({
    super.key,
    required this.label,
    required this.value,
    this.valueStyle,
    this.applyVerticalPadding = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: applyVerticalPadding ? 10.h : 0,
      ),
      child: Row(
        children: [
          Text(label, style: TextStyles.font12LightBlackMedium),
          const Spacer(),
          Text(
            value,
            style: valueStyle ?? TextStyles.font12LightBlackMedium,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/color_manger.dart';
import '../theming/font_weight_helper.dart';
import '../theming/text_styles.dart';

class AppTextButton extends StatelessWidget {
  final String textButton;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final Color? disabledBackgroundColor;
  final Color? disabledTextColor;
  final double? width;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? buttonPadding;

  const AppTextButton({
    super.key,
    required this.onPressed,
    required this.textButton,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.disabledBackgroundColor,
    this.disabledTextColor,
    this.width,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.padding,
    this.buttonPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: buttonPadding ?? EdgeInsets.symmetric(horizontal: 24.w),
      child: SizedBox(
        width: width ?? double.infinity,
        height: height ?? 52.h,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? ColorsManager.mainBlue,
            disabledBackgroundColor: disabledBackgroundColor ?? ColorsManager.mainBlue.withOpacity(0.8),
            disabledForegroundColor: disabledTextColor ?? ColorsManager.white,
            padding: padding ?? EdgeInsets.symmetric(vertical: 12.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
              side: BorderSide(
                color: (onPressed == null)
                    ? Colors.transparent
                    : borderColor ?? ColorsManager.mainBlue,
              ),
            ),
          ),
          child: Text(
            textButton,
            style: TextStyles.font16WhiteMedium.copyWith(
              color: onPressed == null
                  ? disabledTextColor ?? ColorsManager.white
                  : textColor ?? ColorsManager.white,
              fontSize: fontSize ?? 16,
              fontWeight: fontWeight ?? FontWeightHelper.semiBold,
            ),
          ),
        ),
      ),
    );
  }
}

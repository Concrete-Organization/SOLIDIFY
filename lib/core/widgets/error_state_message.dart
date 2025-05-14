import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';

class ErrorStateMessage extends StatelessWidget {
  final String message;
  final String? lottieAssetPath;

  const ErrorStateMessage({
    super.key,
    required this.message,
    this.lottieAssetPath,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (lottieAssetPath != null)
              Lottie.asset(
                lottieAssetPath!,
                repeat: true,
              ),
            verticalSpace(16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyles.font14RedRegular.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
            verticalSpace(16),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';

import 'build_validation_row.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCaseAndUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;

  const PasswordValidations({
    super.key,
    required this.hasLowerCaseAndUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 9.h),
      decoration: BoxDecoration(
        color: ColorsManager.mainBlueWith15Opacity,
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(color: ColorsManager.secondaryGold),
      ),
      child: Column(
        children: [
          BuildValidationRow(
            validateText: 'Is a minimum of 8 characters',
            hasValidate: hasMinLength,
          ),
          verticalSpace(4),
          BuildValidationRow(
            validateText: 'Has uppercase and lower case letters',
            hasValidate: hasLowerCaseAndUpperCase,
          ),
          verticalSpace(4),
          BuildValidationRow(
            validateText: 'Has numbers',
            hasValidate: hasNumber,
          ),
          verticalSpace(4),
          BuildValidationRow(
            validateText: 'Has special characters',
            hasValidate: hasSpecialCharacters,
          ),
        ],
      ),
    );
  }
}

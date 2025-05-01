import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';

class BuildValidationRow extends StatelessWidget {
  final String validateText;
  final bool hasValidate;

  const BuildValidationRow({
    super.key,
    required this.validateText,
    required this.hasValidate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          hasValidate
              ? "assets/svgs/gold_true.svg"
              : "assets/svgs/main_blue_true.svg",
        ),
        horizontalSpace(3),
        Text(
          validateText,
          style: TextStyles.font10MainBlueRegular,
        ),
      ],
    );
  }
}

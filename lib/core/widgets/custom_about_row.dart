import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';

class CustomAboutRow extends StatelessWidget {
  final String title;
  final String? value;
  final bool hasArrow;
  final VoidCallback? onTap;

  const CustomAboutRow({
    super.key,
    required this.title,
    this.value,
    this.hasArrow = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          verticalSpace(8),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              title,
              style: TextStyles.font15lightBlackMedium,
            ),
            trailing: hasArrow
                ? SvgPicture.asset('assets/svgs/next_arrow.svg')
                : value != null
                ? Text(
              value!,
              style: TextStyles.font15MainBlueMedium,
            )
                : null,
          ),
          verticalSpace(8),
        ],
      ),
    );
  }
}

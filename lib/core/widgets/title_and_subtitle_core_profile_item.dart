import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';

class TitleAndSubtitleCoreProfileItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const TitleAndSubtitleCoreProfileItem({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HorizontalDivider(thickness: 0.2),
        verticalSpace(12),
        Text(
          title,
          style: TextStyles.font12LightBlackRegular,
        ),
        Text(
          subtitle,
          style: TextStyles.font12LightBlackRegular.copyWith(
            color: ColorsManager.lightBlack.withOpacity(0.8),
          ),
        ),
        verticalSpace(11),
      ],
    );
  }
}

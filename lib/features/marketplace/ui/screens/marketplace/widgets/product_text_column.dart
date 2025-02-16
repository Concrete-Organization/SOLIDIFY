import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';

class ProductTextColumn extends StatelessWidget {
  const ProductTextColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Cement',
              style: TextStyles.font15lightBlackMedium,
            ),
            const Spacer(),
            Text(
              '1,000 EGP',
              style: TextStyles.font15MainBlueSemiBold,
            ),
          ],
        ),
        verticalSpace(15),
        Text(
          'Ambuja cement',
          style: TextStyles.font15MainBlueMedium,
        ),
      ],
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/features/marketplace/search/widgets/fillter_name_container.dart';

class FilltersTypesContainers extends StatelessWidget {
  const FilltersTypesContainers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: TextStyles.font15lightBlackSemiBold,
        ),
        verticalSpace(10),
        FillterNameContainer(),
      ],
    );
  }
}

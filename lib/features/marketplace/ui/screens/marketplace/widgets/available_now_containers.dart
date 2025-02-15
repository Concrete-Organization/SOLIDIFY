import 'package:flutter/material.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theming/text_styles.dart';

class AvailableNowContainers extends StatelessWidget {
  const AvailableNowContainers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Available now',
          style: TextStyles.font15lightBlackSemiBold,
        ),
        verticalSpace(15),
        Image.asset('assets/images/available_now_container.png'),
        verticalSpace(20),
      ],
    );
  }
}

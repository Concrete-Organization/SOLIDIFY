import 'package:flutter/material.dart';
import '../../../../../core/theming/text_styles.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Sign in to your account',
              style: TextStyles.font24MainBlueMedium,
            ),
          ],
        ),
      ],
    );
  }
}

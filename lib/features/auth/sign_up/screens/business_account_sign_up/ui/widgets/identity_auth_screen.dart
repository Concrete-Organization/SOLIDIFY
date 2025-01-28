import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'business_identity_auth_form.dart';

class IdentityAuthScreen extends StatelessWidget {
  const IdentityAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Identity authentication',
            style: TextStyles.font24MainBlueSemiBold,
          ),
          verticalSpace(40),
          const BusinessIdentityAuthForm(),
          verticalSpace(20),
        ],
      ),
    );
  }
}

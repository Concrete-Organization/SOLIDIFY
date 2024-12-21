import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_sign_up/widgets/upload_container.dart';

class EngineerIdentityAuth extends StatefulWidget {
  const EngineerIdentityAuth({super.key});

  @override
  State<EngineerIdentityAuth> createState() => _IdentityAuthState();
}

class _IdentityAuthState extends State<EngineerIdentityAuth> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Identity authentication',
          style: TextStyles.font24MainBlueSemiBold,
        ),
        verticalSpace(50),
        Text(
          'Upload your engineers syndicate card',
          style: TextStyles.font14lightBlackRegular,
        ),
        verticalSpace(5),
        const UploadContainer(),
        verticalSpace(25),
        Text(
          'Upload your CV',
          style: TextStyles.font14lightBlackRegular,
        ),
        verticalSpace(5),
        const UploadContainer(),
      ],
    );
  }
}

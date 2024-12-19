import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/features/auth/sign_up/widgets/engineer_account_app_bar.dart';

class IdentityAuth extends StatefulWidget {
  const IdentityAuth({super.key});

  @override
  State<IdentityAuth> createState() => _IdentityAuthState();
}

class _IdentityAuthState extends State<IdentityAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            verticalSpace(20),
            const EngineerAccountAppBar(currentIndex: 1, totalPages: 2),
            verticalSpace(40),
            Text(
              'Identity authentication',
              style: TextStyles.font24MainBlueMedium,
            )
          ],
        ),
      ),
    ));
  }
}

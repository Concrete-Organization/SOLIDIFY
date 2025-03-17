import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/app_text_button.dart';

class CrackDetectionGetStarted extends StatelessWidget {
  const CrackDetectionGetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cracks Detection',
          style: TextStyles.font18MainBlueSemiBold,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            verticalSpace(87),
            Image.asset('assets/images/crack_detection.png'),
            verticalSpace(37),
            Text(
              'Detecting cracks in materials or structures can help prevent failures, ensure safety, and extend the life of assets.',
              style: TextStyles.font15lightBlackRegular,
              textAlign: TextAlign.center,
            ),
            verticalSpace(39),
            AppTextButton(
              onPressed: () {
                context.pushNamed(
                  Routes.crackDetectionChooseUploadingImageScreen,
                );
              },
              textButton: 'Get started!',
            ),
          ],
        ),
      ),
    );
  }
}

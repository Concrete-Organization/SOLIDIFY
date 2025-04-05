import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/title_and_subtitle_core_profile_item.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Privacy policy',
          style: TextStyles.font18MainBlueSemiBold,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              verticalSpace(37),
              SvgPicture.asset(
                'assets/svgs/privacy_policy_header.svg',
              ),
              verticalSpace(12),
              Text(
                'We committed to protecting your privacy.'
                    ' Please read this Privacy Policy carefully. '
                    'If you do not agree with the terms of this Privacy'
                    ' Policy, please do not access the app or use our '
                    'services.',
                textAlign: TextAlign.center,
                style: TextStyles.font12MainBlueMedium.copyWith(
                  color: ColorsManager.mainBlue.withOpacity(0.8),
                ),
              ),
              verticalSpace(17),
              TitleAndSubtitleCoreProfileItem(
                title: 'Data Collection',
                subtitle: 'We collect user data, including project details, material specifications, and AI usage patterns, to enhance app functionality. Your personal information is never sold or shared with third parties without consent.',
              ),
              TitleAndSubtitleCoreProfileItem(
                title: 'Data Security',
                subtitle: 'We implement strong security measures to protect your data from unauthorized access, loss, or misuse. However, no system is completely secure.',
              ),
              TitleAndSubtitleCoreProfileItem(
                title: 'Third-Party Services',
                subtitle: 'Solidify may integrate with third-party tools or APIs for improved functionality. We do not control these services and recommend reviewing their privacy policies before use.',
              ),
              TitleAndSubtitleCoreProfileItem(
                title: 'User Control & Consent',
                subtitle: 'Users can manage their data, including modifying or deleting stored information. By using the app, you consent to our data practices as outlined in this policy.',
              ),
              TitleAndSubtitleCoreProfileItem(
                title: 'Policy Updates',
                subtitle: 'We may update this privacy policy as needed. Continued use of Solidify after changes signifies your acceptance of the revised policy.',
              ),
              verticalSpace(40),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/custom_about_row.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About',
          style: TextStyles.font18MainSemiBold,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              CustomAboutRow(
                title: 'About your account',
                onTap: () {
                  context.pushNamed(Routes.aboutYourAccountScreen);
                },
              ),
              HorizontalDivider(
                color: ColorsManager.mainBlueWith2Opacity,
                thickness: 0.6,
              ),
              CustomAboutRow(
                title: 'Account type',
                onTap: () {
                  context.pushNamed(Routes.accountTypeScreen);
                },
              ),
              HorizontalDivider(
                color: ColorsManager.mainBlueWith2Opacity,
                thickness: 0.6,
              ),
              CustomAboutRow(
                title: 'Version',
                value: '0.0.0000',
                hasArrow: false,
                onTap: () {

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

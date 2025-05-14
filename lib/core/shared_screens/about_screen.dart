import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/custom_about_row.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  Future<String> _getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

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
              FutureBuilder<String>(
                future: _getAppVersion(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CustomAboutRow(
                      title: 'Version',
                      value: 'Loading...',
                      hasArrow: false,
                    );
                  } else if (snapshot.hasError) {
                    return CustomAboutRow(
                      title: 'Version',
                      value: 'Error',
                      hasArrow: false,
                    );
                  } else {
                    return CustomAboutRow(
                      title: 'Version',
                      value: snapshot.data ?? 'Unknown',
                      hasArrow: false,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
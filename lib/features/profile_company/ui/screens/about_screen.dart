import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'About your account',
                    style: TextStyles.font15lightBlackMedium,
                  ),
                  Spacer(),
                  SvgPicture.asset('assets/svgs/next_arrow.svg')
                ],
              ),
              verticalSpace(25),
              HorizontalDivider(
                color: ColorsManager.mainBlueWith2Opacity,
                thickness: 0.6,
              ),
              verticalSpace(15),
              Row(
                children: [
                  Text(
                    'Account type',
                    style: TextStyles.font15lightBlackMedium,
                  ),
                  Spacer(),
                  SvgPicture.asset('assets/svgs/next_arrow.svg')
                ],
              ),
              verticalSpace(25),
              HorizontalDivider(
                color: ColorsManager.mainBlueWith2Opacity,
                thickness: 0.6,
              ),
              verticalSpace(25),
              Row(
                children: [
                  Text(
                    'version',
                    style: TextStyles.font15lightBlackMedium,
                  ),
                  Spacer(),
                  Text(
                    '0.0.0000',
                    style: TextStyles.font15MainBlueMedium,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

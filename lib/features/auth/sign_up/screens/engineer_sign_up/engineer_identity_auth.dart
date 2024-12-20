import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_sign_up/widgets/engineer_account_app_bar.dart';

class EngineerIdentityAuth extends StatefulWidget {
  const EngineerIdentityAuth({super.key});

  @override
  State<EngineerIdentityAuth> createState() => _IdentityAuthState();
}

class _IdentityAuthState extends State<EngineerIdentityAuth> {
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Identity authentication',
                          style: TextStyles.font24MainBlueSemiBold,
                        ),
                      ),
                      verticalSpace(50),
                      Text(
                        'Upload your engineers syndicate card',
                        style: TextStyles.font14lightBlackRegular,
                      ),
                      Container(
                        width: 353.w,
                        height: 62.h,
                        decoration: BoxDecoration(
                            border: Border.all(color: ColorsManager.mainBlue),
                            borderRadius: BorderRadius.circular(5.r),
                            color: ColorsManager.mainBlueWith15Opacity),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.h),
                          child: Row(
                            children: [
                              Text(
                                'Upload here',
                                style: TextStyles.font12lightBlackLight,
                              ),
                              const Spacer(),
                              SvgPicture.asset('assets/svgs/upload_button.svg')
                            ],
                          ),
                        ),
                      ),
                      verticalSpace(25),
                      Text(
                        'Upload your CV',
                        style: TextStyles.font14lightBlackRegular,
                      ),
                      Container(
                        width: 353.w,
                        height: 62.h,
                        decoration: BoxDecoration(
                            border: Border.all(color: ColorsManager.mainBlue),
                            borderRadius: BorderRadius.circular(5.r),
                            color: ColorsManager.mainBlueWith15Opacity),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.h),
                          child: Row(
                            children: [
                              Text(
                                'Upload here',
                                style: TextStyles.font12lightBlackLight,
                              ),
                              const Spacer(),
                              SvgPicture.asset('assets/svgs/upload_button.svg')
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                AppTextButton(
                  onPressed: () {
                    context.pushNamed(Routes.identityAuth);
                  },
                  textButton: 'Done',
                ),
              ],
            ),
          ),
        ));
  }
}
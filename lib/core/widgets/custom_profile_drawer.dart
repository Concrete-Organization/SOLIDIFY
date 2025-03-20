import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/drawer_item.dart';

class CustomProfileDrawer extends StatelessWidget {
  const CustomProfileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: double.infinity,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.white.withOpacity(0.95),
              Colors.white.withOpacity(0.6),
              Colors.white.withOpacity(0.5),
              Colors.white.withOpacity(0.1),
              Colors.white.withOpacity(0.1),
              Colors.white.withOpacity(0.1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 13.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: SvgPicture.asset(
                    'assets/svgs/settings_icon.svg',
                    colorFilter: ColorFilter.mode(
                      ColorsManager.secondaryGold,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                verticalSpace(22),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Text(
                    'More info and support',
                    style: TextStyles.font12LightBlackRegular.copyWith(
                      color: ColorsManager.lightBlack.withOpacity(0.8),
                    ),
                  ),
                ),
                DrawerItem(
                  icon: 'assets/svgs/about_icon.svg',
                  title: 'About',
                  titleStyle: TextStyles.font15lightBlackMedium,
                ),
                DrawerItem(
                  icon: 'assets/svgs/help_icon.svg',
                  title: 'Help',
                  titleStyle: TextStyles.font15lightBlackMedium,
                ),
                DrawerItem(
                  icon: 'assets/svgs/privacy_policy_icon.svg',
                  title: 'Privacy Policy',
                  titleStyle: TextStyles.font15lightBlackMedium,
                ),
                verticalSpace(9),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Text(
                    'Login',
                    style: TextStyles.font12LightBlackRegular.copyWith(
                      color: ColorsManager.lightBlack.withOpacity(0.8),
                    ),
                  ),
                ),
                verticalSpace(10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Text(
                    'Add account',
                    style: TextStyles.font15MainBlueMedium
                  ),
                ),
                DrawerItem(
                  icon: 'assets/svgs/log_out_icon.svg',
                  title: 'Log Out',
                  titleStyle: TextStyles.font15RedMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

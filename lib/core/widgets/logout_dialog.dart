import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/logout_helper.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ColorsManager.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(26.r),
        side: BorderSide(
          color: ColorsManager.mainBlue,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          verticalSpace(22),
          SvgPicture.asset('assets/svgs/logout.svg'),
          verticalSpace(11),
          Text(
            'Are you sure you want to log out?',
            style:
            TextStyles.font14lightBlackRegular.copyWith(
              color:
              ColorsManager.lightBlack.withValues(alpha: 0.8),
            ),
          ),
          verticalSpace(15),
          HorizontalDivider(
            color: ColorsManager.mainBlueWith2Opacity,
            thickness: 0.6,
          ),
          verticalSpace(14),
          GestureDetector(
            onTap: () {
              LogoutHelper.logout();
            },
            child: Text(
              'Yes, log out now',
              style:
              TextStyles.font12MainBlueMedium.copyWith(
                color: ColorsManager.red,
              ),
            ),
          ),
          verticalSpace(14),
          HorizontalDivider(
            color: ColorsManager.mainBlueWith2Opacity,
            thickness: 0.6,
          ),
          verticalSpace(14),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              'NO, Return',
              style: TextStyles.font12MainBlueMedium,
            ),
          ),
          verticalSpace(20),
        ],
      ),
    );
  }
}

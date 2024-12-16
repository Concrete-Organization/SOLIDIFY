import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectAccountTypeScreen extends StatefulWidget {
  const SelectAccountTypeScreen({super.key});

  @override
  State<SelectAccountTypeScreen> createState() =>
      _SelectAccountTypeScreenState();
}

class _SelectAccountTypeScreenState extends State<SelectAccountTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                context.pop();
              },
              child: SvgPicture.asset(
                "assets/svgs/back_button.svg",
                fit: BoxFit.scaleDown,
              ),
            ),
            verticalSpace(35),
            Text(
              'Create your account as',
              style: TextStyles.font24MainBlueMedium,
            ),
            verticalSpace(20),
            Container(
              width: 353.w,
              height: 65.h,
              decoration: BoxDecoration(
                  color: ColorsManager.mainBlueWith15Opacity,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: ColorsManager.mainBlue,
                    width: 2.w,
                  )),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/svgs/user_register_icon.svg",
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

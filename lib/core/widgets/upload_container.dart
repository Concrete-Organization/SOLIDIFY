import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../theming/color_manger.dart';
import '../theming/text_styles.dart';

class UploadContainer extends StatelessWidget {
  const UploadContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 353.w,
      height: 62.h,
      decoration: BoxDecoration(
        border: Border.all(color: ColorsManager.mainBlue),
        borderRadius: BorderRadius.circular(5.r),
        color: ColorsManager.mainBlueWith15Opacity,
      ),
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
    );
  }
}

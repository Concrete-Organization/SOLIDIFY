import 'package:flutter/widgets.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FillterNameContainer extends StatelessWidget {
  const FillterNameContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 137.w,
      height: 28.h,
      decoration: BoxDecoration(
          color: ColorsManager.mainBlueWith1Opacity,
          border: Border.all(
            color: ColorsManager.lightBlack,
          ),
          borderRadius: BorderRadius.circular(8.r)),
      child: Center(
        child: Text(
          'All categories',
          style: TextStyles.font12LightBlackRegular,
        ),
      ),
    );
  }
}

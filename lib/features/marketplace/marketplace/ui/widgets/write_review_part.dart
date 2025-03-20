import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WriteReviewPart extends StatelessWidget {
  final TextEditingController? controller;

  const WriteReviewPart({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Write a review ',
            style: TextStyles.font14lightBlackMedium,
            children: [
              TextSpan(
                text: '*',
                style: TextStyles.font14lightBlackMedium.copyWith(
                  color: ColorsManager.cancelRed,
                ),
              ),
            ],
          ),
        ),
        verticalSpace(10),
        Container(
          width: 353.w,
          height: 147.h,
          decoration: BoxDecoration(
            color: ColorsManager.mainBlueWith5Opacity,
            border: Border.all(color: ColorsManager.mainBlue),
            borderRadius: BorderRadius.circular(10.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          child: TextFormField(
            controller: controller,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Write a review for the product',
              hintStyle: TextStyles.font12lightBlackLight,
            ),
          ),
        ),
      ],
    );
  }
}

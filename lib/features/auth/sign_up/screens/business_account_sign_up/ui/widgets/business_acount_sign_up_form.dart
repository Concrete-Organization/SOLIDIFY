import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_form_field.dart';

class BusinessAcountSignUpForm extends StatelessWidget {
  const BusinessAcountSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Company official name ',
          style: TextStyles.font14lightBlackRegular,
        ),
        verticalSpace(10),
        const AppTextFormField(hintText: 'Enter company name'),
        verticalSpace(10),
        Text(
          'Company address ',
          style: TextStyles.font14lightBlackRegular,
        ),
        verticalSpace(10),
        const AppTextFormField(hintText: 'Enter Company address '),
        verticalSpace(20),
        Text(
          'Commercial registration number ',
          style: TextStyles.font14lightBlackRegular,
        ),
        verticalSpace(10),
        const AppTextFormField(
            hintText: 'Enter Commercial registration number'),
        verticalSpace(20),
        Text(
          'Tax ID ',
          style: TextStyles.font14lightBlackRegular,
        ),
        verticalSpace(10),
        const AppTextFormField(hintText: 'Only 12 numbers'),
        verticalSpace(20),
        Text(
          'Copy of the commercial license',
          style: TextStyles.font14lightBlackRegular,
        ),
        verticalSpace(10),
        Container(
          width: 353.w,
          height: 62.h,
          decoration: BoxDecoration(
              border: Border.all(color: ColorsManager.mainBlue),
              borderRadius: BorderRadius.circular(5.r),
              color: ColorsManager.mainBlueWith15Opacity),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
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
    ));
  }
}

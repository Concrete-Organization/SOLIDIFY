import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/app_text_form_field.dart';

class ContactInfoForm extends StatelessWidget {
  const ContactInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Company official phone number ',
            style: TextStyles.font14lightBlackRegular,
          ),
          verticalSpace(5),
          const AppTextFormField(
            hintText: 'Enter Company official phone number',
          ),
          verticalSpace(18),
          Text(
            'Company official email ',
            style: TextStyles.font14lightBlackRegular,
          ),
          verticalSpace(5),
          const AppTextFormField(hintText: 'Enter Enter company email '),
          verticalSpace(18),
          Text(
            'Company website (Optional) ',
            style: TextStyles.font14lightBlackRegular,
          ),
          verticalSpace(5),
          const AppTextFormField(hintText: 'Enter Company website'),
          verticalSpace(18),
          Text(
            'Social media accounts (Optional) ',
            style: TextStyles.font14lightBlackRegular,
          ),
          verticalSpace(5),
          AppTextFormField(
            hintText: 'Facebook account',
            prefixIcon: SvgPicture.asset('assets/svgs/facebook_colored.svg'),
            textFieldHeight: 47.h,
          ),
          verticalSpace(18),
          AppTextFormField(
            hintText: 'Instagram account',
            prefixIcon: SvgPicture.asset('assets/svgs/instagram_colored.svg'),
            textFieldHeight: 47.h,
          ),
          verticalSpace(18),
          AppTextFormField(
            hintText: 'Twitter account',
            prefixIcon: SvgPicture.asset('assets/svgs/twitter.svg'),
            textFieldHeight: 47.h,
          ),
          verticalSpace(20),
        ],
      ),
    );
  }
}

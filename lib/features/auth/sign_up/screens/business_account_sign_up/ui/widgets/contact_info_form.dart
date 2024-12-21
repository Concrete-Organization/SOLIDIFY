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
        verticalSpace(10),
        const AppTextFormField(hintText: 'Enter Company official phone number'),
        verticalSpace(10),
        Text(
          'Company official email ',
          style: TextStyles.font14lightBlackRegular,
        ),
        verticalSpace(10),
        const AppTextFormField(hintText: 'Enter Enter company email '),
        verticalSpace(20),
        Text(
          'Company website (Optional) ',
          style: TextStyles.font14lightBlackRegular,
        ),
        verticalSpace(10),
        const AppTextFormField(hintText: 'Enter Company website'),
        verticalSpace(35),
        Text(
          'Social media accounts (Optional) ',
          style: TextStyles.font14lightBlackRegular,
        ),
        verticalSpace(10),
        AppTextFormField(
          hintText: 'Facebook account',
          prefixIcon: SvgPicture.asset('assets/svgs/facebook_colored.svg'),
        ),
        verticalSpace(20),
        verticalSpace(10),
        AppTextFormField(
          hintText: 'Instagram account',
          prefixIcon: SvgPicture.asset('assets/svgs/instagram_colored.svg'),
        ),
        verticalSpace(20),
        verticalSpace(10),
        AppTextFormField(
          hintText: 'Twitter account',
          prefixIcon: SvgPicture.asset('assets/svgs/twitter.svg'),
        ),
        verticalSpace(20),
      ],
    ));
  }
}

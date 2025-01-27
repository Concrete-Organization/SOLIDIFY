import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_form_field.dart';
import 'package:solidify/features/auth/sign_up/screens/business_account_sign_up/logic/business_sign_up_cubit.dart';
// features/auth/sign_up/screens/business_account_sign_up/ui/widgets/contact_info_form.dart

class ContactInfoForm extends StatelessWidget {
  const ContactInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BusinessAccountSignUpCubit>();

    return Form(
      key: cubit.contactInfoFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Phone Number
          Text('Company official phone number',
              style: TextStyles.font14lightBlackRegular),
          verticalSpace(5),
          AppTextFormField(
            controller: cubit.phoneNumberController,
            hintText: 'Enter Company official phone number',
            validator: (value) =>
                value!.isEmpty ? 'This field is required' : null,
          ),

          verticalSpace(18),

          // Email
          Text('Company official email',
              style: TextStyles.font14lightBlackRegular),
          verticalSpace(5),
          AppTextFormField(
            controller: cubit.emailController,
            hintText: 'Enter company email',
            validator: (value) =>
                value!.isEmpty ? 'This field is required' : null,
          ),

          verticalSpace(18),

          // Website (Optional)
          Text('Company website (Optional)',
              style: TextStyles.font14lightBlackRegular),
          verticalSpace(5),
          AppTextFormField(
            controller: cubit.companyWebSiteController,
            hintText: 'Enter Company website',
          ),

          verticalSpace(18),

          // Social Media Section
          Text('Social media accounts (Optional)',
              style: TextStyles.font14lightBlackRegular),
          verticalSpace(5),

          // Facebook
          AppTextFormField(
            controller: cubit.faceBookAccountController,
            hintText: 'Facebook account',
            prefixIcon: SvgPicture.asset('assets/svgs/facebook_colored.svg'),
            textFieldHeight: 47.h,
          ),

          verticalSpace(18),

          // Instagram
          AppTextFormField(
            controller: cubit.instagramAccountController,
            hintText: 'Instagram account',
            prefixIcon: SvgPicture.asset('assets/svgs/instagram_colored.svg'),
            textFieldHeight: 47.h,
          ),

          verticalSpace(18),

          // Twitter
          AppTextFormField(
            controller: cubit.twitterAccountController,
            hintText: 'Twitter account',
            prefixIcon: SvgPicture.asset('assets/svgs/twitter.svg'),
            textFieldHeight: 47.h,
          ),
        ],
      ),
    );
  }
}

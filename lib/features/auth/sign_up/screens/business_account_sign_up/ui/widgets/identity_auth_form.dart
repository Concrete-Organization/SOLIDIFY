import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/app_text_form_field.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_sign_up/ui/widgets/upload_container.dart';

class IdentityAuthForm extends StatelessWidget {
  const IdentityAuthForm({super.key});

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
          verticalSpace(5),
          const AppTextFormField(hintText: 'Enter company name'),
          verticalSpace(18),
          Text(
            'Company address ',
            style: TextStyles.font14lightBlackRegular,
          ),
          verticalSpace(5),
          const AppTextFormField(hintText: 'Enter Company address '),
          verticalSpace(18),
          Text(
            'Commercial registration number ',
            style: TextStyles.font14lightBlackRegular,
          ),
          verticalSpace(5),
          const AppTextFormField(
              hintText: 'Enter Commercial registration number'),
          verticalSpace(18),
          Text(
            'Tax ID ',
            style: TextStyles.font14lightBlackRegular,
          ),
          verticalSpace(5),
          const AppTextFormField(hintText: 'Only 12 numbers'),
          verticalSpace(18),
          Text(
            'Copy of the commercial license',
            style: TextStyles.font14lightBlackRegular,
          ),
          verticalSpace(5),
          const UploadContainer(),
        ],
      ),
    );
  }
}

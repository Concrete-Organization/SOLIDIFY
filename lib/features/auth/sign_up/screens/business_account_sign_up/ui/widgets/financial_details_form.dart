import 'package:flutter/material.dart';
import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../core/theming/text_styles.dart';
import '../../../../../../../core/widgets/app_text_form_field.dart';

class FinancialDetailsForm extends StatelessWidget {
  const FinancialDetailsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Company’s bank account',
            style: TextStyles.font14lightBlackRegular,
          ),
          verticalSpace(5),
          const AppTextFormField(hintText: 'Enter Company’s bank account'),
          verticalSpace(18),
          Text(
            'Company’s terms for payment and delivery',
            style: TextStyles.font14lightBlackRegular,
          ),
          verticalSpace(5),
          const AppTextFormField(hintText: 'Enter company’s terms'),
        ],
      ),
    );
  }
}

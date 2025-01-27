import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/app_text_form_field.dart';
import 'package:solidify/features/auth/sign_up/screens/business_account_sign_up/logic/business_sign_up_cubit.dart';
// features/auth/sign_up/screens/business_account_sign_up/ui/widgets/financial_details_form.dart

class FinancialDetailsForm extends StatelessWidget {
  const FinancialDetailsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BusinessAccountSignUpCubit>();

    return Form(
      key: cubit.financialFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bank Account
          Text('Company’s bank account',
              style: TextStyles.font14lightBlackRegular),
          verticalSpace(5),
          AppTextFormField(
            controller: cubit.bankAccountController,
            hintText: 'Enter Company’s bank account',
            validator: (value) =>
                value!.isEmpty ? 'This field is required' : null,
          ),

          verticalSpace(18),

          // Payment Terms
          Text('Company’s terms for payment and delivery',
              style: TextStyles.font14lightBlackRegular),
          verticalSpace(5),
          AppTextFormField(
            controller: cubit.paymentTermController,
            hintText: 'Enter company’s terms',
            validator: (value) =>
                value!.isEmpty ? 'This field is required' : null,
          ),
        ],
      ),
    );
  }
}

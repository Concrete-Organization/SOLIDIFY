import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/features/auth/sign_up/screens/business_account_sign_up/ui/widgets/financial_details_form.dart';

class FinancialDetailsScreen extends StatelessWidget {
  const FinancialDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Financial details ',
            style: TextStyles.font24MainBlueSemiBold,
          ),
          verticalSpace(40),
          const FinancialDetailsForm(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/app_text_form_field.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_sign_up/ui/widgets/upload_container.dart';
import 'package:solidify/features/auth/sign_up/screens/business_account_sign_up/logic/business_sign_up_cubit.dart';
// features/auth/sign_up/screens/business_account_sign_up/ui/widgets/identity_auth_form.dart

class IdentityAuthForm extends StatelessWidget {
  const IdentityAuthForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BusinessAccountSignUpCubit>();

    return Form(
      key: cubit.identityFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Company Name
          Text('Company official name',
              style: TextStyles.font14lightBlackRegular),
          verticalSpace(5),
          AppTextFormField(
            controller: cubit.companyNameController,
            hintText: 'Enter company name',
            validator: (value) =>
                value!.isEmpty ? 'Company name is required' : null,
          ),

          verticalSpace(18),

          // Address
          Text('Company address', style: TextStyles.font14lightBlackRegular),
          verticalSpace(5),
          AppTextFormField(
            controller: cubit.addressController,
            hintText: 'Enter Company address',
            validator: (value) => value!.isEmpty ? 'Address is required' : null,
          ),

          verticalSpace(18),

          // Commercial Number
          Text('Commercial registration number',
              style: TextStyles.font14lightBlackRegular),
          verticalSpace(5),
          AppTextFormField(
            controller: cubit.commercialNumberController,
            hintText: 'Enter Commercial registration number',
            validator: (value) =>
                value!.isEmpty ? 'This field is required' : null,
          ),

          verticalSpace(18),

          // Tax ID
          Text('Tax ID', style: TextStyles.font14lightBlackRegular),
          verticalSpace(5),
          AppTextFormField(
            controller: cubit.taxIdController,
            hintText: 'Only 12 numbers',
            validator: (value) {
              if (value!.isEmpty) return 'Tax ID is required';
              if (value.length != 12) return 'Must be 12 digits';
              return null;
            },
          ),

          verticalSpace(18),

          // Commercial License
          Text('Copy of the commercial license',
              style: TextStyles.font14lightBlackRegular),
          verticalSpace(5),
          const UploadContainer(),
        ],
      ),
    );
  }
}

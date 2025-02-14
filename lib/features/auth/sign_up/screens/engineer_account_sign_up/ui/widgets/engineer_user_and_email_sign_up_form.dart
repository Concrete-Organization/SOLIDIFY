import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/app_validation.dart';
import 'package:solidify/features/auth/sign_up/screens/concrete_company_account_sign_up/logic/concrete_company_sign_up_cubit.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_account_sign_up/logic/engineer_account_sign_up_cubit.dart';
import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../core/theming/text_styles.dart';
import '../../../../../../../core/widgets/app_text_form_field.dart';

class EngineerUserAndEmailSignUpForm extends StatefulWidget {
  const EngineerUserAndEmailSignUpForm({super.key});

  @override
  State<EngineerUserAndEmailSignUpForm> createState() => _EngineerUserAndEmailSignUpFormState();
}

class _EngineerUserAndEmailSignUpFormState extends State<EngineerUserAndEmailSignUpForm> {

  late EngineerAccountSignUpCubit cubit;


  @override
  void initState() {
    super.initState();
    cubit = context.read<EngineerAccountSignUpCubit>();
  }

  @override
  void dispose() {
    cubit.userNameController.dispose();
    cubit.emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Create your account",
          style: TextStyles.font24MainBlueMedium,
        ),
        verticalSpace(20),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(20),
                Form(
                  key: cubit.userAndEmailFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username',
                        style: TextStyles.font14lightBlackRegular,
                      ),
                      verticalSpace(5),
                      AppTextFormField(
                        controller: cubit.userNameController,
                        hintText: 'Enter your User Name',
                        validator: validateName,
                      ),
                      verticalSpace(20),
                      Text(
                        'Email',
                        style: TextStyles.font14lightBlackRegular,
                      ),
                      verticalSpace(5),
                      AppTextFormField(
                        controller: cubit.emailController,
                        hintText: 'Enter your email',
                        validator: validateEmail,
                      ),
                      verticalSpace(20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

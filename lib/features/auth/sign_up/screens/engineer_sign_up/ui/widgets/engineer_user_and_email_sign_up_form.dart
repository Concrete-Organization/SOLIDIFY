import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_sign_up/logic/engineer_sign_up_cubit.dart';
import '../../../../../../../core/helpers/app_regex.dart';
import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../core/theming/text_styles.dart';
import '../../../../../../../core/widgets/app_text_form_field.dart';

class EngineerUserAndEmailSignUpForm extends StatefulWidget {
  const EngineerUserAndEmailSignUpForm({super.key});

  @override
  State<EngineerUserAndEmailSignUpForm> createState() => _EngineerSignUpFormState();
}

class _EngineerSignUpFormState extends State<EngineerUserAndEmailSignUpForm> {

  late EngineerSignUpCubit cubit;


  @override
  void initState() {
    super.initState();
    cubit = context.read<EngineerSignUpCubit>();
  }

  @override
  void dispose() {
    cubit.nameController.dispose();
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
                        controller: cubit.nameController,
                        hintText: 'Enter your User Name',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid Name';
                          }
                          return null;
                        },
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
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !AppRegex.isEmailValid(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
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

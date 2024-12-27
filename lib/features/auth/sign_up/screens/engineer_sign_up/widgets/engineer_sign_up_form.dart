import 'package:flutter/material.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theming/text_styles.dart';
import '../../user_sign_up/ui/widgets/user_sign_up_form.dart';

class EngineerSignUpForm extends StatelessWidget {
  const EngineerSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Create your account",
            style: TextStyles.font24MainBlueMedium,
          ),
          verticalSpace(40),
          const UserSignUpForm(),
        ],
      ),
    );
  }
}
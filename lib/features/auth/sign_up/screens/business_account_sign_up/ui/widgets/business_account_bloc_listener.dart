import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/features/auth/sign_up/screens/business_account_sign_up/logic/business_sign_up_cubit.dart';
import 'package:solidify/features/auth/sign_up/screens/business_account_sign_up/logic/business_account_sign_up_state.dart';

import '../../../../../../../core/widgets/custom_snack_bar.dart';

class BusinessSignUpBlocListener extends StatelessWidget {
  const BusinessSignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<BusinessAccountSignUpCubit, BusinessAccountSignUpState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          businessSignUpLoading: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
          },
          businessSignUpSuccess: (response) {
            Navigator.of(context).pop();
            context.pushNamedAndRemoveUntil(
              Routes.homeScreen,
              predicate: (Route<dynamic> route) => false,
            );
          },
          businessSignUpError: (error) {
            Navigator.of(context).pop();
            CustomSnackBar.showError(
              context,
              error.message,
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/widgets/custom_snack_bar.dart';
import 'package:solidify/core/widgets/loading_circle_indicator.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_account_sign_up/logic/engineer_account_sign_up_cubit.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_account_sign_up/logic/engineer_account_sign_up_state.dart';

class EngineerAccountSignUpBlocListener extends StatelessWidget {
  const EngineerAccountSignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EngineerAccountSignUpCubit, EngineerAccountSignUpState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          engineerSignUpLoading: (_) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => LoadingCircleIndicator(),
            );
          },
          engineerSignUpSuccess: (_) {
            context.pop();
            context.pushNamedAndRemoveUntil(
              Routes.engineerLayout,
              predicate: (Route<dynamic> route) => false,
            );
          },
          engineerSignUpError: (errorState) {
            Navigator.of(context).pop();
            CustomSnackBar.showError(
              context,
              errorState.error.getAllErrorMessages(),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}

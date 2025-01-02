import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_sign_up/logic/engineer_sign_up_cubit.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_sign_up/logic/engineer_sign_up_state.dart';
import '../../../../../../../core/routes/routes_name.dart';

class EngineerSignUpBlocListener extends StatelessWidget {
  const EngineerSignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EngineerSignUpCubit, EngineerSignUpState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          engineerSignUpLoading: (_) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) =>
              const Center(child: CircularProgressIndicator()),
            );
          },
          engineerSignUpSuccess: (_) {
            context.pop();
            context.pushNamedAndRemoveUntil(
              Routes.homeScreen,
              predicate: (Route<dynamic> route) => false,
            );
          },
          engineerSignUpError: (errorState) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  errorState.error.message,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}

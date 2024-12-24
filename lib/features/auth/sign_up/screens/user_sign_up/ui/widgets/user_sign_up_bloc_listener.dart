import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/extensions.dart';
import '../../../../../../../core/routes/routes_name.dart';
import '../../logic/user_sign_up_cubit.dart';
import '../../logic/user_sign_up_state.dart';

class UserSignUpBlocListener extends StatelessWidget {
  const UserSignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserSignUpCubit, UserSignUpState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          userSignUpLoading: (_) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) =>
                  const Center(child: CircularProgressIndicator()),
            );
          },
          userSignUpSuccess: (_) {
            context.pop();
            context.pushNamedAndRemoveUntil(
              Routes.homeScreen,
              predicate: (Route<dynamic> route) => false,
            );
          },
          userSignUpError: (errorState) {
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/widgets/loading_circle_indicator.dart';
import 'package:solidify/features/auth/login/logic/login_cubit.dart';
import 'package:solidify/features/auth/login/logic/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => LoadingCircleIndicator(),
            );
          },
          success: (loginResponse, role) {
            Navigator.of(context).pop();
            if (role == 'Company') {
              context.pushNamedAndRemoveUntil(
                Routes.companyLayout,
                predicate: (Route<dynamic> route) => false,
              );
            } else {
              context.pushNamedAndRemoveUntil(
                Routes.engineerLayout,
                predicate: (Route<dynamic> route) => false,
              );
            }
          },
          error: (error) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  error.getAllErrorMessages(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          },
          tokenExpired: (message) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.orange,
                content: Text(
                  message,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
            context.pushNamedAndRemoveUntil(
              Routes.loginScreen,
              predicate: (Route<dynamic> route) => false,
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}

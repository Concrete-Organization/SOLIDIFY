import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/features/auth/otp/logic/verify_otp_cubit.dart';
import 'package:solidify/features/auth/otp/logic/verify_otp_state.dart';

import '../../../../../core/routes/routes_name.dart';

class OtpBlocListener extends StatelessWidget {
  const OtpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyOtpCubit, VerifyOtpState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
          success: (data) {
            Navigator.pop(context);
            context.pushNamed(Routes.resetPasswordScreen);
          },
          error: (error) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(error.message)),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}

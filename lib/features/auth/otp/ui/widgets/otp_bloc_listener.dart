import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/widgets/custom_snack_bar.dart';
import 'package:solidify/core/widgets/loading_circle_indicator.dart';
import 'package:solidify/features/auth/otp/logic/verify_otp_cubit.dart';
import 'package:solidify/features/auth/otp/logic/verify_otp_state.dart';

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
              builder: (context) => LoadingCircleIndicator(),
            );
          },
          success: (data) {
            Navigator.pop(context);
            context.pushNamed(Routes.resetPasswordScreen);
          },
          error: (error) {
            Navigator.pop(context);
            CustomSnackBar.showError(context, error.getAllErrorMessages());
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}

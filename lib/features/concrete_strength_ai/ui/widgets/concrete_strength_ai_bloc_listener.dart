import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/widgets/loading_circle_indicator.dart';
import 'package:solidify/features/concrete_strength_ai/logic/concrete_strength_ai_cubit.dart';
import 'package:solidify/features/concrete_strength_ai/logic/concrete_strength_ai_state.dart';
import '../../../../../../../core/widgets/custom_snack_bar.dart';

class ConcreteStrengthAiBlocListener extends StatelessWidget {
  const ConcreteStrengthAiBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConcreteStrengthAiCubit, ConcreteStrengthAiState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => LoadingCircleIndicator(),
            );
          },
          success: (response) {
            context.pushNamedAndRemoveUntil(
              Routes.concreteStrengthAiResultScreen,
              predicate: (Route<dynamic> route) => false,
            );
          },
          error: (error) {
            Navigator.of(context).pop();
            CustomSnackBar.showError(
              context,
              error.getAllErrorMessages(),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/widgets/loading_circle_indicator.dart';
import 'package:solidify/features/crack_detection/logic/crack_detection_ai_cubit.dart';
import 'package:solidify/features/crack_detection/logic/crack_detection_ai_state.dart';
import 'package:solidify/features/crack_detection/ui/widgets/crack_detection_success_content.dart';

class CrackDetectionBlocConsumer extends StatelessWidget {
  const CrackDetectionBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CrackDetectionAiCubit, CrackDetectionAiState>(
      listener: (context, state) {
        if (state is Failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error.getAllErrorMessages())),
          );
        }
      },
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => LoadingCircleIndicator(),
          success: (response) => CrackDetectionSuccessContent(response: response),
          failure: (_) => const SizedBox.shrink(),
        );
      },
    );
  }
}
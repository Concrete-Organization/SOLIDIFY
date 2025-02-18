import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/features/concrete_strength_ai/logic/concrete_strength_ai_cubit.dart';
import 'package:solidify/features/concrete_strength_ai/ui/widgets/question_item.dart';

class FirstPageAiQuestions extends StatefulWidget {
  final VoidCallback? onChanged;
  const FirstPageAiQuestions({super.key, this.onChanged});
  @override
  State<FirstPageAiQuestions> createState() => _FirstPageAiQuestionsState();
}

class _FirstPageAiQuestionsState extends State<FirstPageAiQuestions> {
  late ConcreteStrengthAiCubit cubit;

  @override
  void initState() {
    cubit = context.read<ConcreteStrengthAiCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          QuestionItem(
            controller: cubit.cementController,
            question: 'The amount of cement used?',
            unit: 'kg/m³',
            keyword: 'cement',
            number: '1',
            onChanged: widget.onChanged,
          ),
          verticalSpace(26),
          QuestionItem(
            controller: cubit.slagController,
            question: 'The amount of blast furnace slag used?',
            unit: 'kg/m³',
            keyword: 'blast furnace slag',
            number: '2',
            onChanged: widget.onChanged,
          ),
          verticalSpace(26),
          QuestionItem(
            controller: cubit.flyAshController,
            question: 'The amount of fly ash used?',
            unit: 'kg/m³',
            keyword: 'fly ash',
            number: '3',
            onChanged: widget.onChanged,
          ),
          verticalSpace(26),
          QuestionItem(
            controller: cubit.waterController,
            question: 'The amount of water used?',
            unit: 'kg/m³',
            keyword: 'water',
            number: '4',
            onChanged: widget.onChanged,
          ),
        ],
      ),
    );
  }
}

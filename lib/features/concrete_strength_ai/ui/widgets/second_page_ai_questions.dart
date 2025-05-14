import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/features/concrete_strength_ai/logic/concrete_strength_ai_cubit.dart';
import 'package:solidify/features/concrete_strength_ai/ui/widgets/question_item.dart';

class SecondPageAiQuestions extends StatefulWidget {
  final VoidCallback? onChanged;

  const SecondPageAiQuestions({super.key, this.onChanged});

  @override
  State<SecondPageAiQuestions> createState() => _SecondPageAiQuestionsState();
}

class _SecondPageAiQuestionsState extends State<SecondPageAiQuestions> {
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
            controller: cubit.superplasticizerController,
            question: 'The amount of superplasticizer used?',
            unit: 'kg/m³',
            keyword: 'superplasticizer',
            number: '5',
            onChanged: widget.onChanged,
          ),
          verticalSpace(26),
          QuestionItem(
            controller: cubit.coarseAggregateController,
            question: 'The amount of coarse aggregate used?',
            unit: 'kg/m³',
            keyword: 'coarse aggregate',
            number: '6',
            onChanged: widget.onChanged,
          ),
          verticalSpace(26),
          QuestionItem(
            controller: cubit.fineAggregateController,
            question: 'The amount of fine aggregate used?',
            unit: 'kg/m³',
            keyword: 'fine aggregate',
            number: '7',
            onChanged: widget.onChanged,
          ),
          verticalSpace(26),
          QuestionItem(
            controller: cubit.ageController,
            question: 'How many days was the concrete left to dry?',
            unit: 'Days',
            keyword: '',
            number: '8',
            onChanged: widget.onChanged,
          ),
        ],
      ),
    );
  }
}

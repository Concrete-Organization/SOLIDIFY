import 'package:flutter/material.dart';
import 'package:solidify/features/concrete_strength_ai/ui/widgets/second_page_ai_questions.dart';
import 'concrete_strength_ai_forms_list.dart';
import 'first_page_ai_questions.dart';


class ConcreteStrengthAiPageViewBuilder extends StatelessWidget {
  final PageController controller;
  final Function(int) onPageChanged;
  final VoidCallback onTextChanged;

  const ConcreteStrengthAiPageViewBuilder({
    super.key,
    required this.controller,
    required this.onPageChanged,
    required this.onTextChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller,
      itemCount: concreteStrengthAiFormsScreens.length,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) {
        if (index == 0) {
          return FirstPageAiQuestions(onChanged: onTextChanged);
        } else {
          return SecondPageAiQuestions(onChanged: onTextChanged);
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/features/concrete_strength_ai/logic/concrete_strength_ai_cubit.dart';
import 'package:solidify/features/concrete_strength_ai/ui/widgets/concrete_strength_ai_bloc_listener.dart';
import 'package:solidify/features/concrete_strength_ai/ui/widgets/concrete_strength_ai_forms_list.dart';
import 'package:solidify/features/concrete_strength_ai/ui/widgets/concrete_strength_ai_page_view_builder.dart';

class ConcreteStrengthAiQuestionsScreen extends StatefulWidget {
  const ConcreteStrengthAiQuestionsScreen({super.key});

  @override
  State<ConcreteStrengthAiQuestionsScreen> createState() =>
      _ConcreteStrengthAiQuestionsScreenState();
}

class _ConcreteStrengthAiQuestionsScreenState
    extends State<ConcreteStrengthAiQuestionsScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  void _onNextPage() {
    final cubit = context.read<ConcreteStrengthAiCubit>();

    if (currentPage < concreteStrengthAiFormsScreens.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      setState(() => currentPage++);
    } else {
      cubit.submitForm();
    }
  }

  void _onTextChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Concrete Comprehensive\nStrength',
          style: TextStyles.font18MainSemiBold,
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            verticalSpace(96),
            Expanded(
              child: ConcreteStrengthAiPageViewBuilder(
                controller: _controller,
                onPageChanged: (index) => setState(() => currentPage = index),
                onTextChanged: _onTextChanged,
              ),
            ),
            Column(
              children: [
                const ConcreteStrengthAiBlocListener(),
                AppTextButton(
                  onPressed: _onNextPage,
                  textButton:
                  currentPage == concreteStrengthAiFormsScreens.length - 1
                      ? 'Test'
                      : 'Next',
                  enabled: context
                      .read<ConcreteStrengthAiCubit>()
                      .areCurrentPageFieldsFilled(currentPage),
                ),
                verticalSpace(56),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/features/concrete_strength_ai/ui/widgets/question_item.dart';

class ConcreteStrengthAiPageViewBuilder extends StatefulWidget {
  const ConcreteStrengthAiPageViewBuilder({super.key});

  @override
  State<ConcreteStrengthAiPageViewBuilder> createState() =>
      _ConcreteStrengthAiPageViewBuilderState();
}

class _ConcreteStrengthAiPageViewBuilderState
    extends State<ConcreteStrengthAiPageViewBuilder> {
  final PageController _pageController = PageController();

  List<Map<String, String>> getQuestions(int pageIndex) {
    return pageIndex == 0
        ? [
      {
        'question': 'The amount of cement used?',
        'unit': 'kg/m³',
        'keyword': 'cement',
        'number' : '1'
      },
      {
        'question': 'The amount of blast furnace slag used?',
        'unit': 'kg/m³',
        'keyword': 'blast furnace slag',
        'number' : '2'
      },
      {
        'question': 'The amount of fly ash used?',
        'unit': 'kg/m³',
        'keyword': 'fly ash',
        'number' : '3'
      },
      {
        'question': 'The amount of water used?',
        'unit': 'kg/m³',
        'keyword': 'water',
        'number' : '4'
      },
    ]
        : [
      {
        'question': 'The amount of superplasticizer used?',
        'unit': 'kg/m³',
        'keyword': 'superplasticizer',
        'number' : '5'
      },
      {
        'question': 'The amount of coarse aggregate used?',
        'unit': 'kg/m³',
        'keyword': 'coarse aggregate',
        'number' : '6'
      },
      {
        'question': 'How many days was the concrete left to dry?',
        'unit': 'Days',
        'keyword': '',
        'number' : '7'
      },
    ];
  }

  void _goToNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
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
        child: PageView.builder(
          controller: _pageController,
          itemCount: 2,
          itemBuilder: (context, pageIndex) {
            final questions = getQuestions(pageIndex);
            return Column(
              children: [
                verticalSpace(96),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => verticalSpace(26),
                    itemCount: questions.length,
                    itemBuilder: (context, index) {
                      return QuestionItem(
                        question: questions[index]['question']!,
                        unit: questions[index]['unit']!,
                        keyword: questions[index]['keyword']!,
                        number: questions[index]['number']!,
                      );
                    },
                  ),
                ),
                AppTextButton(
                  onPressed: () {
                    if (pageIndex == 0) {
                      _goToNextPage();
                    } else {
                    }

                  },
                  textButton: pageIndex == 0 ? 'Next' : 'Test',
                ),
                verticalSpace(56),
              ],
            );
          },
        ),
      ),
    );
  }
}
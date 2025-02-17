import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/routes/routes_name.dart';
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

  final TextEditingController _cementController = TextEditingController();
  final TextEditingController _blastFurnaceSlagController =
      TextEditingController();
  final TextEditingController _flyAshController = TextEditingController();
  final TextEditingController _waterController = TextEditingController();
  final TextEditingController _superplasticizerController =
      TextEditingController();
  final TextEditingController _coarseAggregateController =
      TextEditingController();
  final TextEditingController _dryingDaysController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _cementController.addListener(_updateState);
    _blastFurnaceSlagController.addListener(_updateState);
    _flyAshController.addListener(_updateState);
    _waterController.addListener(_updateState);
    _superplasticizerController.addListener(_updateState);
    _coarseAggregateController.addListener(_updateState);
    _dryingDaysController.addListener(_updateState);

    _pageController.addListener(() {
      final newPage = _pageController.page?.round() ?? 0;
      if (newPage != _currentPageIndex) {
        setState(() {
          _currentPageIndex = newPage;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _cementController.dispose();
    _blastFurnaceSlagController.dispose();
    _flyAshController.dispose();
    _waterController.dispose();
    _superplasticizerController.dispose();
    _coarseAggregateController.dispose();
    _dryingDaysController.dispose();
    super.dispose();
  }

  void _updateState() {
    if (mounted) {
      setState(() {});
    }
  }

  void _goToNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  int _currentPageIndex = 0;

  List<Map<String, String>> _getQuestions(int pageIndex) {
    return pageIndex == 0
        ? [
            {
              'question': 'The amount of cement used?',
              'unit': 'kg/m³',
              'keyword': 'cement',
              'number': '1'
            },
            {
              'question': 'The amount of blast furnace slag used?',
              'unit': 'kg/m³',
              'keyword': 'blast furnace slag',
              'number': '2'
            },
            {
              'question': 'The amount of fly ash used?',
              'unit': 'kg/m³',
              'keyword': 'fly ash',
              'number': '3'
            },
            {
              'question': 'The amount of water used?',
              'unit': 'kg/m³',
              'keyword': 'water',
              'number': '4'
            },
          ]
        : [
            {
              'question': 'The amount of superplasticizer used?',
              'unit': 'kg/m³',
              'keyword': 'superplasticizer',
              'number': '5'
            },
            {
              'question': 'The amount of coarse aggregate used?',
              'unit': 'kg/m³',
              'keyword': 'coarse aggregate',
              'number': '6'
            },
            {
              'question': 'How many days was the concrete left to dry?',
              'unit': 'Days',
              'keyword': '',
              'number': '7'
            },
          ];
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
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          itemCount: 2,
          itemBuilder: (context, pageIndex) {
            final questions = _getQuestions(pageIndex);
            final currentControllers = pageIndex == 0
                ? [
                    _cementController,
                    _blastFurnaceSlagController,
                    _flyAshController,
                    _waterController,
                  ]
                : [
                    _superplasticizerController,
                    _coarseAggregateController,
                    _dryingDaysController,
                  ];
            final isCurrentPage = pageIndex == _currentPageIndex;
            final allFieldsFilled =
                currentControllers.every((c) => c.text.isNotEmpty) &&
                    isCurrentPage;
            return Column(
              children: [
                verticalSpace(96),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => verticalSpace(26),
                    itemCount: questions.length,
                    itemBuilder: (context, index) {
                      return QuestionItem(
                        controller: currentControllers[index],
                        question: questions[index]['question']!,
                        unit: questions[index]['unit']!,
                        keyword: questions[index]['keyword']!,
                        number: questions[index]['number']!,
                      );
                    },
                  ),
                ),
                AppTextButton(
                  onPressed: allFieldsFilled
                      ? () {
                          if (pageIndex == 0) {
                            _goToNextPage();
                          } else {
                            context.pushReplacementNamed(
                              Routes.concreteStrengthAiResultScreen,
                            );
                          }
                        }
                      : null,
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

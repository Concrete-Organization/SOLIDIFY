import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/features/concrete_strength_ai/ui/widgets/number_of_question_item.dart';
import 'package:solidify/features/concrete_strength_ai/ui/widgets/text_field_of_question_item.dart';
import 'build_question_spans.dart';

class QuestionItem extends StatefulWidget {
  final String question;
  final String unit;
  final String keyword;
  final String number;
  final TextEditingController controller;

  const QuestionItem({
    super.key,
    required this.question,
    required this.unit,
    required this.keyword,
    required this.number,
    required this.controller,
  });

  @override
  State<QuestionItem> createState() => _QuestionItemState();
}

class _QuestionItemState extends State<QuestionItem> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final containerBorderColor = widget.controller.text.isNotEmpty
        ? ColorsManager.mainBlue
        : _isFocused
        ? ColorsManager.secondaryGold
        : ColorsManager.mainBlue;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 13.w),
      decoration: BoxDecoration(
        color: ColorsManager.mainBlueWith5Opacity,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: containerBorderColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              NumberOfQuestionItem(
                number: widget.number,
                isFocused: _isFocused,
                hasText: widget.controller.text.isNotEmpty,
              ),
              horizontalSpace(5),
              RichText(
                text: TextSpan(
                  style: TextStyles.font12LightBlackMedium,
                  children: buildQuestionSpans(
                    widget.question,
                    widget.keyword,
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(9),
          TextFieldOfQuestionItem(
            controller: widget.controller,
            focusNode: _focusNode,
            unit: widget.unit,
          ),
        ],
      ),
    );
  }
}

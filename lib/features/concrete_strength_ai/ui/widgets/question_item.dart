import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/app_text_form_field.dart';
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

    final numberContainerColor = widget.controller.text.isNotEmpty
        ? ColorsManager.mainBlue
        : _isFocused
        ? ColorsManager.secondaryGold
        : ColorsManager.white;

    final numberColor = widget.controller.text.isNotEmpty
        ? ColorsManager.white
        : _isFocused
        ? ColorsManager.white
        : ColorsManager.mainBlue;

    final textFieldBorderColor = widget.controller.text.isNotEmpty
        ? ColorsManager.mainBlue
        : _isFocused
        ? ColorsManager.secondaryGold
        : ColorsManager.mainBlue;

    final shouldWrapNumberContainer =
        widget.controller.text.isNotEmpty || _isFocused;
    final additionalBorderColor = widget.controller.text.isNotEmpty
        ? ColorsManager.mainBlue
        : ColorsManager.secondaryGold;

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
              Container(
                padding: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: shouldWrapNumberContainer
                      ? Border.all(
                    color: additionalBorderColor,
                    width: 1.w,
                  )
                      : null,
                ),
                child: Container(
                  width: 20.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    color: numberContainerColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: containerBorderColor,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      widget.number,
                      style: TextStyles.font12MainBlueMedium.copyWith(
                        color: numberColor,
                      ),
                    ),
                  ),
                ),
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
          SizedBox(
            width: 147.w,
            height: 38.h,
            child: AppTextFormField(
              controller: widget.controller,
              focusNode: _focusNode,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              borderRadius: 10.r,
              inputTextStyle: TextStyles.font12MainBlueMedium,
              borderColor: textFieldBorderColor,
              suffixIcon: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Text(
                  widget.unit,
                  style: TextStyles.font10lightBlackRegularWithOpacity,
                ),
              ),
                onChanged: (value) {
                  final newText = value.replaceAll(RegExp(r'[^0-9.]'), '');
                  if (newText.contains('.') &&
                      newText.indexOf('.') != newText.lastIndexOf('.')) {
                    return;
                  }
                  widget.controller.text = newText;
                  widget.controller.selection = TextSelection.fromPosition(
                    TextPosition(offset: newText.length),
                  );
                  setState(() {});
                }
            ),
          ),
        ],
      ),
    );
  }
}

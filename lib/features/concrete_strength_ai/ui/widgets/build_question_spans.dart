import 'package:flutter/material.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';

List<TextSpan> buildQuestionSpans(String question, String keyword) {
  List<TextSpan> spans = [];
  TextStyle baseStyle = TextStyles.font12LightBlackMedium;

  if (keyword.isEmpty) {
    spans.add(TextSpan(text: question));
    return spans;
  }

  List<String> parts = question.split(keyword);
  if (parts.length < 2) {
    spans.add(TextSpan(text: question));
    return spans;
  }

  spans.add(TextSpan(text: parts[0]));
  spans.add(TextSpan(
    text: keyword,
    style: baseStyle.copyWith(
      color: ColorsManager.mainBlue,
      decoration: TextDecoration.underline,
    ),
  ));
  spans.add(TextSpan(text: parts[1]));

  return spans;
}
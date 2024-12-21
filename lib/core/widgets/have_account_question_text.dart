import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/theming/text_styles.dart';

class HaveAccountQuestionText extends StatelessWidget {
  final String questionText;
  final String clickableText;
  final void Function() onTap;

  const HaveAccountQuestionText({
    super.key,
    required this.questionText,
    required this.clickableText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: questionText,
            style: TextStyles.font15lightBlackRegular,
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onTap,
            text: clickableText,
            style: TextStyles.font15MainBlueMedium,
          ),
        ],
      ),
    );
  }
}

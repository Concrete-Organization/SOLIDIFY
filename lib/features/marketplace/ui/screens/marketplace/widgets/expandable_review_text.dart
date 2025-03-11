import 'package:flutter/material.dart';
import 'package:solidify/core/theming/text_styles.dart';

class ExpandableReviewText extends StatefulWidget {
  final String reviewText; // Add reviewText parameter

  const ExpandableReviewText({super.key, required this.reviewText});

  @override
  State<ExpandableReviewText> createState() => _ExpandableReviewTextState();
}

class _ExpandableReviewTextState extends State<ExpandableReviewText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final TextStyle reviewStyle = TextStyles.font13lightBlackRegular;
    final TextStyle moreStyle = TextStyles.font13MainBlueMedium;

    const int maxChars = 100;
    final bool needTruncation = widget.reviewText.length > maxChars;
    String displayText;
    if (!isExpanded && needTruncation) {
      displayText = '${widget.reviewText.substring(0, maxChars).trim()}... ';
    } else {
      displayText = widget.reviewText;
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: RichText(
        text: TextSpan(
          style: reviewStyle,
          children: [
            TextSpan(text: displayText),
            if (needTruncation)
              TextSpan(
                text: isExpanded ? ' less' : ' more',
                style: moreStyle,
              ),
          ],
        ),
      ),
    );
  }
}

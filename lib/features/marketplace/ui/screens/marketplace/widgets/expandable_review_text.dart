import 'package:flutter/material.dart';
import 'package:solidify/core/theming/text_styles.dart';

class ExpandableReviewText extends StatefulWidget {
  const ExpandableReviewText({super.key});

  @override
  State<ExpandableReviewText> createState() => _ExpandableReviewTextState();
}

class _ExpandableReviewTextState extends State<ExpandableReviewText> {
  bool isExpanded = false;

  final String reviewText =
      "Ambuja cement offers giant compressive strength top-notch quality, combining strength and flexibility for reliable structural support. The product is consistently high-standard, with timely deliveries and excellent customer service.";

  @override
  Widget build(BuildContext context) {
    final TextStyle reviewStyle = TextStyles.font13lightBlackRegular;
    final TextStyle moreStyle = TextStyles.font13MainBlueMedium;

    const int maxChars = 100;
    final bool needTruncation = reviewText.length > maxChars;
    String displayText;
    if (!isExpanded && needTruncation) {
      displayText = '${reviewText.substring(0, maxChars).trim()}... ';
    } else {
      displayText = reviewText;
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
import 'package:flutter/material.dart';
import 'package:solidify/core/theming/text_styles.dart';

class ExpandableReviewText extends StatefulWidget {
  final String productDescription;

  const ExpandableReviewText({super.key, required this.productDescription});

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
    final bool needTruncation = widget.productDescription.length > maxChars;
    String displayText;
    if (!isExpanded && needTruncation) {
      displayText =
          '${widget.productDescription.substring(0, maxChars).trim()}... ';
    } else {
      displayText = widget.productDescription;
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

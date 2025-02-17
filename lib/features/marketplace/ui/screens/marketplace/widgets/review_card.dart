import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewCard extends StatefulWidget {
  const ReviewCard({super.key});

  @override
  State<ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  bool isExpanded = false;

  final String reviewText =
      "Ambuja cement met all my expectations, ensuring no delays "
      "or safety compromises more.";

  @override
  Widget build(BuildContext context) {
    // Expandable text logic
    const int maxChars = 80;
    final bool needTruncation = reviewText.length > maxChars;
    String displayText;
    if (!isExpanded && needTruncation) {
      displayText = '${reviewText.substring(0, maxChars).trim()}... ';
    } else {
      displayText = reviewText;
    }

    return Container(
      width: 353.w,
      // Height is dynamic based on content
      padding: EdgeInsets.all(12.h),
      decoration: BoxDecoration(
        color: ColorsManager.mainBlueWith1Opacity,
        border: Border.all(
          color: ColorsManager.mainBlue,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Circle avatar with an image
          Container(
            width: 42.w,
            height: 42.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorsManager.mainBlue,
              image: DecorationImage(
                image: AssetImage('assets/images/app_prof.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          horizontalSpace(12),
          // Right side: Name, stars, and expandable text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name
                Text(
                  'Ahmed Adel',
                  style: TextStyles.font12LightBlackMedium,
                ),
                verticalSpace(4),
                // Star rating below the name
                Row(
                  children: List.generate(5, (index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 4.w),
                      child: SvgPicture.asset(
                        'assets/svgs/star_icon.svg',
                        width: 14.w,
                        height: 14.h,
                      ),
                    );
                  }),
                ),
                verticalSpace(4),
                // Expandable review text
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: RichText(
                    text: TextSpan(
                      style: TextStyles.font13lightBlackRegular,
                      children: [
                        TextSpan(text: displayText),
                        if (!isExpanded && needTruncation)
                          TextSpan(
                            text: 'more',
                            style: TextStyles.font13MainBlueMedium,
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

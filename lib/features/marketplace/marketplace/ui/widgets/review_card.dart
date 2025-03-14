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
      "or safety compromises.";

  @override
  Widget build(BuildContext context) {
    const int maxChars = 70;
    final bool needTruncation = reviewText.length > maxChars;
    String displayText;
    if (!isExpanded && needTruncation) {
      displayText = '${reviewText.substring(0, maxChars).trim()}... ';
    } else {
      displayText = reviewText;
    }

    return Container(
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
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
            ),
            child: ClipOval(
              child: SvgPicture.asset(
                'assets/svgs/app_prof.svg',
                fit: BoxFit.cover,
                width: 42.w,
                height: 42.h,
              ),
            ),
          ),
          horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ahmed Adel',
                  style: TextStyles.font12LightBlackMedium,
                ),
                verticalSpace(4),
                Row(
                  children: List.generate(5, (index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 4.w),
                      child: SvgPicture.asset(
                        'assets/svgs/star_icon.svg',
                        width: 12.w,
                        height: 12.h,
                      ),
                    );
                  }),
                ),
                verticalSpace(4),
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
                        if (needTruncation)
                          TextSpan(
                            text: isExpanded ? ' less' : ' more',
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
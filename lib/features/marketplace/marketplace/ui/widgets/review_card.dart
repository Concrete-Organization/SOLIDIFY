import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/features/marketplace/marketplace/data/models/get_product_by_id_response_body.dart';

class ReviewCard extends StatefulWidget {
  final ReviewModel review;

  const ReviewCard({super.key, required this.review});

  @override
  State<ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final String reviewText =
        '${widget.review.message}This product is amazing! This product is so good! It exceeded all my expectations. The quality is top-notch, and the delivery was super fast. I highly recommend it to anyone looking for a reliable and durable product. The customer service was also excellent, and they were very helpful throughout the process. Overall';

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
          // Profile image
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
            ),
            child: ClipOval(
              child: widget.review.profileImageUrl != null
                  ? Image.network(
                      widget.review.profileImageUrl!,
                      width: 42.w,
                      height: 42.h,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return SvgPicture.asset(
                          'assets/svgs/app_prof.svg',
                          fit: BoxFit.cover,
                          width: 42.w,
                          height: 42.h,
                        );
                      },
                    )
                  : SvgPicture.asset(
                      'assets/svgs/app_prof.svg',
                      fit: BoxFit.cover,
                      width: 42.w,
                      height: 42.h,
                    ),
            ),
          ),
          horizontalSpace(12),
          // Review content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.review.companyName,
                  style: TextStyles.font12LightBlackMedium,
                ),
                verticalSpace(4),
                Row(
                  children: List.generate(widget.review.userRate.clamp(0, 5),
                      (index) {
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

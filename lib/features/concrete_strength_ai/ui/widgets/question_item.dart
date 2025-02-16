import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'build_question_spans.dart';

class QuestionItem extends StatelessWidget {
  final String question;
  final String unit;
  final String keyword;
  final String number;

  const QuestionItem({
    super.key,
    required this.question,
    required this.unit,
    required this.keyword,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 13.w),
      decoration: BoxDecoration(
        color: ColorsManager.mainBlueWith5Opacity,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 20.w,
                height: 20.h,
                decoration: BoxDecoration(
                  color: ColorsManager.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorsManager.mainBlue,
                  ),
                ),
                child: Center(
                  child: Text(
                    number,
                    style: TextStyles.font12MainBlueMedium,
                  ),
                ),
              ),
              horizontalSpace(5),
              RichText(
                text: TextSpan(
                  style: TextStyles.font12LightBlackMedium,
                  children: buildQuestionSpans(
                    question,
                    keyword,
                  ),
                ),
              ),
            ],
          ),
          Text(
            unit,
            style: TextStyles.font12LightBlackMedium,
          ),
        ],
      ),
    );
  }
}

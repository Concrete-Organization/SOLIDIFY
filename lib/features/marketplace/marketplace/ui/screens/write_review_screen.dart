import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/marketplace/marketplace/ui/widgets/rating_section.dart';
import 'package:solidify/features/marketplace/marketplace/ui/widgets/write_review_part.dart';
import 'package:solidify/features/marketplace/marketplace/ui/widgets/prodcut_row_for_review.dart';

class WriteReviewScreen extends StatelessWidget {
  const WriteReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Write a review',
          style: TextStyles.font18MainSemiBold,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(35),
              ProdcutRowForReview(),
              verticalSpace(20),
              HorizontalDivider(),
              verticalSpace(25),
              WriteReviewPart(),
              verticalSpace(30),
              RatingSection(),
              Spacer(),
              AppTextButton(onPressed: () {}, textButton: 'Submit')
            ],
          ),
        ),
      ),
    );
  }
}

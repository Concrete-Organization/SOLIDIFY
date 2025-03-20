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

class WriteReviewScreen extends StatefulWidget {
  const WriteReviewScreen({super.key});

  @override
  _WriteReviewScreenState createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends State<WriteReviewScreen> {
  final TextEditingController _reviewController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _reviewController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isButtonEnabled = _reviewController.text.trim().isNotEmpty;

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
              const HorizontalDivider(),
              verticalSpace(25),
              WriteReviewPart(controller: _reviewController),
              verticalSpace(30),
              RatingSection(),
              verticalSpace(30),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20.w),
        child: AppTextButton(
          onPressed: isButtonEnabled ? () {} : null,
          textButton: 'Submit',
        ),
      ),
    );
  }
}

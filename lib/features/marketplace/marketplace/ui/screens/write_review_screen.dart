import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/core/widgets/custom_snack_bar.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/core/widgets/loading_circle_indicator.dart';
import 'package:solidify/features/marketplace/marketplace/ui/widgets/rating_section.dart';
import 'package:solidify/features/marketplace/marketplace/ui/widgets/write_review_part.dart';
import 'package:solidify/features/marketplace/marketplace/ui/widgets/product_row_for_review.dart';
import 'package:solidify/features/profile_company/logic/post_review_cubit/post_review_cubit.dart';
import 'package:solidify/features/profile_company/logic/post_review_cubit/post_review_state.dart';

class WriteReviewScreen extends StatefulWidget {
  final String productId;

  const WriteReviewScreen({super.key, required this.productId});

  @override
  State<WriteReviewScreen> createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends State<WriteReviewScreen> {
  final TextEditingController _reviewController = TextEditingController();
  int _rating = 0;

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

  void _updateRating(int rating) {
    setState(() {
      _rating = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isButtonEnabled =
        _reviewController.text.trim().isNotEmpty && _rating > 0;

    return BlocConsumer<PostReviewCubit, PostReviewState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (response) {
            CustomSnackBar.showSuccess(context, 'Review posted successfully');
            Navigator.pop(context);
          },
          error: (error) {
            CustomSnackBar.showError(context, 'Error: ${error.message}');
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
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
                  const ProductRowForReview(),
                  verticalSpace(20),
                  const HorizontalDivider(),
                  verticalSpace(25),
                  WriteReviewPart(controller: _reviewController),
                  verticalSpace(30),
                  RatingSection(
                    onRatingChanged: _updateRating,
                  ),
                  verticalSpace(30),
                  state.maybeWhen(
                    loading: () =>
                        const Center(child: LoadingCircleIndicator()),
                    orElse: () => const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.all(20.w),
            child: AppTextButton(
              onPressed: isButtonEnabled
                  ? () {
                      context.read<PostReviewCubit>().postReview(
                            productId: widget.productId,
                            message: _reviewController.text.trim(),
                            userRate: _rating,
                          );
                    }
                  : null,
              textButton: 'Submit',
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/app_text_form_field.dart';
import 'package:solidify/core/theming/color_manger.dart'; // Import your color manager

class WriteReviewPart extends StatelessWidget {
  const WriteReviewPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            text: 'Write a review ',
            style: TextStyles.font14lightBlackMedium,
            children: [
              TextSpan(
                text: '*',
                style: TextStyles.font14lightBlackMedium.copyWith(
                  color:
                      ColorsManager.cancelRed, // Use your cancelRed color here
                ),
              ),
            ],
          ),
        ),
        verticalSpace(10),
        AppTextFormField(
          height: 147,
          hintText: 'Write a review for the product',
        )
      ],
    );
  }
}

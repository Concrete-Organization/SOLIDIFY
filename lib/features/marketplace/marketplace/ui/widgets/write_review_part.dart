import 'package:flutter/widgets.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/app_text_form_field.dart';

class WriteReviewPart extends StatelessWidget {
  const WriteReviewPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Write a review *',
          style: TextStyles.font14lightBlackMedium,
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

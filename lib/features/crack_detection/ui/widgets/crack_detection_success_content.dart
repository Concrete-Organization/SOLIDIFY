import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/crack_detection/data/models/crack_detection_response_model.dart';
import 'package:solidify/features/crack_detection/ui/widgets/crack_row_result.dart';

class CrackDetectionSuccessContent extends StatelessWidget {
  final CrackDetectionResponseModel response;

  const CrackDetectionSuccessContent({
    super.key,
    required this.response,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(49),
          response.resultImageUrl != null
              ? Image.file(
            response.resultImageUrl!,
            width: double.infinity,
            fit: BoxFit.cover,
          )
              : Image.asset('assets/images/crack_result.png'),
          verticalSpace(18),
          CrackRowResult(
            titleResult: 'Crack Size : ',
            containerResult: 'Medium crack',
          ),
          verticalSpace(14),
          HorizontalDivider(thickness: 0.2),
          verticalSpace(14),
          CrackRowResult(
            titleResult: 'Dangerous degree : ',
            containerResult: 'Moderate crack',
          ),
          verticalSpace(14),
          HorizontalDivider(thickness: 0.2),
          verticalSpace(14),
          Text(
            'Recommendation : ',
            style: TextStyles.font15lightBlackMedium,
          ),
          verticalSpace(8),
          Text(
            '- Minor issue detected. Regular monitoring and sealant application recommended',
            style: TextStyles.font12MainBlueMedium,
          ),
          const Spacer(),
          AppTextButton(
            onPressed: () {
              context.pushNamedAndRemoveUntil(
                Routes.engineerLayout,
                predicate: (route) => false,
              );
            },
            textButton: 'Done',
          ),
          verticalSpace(56),
        ],
      ),
    );
  }
}
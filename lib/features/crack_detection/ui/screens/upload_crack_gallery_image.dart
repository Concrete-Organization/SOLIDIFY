import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/features/crack_detection/ui/widgets/crack_detection_upload_container.dart';

class UploadCrackGalleryImage extends StatelessWidget {
  final File? imageFile;

  const UploadCrackGalleryImage({super.key, this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Upload Image',
          style: TextStyles.font18MainBlueSemiBold,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            verticalSpace(64),
            Text(
              'Upload image to detect your cracks',
              style: TextStyles.font16lightBlackRegular,
            ),
            verticalSpace(15),
            CrackDetectionUploadContainer(imageFile: imageFile),
            Spacer(),
            AppTextButton(
              onPressed: () {
                context.pushNamedAndRemoveUntil(
                  Routes.crackDetectionResultScreen,
                  predicate: (route) => false,
                );
              },
              textButton: 'Detect',
            ),
            verticalSpace(56),
          ],
        ),
      ),
    );
  }
}

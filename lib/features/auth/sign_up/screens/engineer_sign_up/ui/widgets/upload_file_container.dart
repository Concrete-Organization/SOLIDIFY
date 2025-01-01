import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';

class UploadFileContainer extends StatelessWidget {
  final VoidCallback onTap;

  const UploadFileContainer({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            'assets/svgs/dash_container.svg',
            height: 230.h,
            width: 353.w,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 14.h),
              child: Column(
                children: [
                  Text(
                    'Upload your files',
                    style: TextStyles.font20MainBlueMedium,
                  ),
                  verticalSpace(5),
                  Text(
                    'File should be PNG,JPG,PDF',
                    style: TextStyles.font10lightBlackRegularWithOpacity,
                  ),
                  verticalSpace(25),
                  SvgPicture.asset(
                    'assets/svgs/upload_file.svg',
                  ),
                  verticalSpace(25),
                  Text(
                    'Click to upload',
                    style: TextStyles.font12MainBlueMedium.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  verticalSpace(5),
                  Text(
                    'Max File size 25 MB',
                    style: TextStyles.font10lightBlackRegularWithOpacity,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

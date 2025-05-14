import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';

class UploadContainer extends StatelessWidget {
  final bool isUploaded;
  final String? uploadedFileName;
  final String? fileType;
  final VoidCallback? onClose;

  const UploadContainer({
    super.key,
    this.isUploaded = false,
    this.uploadedFileName,
    this.fileType,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 353.w,
      height: 62.h,
      decoration: BoxDecoration(
        border: Border.all(
          color:
          isUploaded ? ColorsManager.mainBlue : ColorsManager.mainBlueWith50Opacity,
        ),
        borderRadius: BorderRadius.circular(5.r),
        color: ColorsManager.mainBlueWith1Opacity,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.h),
        child: Row(
          children: [
            if (isUploaded && fileType != null)
              SvgPicture.asset(
                'assets/svgs/${fileType == 'pdf' ? 'pdf_file' : 'img_file'}.svg',
              )
            else if (isUploaded)
              const Icon(Icons.file_present, color: Colors.blue),
            horizontalSpace(10),
            Expanded(
              child: Text(
                isUploaded ? uploadedFileName ?? 'Uploaded' : 'Upload here',
                overflow: TextOverflow.ellipsis,
                style: isUploaded
                    ? TextStyles.font12MainBlueMedium
                    : TextStyles.font12lightBlackLight,
              ),
            ),
            const Spacer(),
            if (!isUploaded)
              SvgPicture.asset('assets/svgs/upload_button.svg')
            else
              IconButton(
                onPressed: onClose,
                icon: const Icon(Icons.close),
              ),
          ],
        ),
      ),
    );
  }
}

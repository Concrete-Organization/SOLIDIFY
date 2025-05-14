import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path/path.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';

class UploadedFileCard extends StatelessWidget {
  final String name;
  final String size;
  final String type;
  final bool isUploading;
  final VoidCallback onDelete;

  const UploadedFileCard({
    super.key,
    required this.name,
    required this.size,
    required this.type,
    required this.isUploading,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final fileName = basename(name);
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.mainBlueWith1Opacity,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: isUploading
              ? ColorsManager.secondaryGold
              : ColorsManager.mainBlue,
          width: 0.5.w,
        ),
      ),
      child: ListTile(
        leading: SvgPicture.asset(
          type == 'pdf'
              ? 'assets/svgs/pdf_file.svg'
              : 'assets/svgs/img_file.svg',
        ),
        title: Text(
          isUploading ? 'Uploading' : fileName,
          style: TextStyles.font12MainBlueMedium,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${type.toUpperCase()} - $size',
              style: TextStyles.font12lightBlackLight,
            ),
            verticalSpace(5),
            isUploading
                ? SvgPicture.asset('assets/svgs/progress_line.svg')
                : const SizedBox.shrink(),
          ],
        ),
        trailing: isUploading
            ? const SizedBox.shrink()
            : IconButton(
                padding: EdgeInsets.only(left: 30.w),
                icon: const Icon(
                  Icons.delete,
                  color: ColorsManager.secondaryGold,
                ),
                onPressed: onDelete,
              ),
      ),
    );
  }
}

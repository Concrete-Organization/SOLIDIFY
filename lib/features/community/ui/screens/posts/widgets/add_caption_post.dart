import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/core/widgets/app_text_form_field.dart';
import 'package:solidify/features/community/ui/screens/posts/widgets/images_list_view_picker.dart';

class AddCaptionPost extends StatelessWidget {
  final List<XFile> selectedImages;

  const AddCaptionPost({super.key, required this.selectedImages});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(
        color: ColorsManager.mainBlueWith5Opacity,
        border: Border.all(color: ColorsManager.mainBlue),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: AppTextFormField(
                hintText: 'Add caption......',
                hintStyle: TextStyles.font14lightBlackLight,
                backgroundColor: Colors.transparent,
                borderColor: Colors.transparent,
                maxLines: 100,
                keyboardType: TextInputType.multiline,
              ),
            ),
          ),
          if (selectedImages.isNotEmpty)
            ImagesListViewPicker(selectedImages: selectedImages),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: AppTextButton(
              onPressed: () {},
              textButton: 'Post',
            ),
          ),
          verticalSpace(48),
        ],
      ),
    );
  }
}

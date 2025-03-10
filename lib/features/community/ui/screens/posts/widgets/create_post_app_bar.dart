import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/widgets/custom_snack_bar.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'discard_change_dialog.dart';

class CreatePostAppBar extends StatefulWidget {
  final Function(List<XFile>) onImagesSelected;

  const CreatePostAppBar({super.key, required this.onImagesSelected});

  @override
  State<CreatePostAppBar> createState() => _CreatePostAppBarState();
}

class _CreatePostAppBarState extends State<CreatePostAppBar> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImages() async {
    final List<XFile> images = await _picker.pickMultiImage();
    if (images.isNotEmpty) {
      if (images.length > 5) {
        final selectedImages = images.sublist(0, 5);
        CustomSnackBar.showError(
          context,
          'You can select maximum 5 images',
        );
        widget.onImagesSelected(selectedImages);
      } else {
        widget.onImagesSelected(images);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return DiscardChangeDialog();
                      },
                    );
                  },
                  child: SvgPicture.asset(
                    'assets/svgs/close.svg',
                    width: 20.w,
                    height: 20.h,
                    colorFilter: ColorFilter.mode(
                      ColorsManager.mainBlue,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await _pickImages();
                  },
                  child: SvgPicture.asset(
                    'assets/svgs/camera.svg',
                    width: 20.w,
                    height: 20.h,
                    colorFilter: ColorFilter.mode(
                      ColorsManager.mainBlue,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(15),
            const HorizontalDivider(),
          ],
        ),
      ),
    );
  }
}

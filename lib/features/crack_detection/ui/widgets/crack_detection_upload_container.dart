import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';

class CrackDetectionUploadContainer extends StatefulWidget {
  final File? imageFile;

  const CrackDetectionUploadContainer({super.key, this.imageFile});

  @override
  State<CrackDetectionUploadContainer> createState() =>
      _CrackDetectionUploadContainerState();
}

class _CrackDetectionUploadContainerState
    extends State<CrackDetectionUploadContainer> {
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    if (widget.imageFile != null) {
      _selectedImage = widget.imageFile;
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        decoration: BoxDecoration(
          color: ColorsManager.mainBlueWith1Opacity,
          border: Border.all(color: ColorsManager.mainBlue),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: _selectedImage == null
            ? Column(
                children: [
                  verticalSpace(132),
                  SvgPicture.asset('assets/svgs/crack_upload.svg'),
                  verticalSpace(18),
                  Text(
                    'Click to upload image',
                    textAlign: TextAlign.center,
                    style: TextStyles.font15MainBlueRegular.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  verticalSpace(91),
                ],
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.file(
                  _selectedImage!,
                  fit: BoxFit.cover,
                ),
              ),
      ),
    );
  }
}

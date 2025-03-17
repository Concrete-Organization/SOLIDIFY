import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/features/crack_detection/ui/screens/upload_crack_gallery_image.dart';
import 'package:solidify/features/crack_detection/ui/widgets/crack_image_option_container.dart';

class CrackDetectionChooseUploadingImage extends StatefulWidget {
  const CrackDetectionChooseUploadingImage({super.key});

  @override
  State<CrackDetectionChooseUploadingImage> createState() => _CrackDetectionChooseUploadingImageState();
}

class _CrackDetectionChooseUploadingImageState extends State<CrackDetectionChooseUploadingImage> {
  File? _capturedImage;

  Future<void> _openCamera(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _capturedImage = File(pickedFile.path);
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UploadCrackGalleryImage(imageFile: _capturedImage),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cracks Detection',
          style: TextStyles.font18MainBlueSemiBold,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            verticalSpace(64),
            CrackImageOptionContainer(
              onTap: () {
                context.pushNamed(Routes.uploadCrackGalleryImageScreen);
              },
              containerIcon: 'assets/svgs/gallery.svg',
              containerText: 'Upload Image',
            ),
            verticalSpace(36),
            CrackImageOptionContainer(
              onTap: () async {
                await _openCamera(context);
              },
              containerIcon: 'assets/svgs/camera.svg',
              containerText: 'Take a photo',
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:solidify/core/helpers/spacing.dart';

class ImagesListViewPicker extends StatelessWidget {
  final List<XFile> selectedImages;
  final Function(int) onRemoveImage;

  const ImagesListViewPicker({
    super.key,
    required this.selectedImages,
    required this.onRemoveImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: SizedBox(
        height: MediaQuery.of(context).size.height*0.25,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: selectedImages.length,
          separatorBuilder: (context, index) => horizontalSpace(8),
          itemBuilder: (context, index) {
            return Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.file(
                    File(selectedImages[index].path),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: GestureDetector(
                    onTap: () => onRemoveImage(index),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.6),
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(5.w),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 12.w,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

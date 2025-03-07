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
        height: 150.h,
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
                    width: 100.w,
                    height: 150.h,
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
                        color: Colors.black.withOpacity(0.6),
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

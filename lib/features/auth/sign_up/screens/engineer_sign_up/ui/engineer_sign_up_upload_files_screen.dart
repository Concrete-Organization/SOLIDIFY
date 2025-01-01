import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:file_picker/file_picker.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_sign_up/ui/widgets/upload_file_container.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_sign_up/ui/widgets/uploaded_file_card.dart';

class EngineerSignUpUploadFilesScreen extends StatefulWidget {
  const EngineerSignUpUploadFilesScreen({super.key});

  @override
  State<EngineerSignUpUploadFilesScreen> createState() =>
      _EngineerSignUpUploadFilesScreenState();
}

class _EngineerSignUpUploadFilesScreenState
    extends State<EngineerSignUpUploadFilesScreen> {
  List<UploadedFile> uploadedFiles = [];

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg', 'pdf'],
    );

    if (result != null && result.files.isNotEmpty) {
      PlatformFile file = result.files.first;
      setState(() {
        uploadedFiles.add(
          UploadedFile(
            name: file.name,
            size: '${(file.size / (1024 * 1024)).toStringAsFixed(2)} MB',
            type: file.extension ?? 'Unknown',
            isUploading: true,
          ),
        );
      });

      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        uploadedFiles.last.isUploading = false;
      });
    }
  }

  void removeFile(int index) {
    setState(() {
      uploadedFiles.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              UploadFileContainer(
                onTap: pickFile,
              ),
              verticalSpace(31),
              Expanded(
                child: ListView.builder(
                  itemCount: uploadedFiles.length,
                  itemBuilder: (context, index) {
                    final file = uploadedFiles[index];
                    return UploadedFileCard(
                      name: file.name,
                      size: file.size,
                      type: file.type,
                      isUploading: file.isUploading,
                      onDelete: () => removeFile(index),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AppTextButton(
                      onPressed: uploadedFiles.isNotEmpty
                          ? () => Navigator.pop(context, uploadedFiles)
                          : null,
                      textButton: 'Attach File',
                    ),
                  ),
                  horizontalSpace(16),
                  Expanded(
                    child: AppTextButton(
                      backgroundColor: ColorsManager.white,
                      textColor: ColorsManager.mainBlue,
                      onPressed: context.pop,
                      textButton: 'Cancel',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UploadedFile {
  final String name;
  final String size;
  final String type;
  bool isUploading;

  UploadedFile({
    required this.name,
    required this.size,
    required this.type,
    this.isUploading = false,
  });
}

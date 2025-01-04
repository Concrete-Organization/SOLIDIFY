import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_sign_up/ui/widgets/build_uploaded_files_list.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_sign_up/ui/widgets/upload_file_container.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_sign_up/ui/widgets/upload_file_model.dart';

class EngineerSignUpUploadFilesScreen extends StatefulWidget {
  const EngineerSignUpUploadFilesScreen({super.key});

  @override
  State<EngineerSignUpUploadFilesScreen> createState() =>
      _EngineerSignUpUploadFilesScreenState();
}

class _EngineerSignUpUploadFilesScreenState
    extends State<EngineerSignUpUploadFilesScreen> {
  final List<UploadedFile> _uploadedFiles = [];

  bool get _isAnyFileUploading => _uploadedFiles.any((file) => file.isUploading);

  Future<File> saveFileToTempDirectory(PlatformFile platformFile) async {
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/${platformFile.name}');

    if (platformFile.bytes != null) {
      return file.writeAsBytes(platformFile.bytes!);
    } else if (platformFile.path != null) {
      final sourceFile = File(platformFile.path!);
      return sourceFile.copy(file.path);
    } else {
      throw Exception("Unable to save file: both bytes and path are null");
    }
  }

  Future<void> _pickFile() async {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png', 'jpg', 'pdf'],
      );

      if (result != null && result.files.isNotEmpty) {
        final platformFile = result.files.first;
        final savedFile = await saveFileToTempDirectory(platformFile);
        _addFile(savedFile);

        await _simulateUpload();

        if (mounted) {
          _completeUpload();
        }
      }

  }

  void _addFile(File file) {
    setState(() {
      _uploadedFiles.add(
        UploadedFile(
          name: file.path,
          size: '${(file.lengthSync() / (1024 * 1024)).toStringAsFixed(2)} MB',
          type: file.path.split('.').last,
          isUploading: true,
        ),
      );
    });
  }

  Future<void> _simulateUpload() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  void _completeUpload() {
    setState(() {
      _uploadedFiles.last.isUploading = false;
    });
  }

  void _removeFile(int index) {
    setState(() {
      _uploadedFiles.removeAt(index);
    });
  }

  void _attachFile() {
    final uploadedFile = _uploadedFiles.first;
    Navigator.pop(
      context,
      {
        'name': uploadedFile.name,
        'extension': uploadedFile.type,
      },
    );
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
              UploadFileContainer(onTap: _pickFile),
              verticalSpace(31),
              Expanded(
                child: BuildUploadedFilesList(
                  uploadedFiles: _uploadedFiles,
                  onDelete: _removeFile,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AppTextButton(
                      onPressed: _uploadedFiles.isNotEmpty && !_isAnyFileUploading
                          ? _attachFile
                          : null,
                      textButton: 'Attach File',
                    ),
                  ),
                  horizontalSpace(16),
                  Expanded(
                    child: AppTextButton(
                      backgroundColor: ColorsManager.white,
                      textColor: ColorsManager.mainBlue,
                      onPressed: () => Navigator.pop(context),
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
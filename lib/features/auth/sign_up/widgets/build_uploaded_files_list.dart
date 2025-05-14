import 'package:flutter/material.dart';
import 'package:solidify/features/auth/sign_up/widgets/upload_file_model.dart';
import 'package:solidify/features/auth/sign_up/widgets/uploaded_file_card.dart';

class BuildUploadedFilesList extends StatelessWidget {
  final List<UploadedFile> uploadedFiles;
  final Function(int) onDelete;

  const BuildUploadedFilesList({
    super.key,
    required this.uploadedFiles,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: uploadedFiles.length,
      itemBuilder: (context, index) {
        final file = uploadedFiles[index];
        return UploadedFileCard(
          name: file.name,
          size: file.size,
          type: file.type,
          isUploading: file.isUploading,
          onDelete: () => onDelete(index),
        );
      },
    );
  }
}
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

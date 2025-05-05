import 'dart:io';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crack_detection_response_model.g.dart';

@JsonSerializable()
class CrackDetectionResponseModel {
  @JsonKey(
    name: 'result_image_url',
    fromJson: FileConverter.fromJson,
    toJson: FileConverter.toJson,
  )
  final File? resultImageUrl;
  final String status;

  CrackDetectionResponseModel({
    this.resultImageUrl,
    required this.status,
  });

  factory CrackDetectionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CrackDetectionResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CrackDetectionResponseModelToJson(this);

  Future<FormData> toFormData() async {
    final formData = FormData();

    if (resultImageUrl != null && await resultImageUrl!.exists()) {
      formData.files.add(
        MapEntry(
          'image',
          await MultipartFile.fromFile(
            resultImageUrl!.path,
            filename: resultImageUrl!.path.split(Platform.pathSeparator).last,
          ),
        ),
      );
    }

    return formData;
  }
}


class FileConverter {
  static File? fromJson(String? path) {
    if (path == null) return null;
    return File(path);
  }

  static String? toJson(File? file) {
    if (file == null) return null;
    return file.path;
  }
}
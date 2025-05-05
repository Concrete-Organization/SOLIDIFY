import 'dart:io';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crack_detection_request_model.g.dart';

@JsonSerializable()
class CrackDetectionRequestModel {
  @JsonKey(fromJson: FileConverter.fromJson, toJson: FileConverter.toJson)
  final File? image;

  CrackDetectionRequestModel({
    this.image,
  });

  factory CrackDetectionRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CrackDetectionRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CrackDetectionRequestModelToJson(this);

  Future<FormData> toFormData() async {
    final formData = FormData();

    if (image != null && await image!.exists()) {
      formData.files.add(
        MapEntry(
          'image',
          await MultipartFile.fromFile(
            image!.path,
            filename: image!.path.split(Platform.pathSeparator).last,
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
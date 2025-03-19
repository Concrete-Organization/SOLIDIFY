import 'dart:io';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_engineer_profile_request.g.dart';

@JsonSerializable()
class UpdateEngineerProfileRequest {
  @JsonKey(fromJson: FileConverter.fromJson, toJson: FileConverter.toJson)
  final File? profileImageUrl;

  UpdateEngineerProfileRequest({
    this.profileImageUrl,
  });

  factory UpdateEngineerProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateEngineerProfileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateEngineerProfileRequestToJson(this);

  Future<FormData> toFormData() async {
    final formData = FormData();

    if (profileImageUrl != null && await profileImageUrl!.exists()) {
      formData.files.add(
        MapEntry(
          'ProfileImageUrl',
          await MultipartFile.fromFile(
            profileImageUrl!.path,
            filename: profileImageUrl!.path.split(Platform.pathSeparator).last,
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
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_post_request.g.dart';

@JsonSerializable()
class CreatePostRequest {
  final String content;
  @JsonKey(fromJson: FileConverter.fromJson, toJson: FileConverter.toJson)
  final List<File>? imageUris;

  CreatePostRequest({
    required this.content,
    this.imageUris,
  });

  factory CreatePostRequest.fromJson(Map<String, dynamic> json) =>
      _$CreatePostRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePostRequestToJson(this);

  Future<FormData> toFormData() async {
    final formData = FormData();

    formData.fields.add(MapEntry('Content', content));

    if (imageUris != null && imageUris!.isNotEmpty) {
      for (final file in imageUris!) {
        if (await file.exists()) {
          formData.files.add(
            MapEntry(
              'ImageUris',
              await MultipartFile.fromFile(
                file.path,
                filename: file.path.split(Platform.pathSeparator).last,
              ),
            ),
          );
        }
      }
    }

    return formData;
  }
}

class FileConverter {
  static List<File>? fromJson(List<dynamic>? paths) {
    if (paths == null) return null;
    return paths.map((path) => File(path)).toList();
  }

  static List<String>? toJson(List<File>? files) {
    if (files == null) return null;
    return files.map((file) => file.path).toList();
  }
}
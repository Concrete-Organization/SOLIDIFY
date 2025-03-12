import 'package:json_annotation/json_annotation.dart';

part 'create_post_response.g.dart';

@JsonSerializable()
class CreatePostResponse {
  final bool isSucceeded;
  final int statusCode;
  final String message;
  final dynamic model;

  CreatePostResponse({
    required this.isSucceeded,
    required this.statusCode,
    required this.message,
    this.model,
  });

  factory CreatePostResponse.fromJson(Map<String, dynamic> json) =>
      _$CreatePostResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePostResponseToJson(this);
}
import 'package:json_annotation/json_annotation.dart';

part 'like_post_response.g.dart';

@JsonSerializable()
class LikePostResponse {
  final bool isSucceeded;
  final int statusCode;
  final String message;
  final dynamic model;

  LikePostResponse({
    required this.isSucceeded,
    required this.statusCode,
    required this.message,
    this.model,
  });

  factory LikePostResponse.fromJson(Map<String, dynamic> json) =>
      _$LikePostResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LikePostResponseToJson(this);
}
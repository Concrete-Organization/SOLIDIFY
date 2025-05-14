import 'package:json_annotation/json_annotation.dart';

part 'create_comment_response.g.dart';

@JsonSerializable()
class CreateCommentResponse {
  final bool isSucceeded;
  final int statusCode;
  final String message;
  final dynamic model;

  CreateCommentResponse({
    required this.isSucceeded,
    required this.statusCode,
    required this.message,
    this.model,
  });

  factory CreateCommentResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCommentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCommentResponseToJson(this);
}
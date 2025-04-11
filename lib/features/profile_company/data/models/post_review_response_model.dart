import 'package:json_annotation/json_annotation.dart';

part 'post_review_response_model.g.dart';

@JsonSerializable()
class PostReviewResponseModel {
  final bool isSucceeded;
  final int statusCode;
  final String message;
  final dynamic model; // Use dynamic since it's null in the example

  PostReviewResponseModel({
    required this.isSucceeded,
    required this.statusCode,
    required this.message,
    required this.model,
  });

  factory PostReviewResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PostReviewResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostReviewResponseModelToJson(this);
}

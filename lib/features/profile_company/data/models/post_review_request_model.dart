import 'package:json_annotation/json_annotation.dart';

part 'post_review_request_model.g.dart';

@JsonSerializable()
class PostReviewRequestModel {
  @JsonKey(name: 'Message') // Match JSON key exactly
  final String message;
  @JsonKey(name: 'userRate')
  final int userRate;

  PostReviewRequestModel({
    required this.message,
    required this.userRate,
  });

  factory PostReviewRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PostReviewRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostReviewRequestModelToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'post_cart_response_model.g.dart';

@JsonSerializable()
class PostCartResponseModel {
  final bool isSucceeded;
  final int statusCode;
  final String message;
  final dynamic model;

  PostCartResponseModel({
    required this.isSucceeded,
    required this.statusCode,
    required this.message,
    this.model,
  });

  factory PostCartResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PostCartResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostCartResponseModelToJson(this);
}

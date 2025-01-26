import 'package:json_annotation/json_annotation.dart';

part 'forget_password_response_model.g.dart';

@JsonSerializable()
class ForgetPasswordResponseModel {
  final bool isSucceeded;
  final String message;
  final int statusCode;
  final dynamic model;

  ForgetPasswordResponseModel({
    required this.isSucceeded,
    required this.message,
    required this.statusCode,
    required this.model,
  });

  factory ForgetPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordResponseModelToJson(this);
}

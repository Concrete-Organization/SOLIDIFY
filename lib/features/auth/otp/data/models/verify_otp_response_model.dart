import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_response_model.g.dart';

@JsonSerializable()
class VerifyOtpResponseModel {
  final bool isSucceeded;
  final String message;
  final int statusCode;
  final dynamic model;

  VerifyOtpResponseModel({
    required this.isSucceeded,
    required this.message,
    required this.statusCode,
    required this.model,
  });

  factory VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyOtpResponseModelToJson(this);
}
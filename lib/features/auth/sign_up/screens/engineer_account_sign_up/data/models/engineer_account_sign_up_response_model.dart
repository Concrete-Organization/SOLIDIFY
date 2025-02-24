import 'package:json_annotation/json_annotation.dart';

part 'engineer_account_sign_up_response_model.g.dart';

@JsonSerializable()
class EngineerAccountSignUpResponseModel {
  final bool isSucceeded;
  final int statusCode;
  final String message;
  final AuthResponse model;

  EngineerAccountSignUpResponseModel({
    required this.isSucceeded,
    required this.statusCode,
    required this.message,
    required this.model,
  });

  factory EngineerAccountSignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EngineerAccountSignUpResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$EngineerAccountSignUpResponseModelToJson(this);
}

@JsonSerializable()
class AuthResponse {
  final String accessToken;
  final String expiresOn;
  final String refreshToken;
  final String refreshTokenExpiration;

  AuthResponse({
    required this.accessToken,
    required this.expiresOn,
    required this.refreshToken,
    required this.refreshTokenExpiration,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
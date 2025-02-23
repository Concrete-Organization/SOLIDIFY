import 'package:json_annotation/json_annotation.dart';
part 'login_response_body.g.dart';

@JsonSerializable()
class LoginResponseBody {
  final bool isSucceeded;
  final int statusCode;
  final String message;
  final TokenModel model;

  LoginResponseBody({
    required this.isSucceeded,
    required this.statusCode,
    required this.message,
    required this.model,
  });

  factory LoginResponseBody.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseBodyFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseBodyToJson(this);
}

@JsonSerializable()
class TokenModel {
  final String accessToken;
  final DateTime expiresOn;
  final String refreshToken;
  final DateTime refreshTokenExpiration;

  TokenModel({
    required this.accessToken,
    required this.expiresOn,
    required this.refreshToken,
    required this.refreshTokenExpiration,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);
  Map<String, dynamic> toJson() => _$TokenModelToJson(this);
}
import 'package:json_annotation/json_annotation.dart';
part 'refresh_token_model.g.dart';

@JsonSerializable()
class RefreshTokenRequestModel {
  final String refreshToken;

  RefreshTokenRequestModel({required this.refreshToken});

  Map<String, dynamic> toJson() => _$RefreshTokenRequestModelToJson(this);
}

@JsonSerializable()
class RefreshTokenResponseModel {
  final bool isSucceeded;
  final int statusCode;
  final String message;
  final TokenModel model;

  RefreshTokenResponseModel({
    required this.isSucceeded,
    required this.statusCode,
    required this.message,
    required this.model,
  });

  factory RefreshTokenResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$RefreshTokenResponseModelToJson(this);
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
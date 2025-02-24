import 'package:json_annotation/json_annotation.dart';

part 'concrete_company_account_sign_up_response_model.g.dart';

@JsonSerializable()
class ConcreteCompanyAccountSignUpResponseModel {
  final bool isSucceeded;
  final int statusCode;
  final String message;
  final CompanyModel model;

  ConcreteCompanyAccountSignUpResponseModel({
    required this.isSucceeded,
    required this.statusCode,
    required this.message,
    required this.model,
  });

  factory ConcreteCompanyAccountSignUpResponseModel.fromJson(
      Map<String, dynamic> json) =>
      _$ConcreteCompanyAccountSignUpResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ConcreteCompanyAccountSignUpResponseModelToJson(this);
}

@JsonSerializable()
class CompanyModel {
  final String companyName;
  final AuthResponse authResponse;

  CompanyModel({
    required this.companyName,
    required this.authResponse,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyModelToJson(this);
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
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concrete_company_account_sign_up_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConcreteCompanyAccountSignUpResponseModel
    _$ConcreteCompanyAccountSignUpResponseModelFromJson(
            Map<String, dynamic> json) =>
        ConcreteCompanyAccountSignUpResponseModel(
          isSucceeded: json['isSucceeded'] as bool,
          statusCode: (json['statusCode'] as num).toInt(),
          message: json['message'] as String,
          model: CompanyModel.fromJson(json['model'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$ConcreteCompanyAccountSignUpResponseModelToJson(
        ConcreteCompanyAccountSignUpResponseModel instance) =>
    <String, dynamic>{
      'isSucceeded': instance.isSucceeded,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'model': instance.model,
    };

CompanyModel _$CompanyModelFromJson(Map<String, dynamic> json) => CompanyModel(
      companyName: json['companyName'] as String,
      authResponse:
          AuthResponse.fromJson(json['authResponse'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CompanyModelToJson(CompanyModel instance) =>
    <String, dynamic>{
      'companyName': instance.companyName,
      'authResponse': instance.authResponse,
    };

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
      accessToken: json['accessToken'] as String,
      expiresOn: json['expiresOn'] as String,
      refreshToken: json['refreshToken'] as String,
      refreshTokenExpiration: json['refreshTokenExpiration'] as String,
    );

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'expiresOn': instance.expiresOn,
      'refreshToken': instance.refreshToken,
      'refreshTokenExpiration': instance.refreshTokenExpiration,
    };

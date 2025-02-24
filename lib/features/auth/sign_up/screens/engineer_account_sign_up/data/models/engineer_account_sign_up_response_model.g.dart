// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'engineer_account_sign_up_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EngineerAccountSignUpResponseModel _$EngineerAccountSignUpResponseModelFromJson(
        Map<String, dynamic> json) =>
    EngineerAccountSignUpResponseModel(
      isSucceeded: json['isSucceeded'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      model: AuthResponse.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EngineerAccountSignUpResponseModelToJson(
        EngineerAccountSignUpResponseModel instance) =>
    <String, dynamic>{
      'isSucceeded': instance.isSucceeded,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'model': instance.model,
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

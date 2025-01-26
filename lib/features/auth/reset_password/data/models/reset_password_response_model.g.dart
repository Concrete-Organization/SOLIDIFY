// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordResponseModel _$ResetPasswordResponseModelFromJson(
        Map<String, dynamic> json) =>
    ResetPasswordResponseModel(
      isSucceeded: json['isSucceeded'] as bool,
      model: json['model'],
      message: json['message'] as String,
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$ResetPasswordResponseModelToJson(
        ResetPasswordResponseModel instance) =>
    <String, dynamic>{
      'isSucceeded': instance.isSucceeded,
      'model': instance.model,
      'message': instance.message,
      'statusCode': instance.statusCode,
    };

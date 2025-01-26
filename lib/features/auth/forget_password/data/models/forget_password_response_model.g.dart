// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetPasswordResponseModel _$ForgetPasswordResponseModelFromJson(
        Map<String, dynamic> json) =>
    ForgetPasswordResponseModel(
      isSucceeded: json['isSucceeded'] as bool,
      message: json['message'] as String,
      statusCode: (json['statusCode'] as num).toInt(),
      model: json['model'],
    );

Map<String, dynamic> _$ForgetPasswordResponseModelToJson(
        ForgetPasswordResponseModel instance) =>
    <String, dynamic>{
      'isSucceeded': instance.isSucceeded,
      'message': instance.message,
      'statusCode': instance.statusCode,
      'model': instance.model,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOtpResponseModel _$VerifyOtpResponseModelFromJson(
        Map<String, dynamic> json) =>
    VerifyOtpResponseModel(
      isSucceeded: json['isSucceeded'] as bool,
      message: json['message'] as String,
      statusCode: (json['statusCode'] as num).toInt(),
      model: json['model'],
    );

Map<String, dynamic> _$VerifyOtpResponseModelToJson(
        VerifyOtpResponseModel instance) =>
    <String, dynamic>{
      'isSucceeded': instance.isSucceeded,
      'message': instance.message,
      'statusCode': instance.statusCode,
      'model': instance.model,
    };

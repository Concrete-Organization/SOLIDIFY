// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_account_sign_up_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessAccountSignUpResponseModel _$BusinessAccountSignUpResponseModelFromJson(
        Map<String, dynamic> json) =>
    BusinessAccountSignUpResponseModel(
      isSucceeded: json['isSucceeded'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      model:
          BusinessAccountModel.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BusinessAccountSignUpResponseModelToJson(
        BusinessAccountSignUpResponseModel instance) =>
    <String, dynamic>{
      'isSucceeded': instance.isSucceeded,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'model': instance.model,
    };

BusinessAccountModel _$BusinessAccountModelFromJson(
        Map<String, dynamic> json) =>
    BusinessAccountModel(
      id: json['id'] as String,
      userName: json['userName'] as String,
      companyName: json['companyName'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$BusinessAccountModelToJson(
        BusinessAccountModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'companyName': instance.companyName,
      'email': instance.email,
    };

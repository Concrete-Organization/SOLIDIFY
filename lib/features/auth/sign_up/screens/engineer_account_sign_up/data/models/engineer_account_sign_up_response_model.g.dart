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
      model: json['model'] == null
          ? null
          : UserModel.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EngineerAccountSignUpResponseModelToJson(
        EngineerAccountSignUpResponseModel instance) =>
    <String, dynamic>{
      'isSucceeded': instance.isSucceeded,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'model': instance.model,
    };

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String,
      userName: json['userName'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'email': instance.email,
    };

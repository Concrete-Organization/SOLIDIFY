// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'engineer_account_sign_up_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EngineerAccountSignUpRequestModel _$EngineerAccountSignUpRequestModelFromJson(
        Map<String, dynamic> json) =>
    EngineerAccountSignUpRequestModel(
      userName: json['userName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      confirmPassword: json['confirmPassword'] as String,
    );

Map<String, dynamic> _$EngineerAccountSignUpRequestModelToJson(
        EngineerAccountSignUpRequestModel instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'email': instance.email,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
    };

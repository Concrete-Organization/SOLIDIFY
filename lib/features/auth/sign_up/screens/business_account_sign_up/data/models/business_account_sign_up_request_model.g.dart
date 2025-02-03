// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_account_sign_up_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessAccountSignUpRequestModel _$BusinessAccountSignUpRequestModelFromJson(
        Map<String, dynamic> json) =>
    BusinessAccountSignUpRequestModel(
      companyName: json['companyName'] as String,
      commercialNumber: json['commercialNumber'] as String,
      taxId: json['taxId'] as String,
      userName: json['userName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      confirmPassword: json['confirmPassword'] as String,
      companyAddress: json['companyAddress'] as String,
      commercialLicense:
          FileConverter.fromJson(json['commercialLicense'] as String?),
    );

Map<String, dynamic> _$BusinessAccountSignUpRequestModelToJson(
        BusinessAccountSignUpRequestModel instance) =>
    <String, dynamic>{
      'companyName': instance.companyName,
      'commercialNumber': instance.commercialNumber,
      'taxId': instance.taxId,
      'userName': instance.userName,
      'email': instance.email,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'companyAddress': instance.companyAddress,
      'commercialLicense': FileConverter.toJson(instance.commercialLicense),
    };

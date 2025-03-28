// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concrete_company_account_sign_up_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConcreteCompanyAccountSignUpRequestModel
    _$ConcreteCompanyAccountSignUpRequestModelFromJson(
            Map<String, dynamic> json) =>
        ConcreteCompanyAccountSignUpRequestModel(
          companyName: json['companyName'] as String,
          commercialNumber: json['commercialNumber'] as String,
          taxId: json['taxId'] as String,
          userName: json['userName'] as String,
          email: json['email'] as String,
          password: json['password'] as String,
          confirmPassword: json['confirmPassword'] as String,
          address: json['address'] as String,
          commercialLicense:
              FileConverter.fromJson(json['commercialLicense'] as String?),
        );

Map<String, dynamic> _$ConcreteCompanyAccountSignUpRequestModelToJson(
        ConcreteCompanyAccountSignUpRequestModel instance) =>
    <String, dynamic>{
      'companyName': instance.companyName,
      'commercialNumber': instance.commercialNumber,
      'taxId': instance.taxId,
      'userName': instance.userName,
      'email': instance.email,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'address': instance.address,
      'commercialLicense': FileConverter.toJson(instance.commercialLicense),
    };

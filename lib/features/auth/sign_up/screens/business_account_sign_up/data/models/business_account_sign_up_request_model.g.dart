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
      companyWebSite: json['companyWebSite'] as String,
      faceBookAccount: json['faceBookAccount'] as String,
      instagramAccount: json['instagramAccount'] as String,
      twitterAccount: json['twitterAccount'] as String,
      bankAccount: json['bankAccount'] as String,
      paymentTerm: json['paymentTerm'] as String,
      userName: json['userName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      confirmPassword: json['confirmPassword'] as String,
      phoneNumber: json['phoneNumber'] as String,
      address: json['address'] as String,
      commercialLicense:
          FileConverter.fromJson(json['commercialLicense'] as String?),
    );

Map<String, dynamic> _$BusinessAccountSignUpRequestModelToJson(
        BusinessAccountSignUpRequestModel instance) =>
    <String, dynamic>{
      'companyName': instance.companyName,
      'commercialNumber': instance.commercialNumber,
      'taxId': instance.taxId,
      'companyWebSite': instance.companyWebSite,
      'faceBookAccount': instance.faceBookAccount,
      'instagramAccount': instance.instagramAccount,
      'twitterAccount': instance.twitterAccount,
      'bankAccount': instance.bankAccount,
      'paymentTerm': instance.paymentTerm,
      'userName': instance.userName,
      'email': instance.email,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'commercialLicense': FileConverter.toJson(instance.commercialLicense),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'engineer_sign_up_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EngineerSignUpRequestModel _$EngineerSignUpRequestModelFromJson(
        Map<String, dynamic> json) =>
    EngineerSignUpRequestModel(
      userName: json['userName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      confirmPassword: json['confirmPassword'] as String,
      phoneNumber: json['phoneNumber'] as String,
      address: json['address'] as String,
      cvFile: FileConverter.fromJson(json['cvFile'] as String?),
      syndicateCard: FileConverter.fromJson(json['syndicateCard'] as String?),
    );

Map<String, dynamic> _$EngineerSignUpRequestModelToJson(
        EngineerSignUpRequestModel instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'email': instance.email,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'cvFile': FileConverter.toJson(instance.cvFile),
      'syndicateCard': FileConverter.toJson(instance.syndicateCard),
    };

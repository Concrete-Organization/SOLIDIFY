// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_sign_up_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSignUpRequestModel _$UserSignUpRequestModelFromJson(
        Map<String, dynamic> json) =>
    UserSignUpRequestModel(
      userName: json['userName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      confirmPassword: json['confirmPassword'] as String,
      phoneNumber: (json['phoneNumber'] as num).toInt(),
      address: json['address'] as String,
    );

Map<String, dynamic> _$UserSignUpRequestModelToJson(
        UserSignUpRequestModel instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'email': instance.email,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
    };

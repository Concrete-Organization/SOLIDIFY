import 'package:json_annotation/json_annotation.dart';

part 'business_account_sign_up_response_model.g.dart';

@JsonSerializable()
class BusinessAccountSignUpResponseModel {
  final bool isSucceeded;
  final int statusCode;
  final String message;
  final BusinessAccountModel model;

  BusinessAccountSignUpResponseModel({
    required this.isSucceeded,
    required this.statusCode,
    required this.message,
    required this.model,
  });

  factory BusinessAccountSignUpResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$BusinessAccountSignUpResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$BusinessAccountSignUpResponseModelToJson(this);
}

@JsonSerializable()
class BusinessAccountModel {
  final String id;
  final String userName;
  final String companyName;
  final String email;

  BusinessAccountModel({
    required this.id,
    required this.userName,
    required this.companyName,
    required this.email,
  });

  factory BusinessAccountModel.fromJson(Map<String, dynamic> json) =>
      _$BusinessAccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessAccountModelToJson(this);
}

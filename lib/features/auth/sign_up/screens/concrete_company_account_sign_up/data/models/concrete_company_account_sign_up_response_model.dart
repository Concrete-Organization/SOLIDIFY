import 'package:json_annotation/json_annotation.dart';

part 'concrete_company_account_sign_up_response_model.g.dart';

@JsonSerializable()
class ConcreteCompanyAccountSignUpResponseModel {
  final bool isSucceeded;
  final int statusCode;
  final String message;
  final BusinessAccountModel model;

  ConcreteCompanyAccountSignUpResponseModel({
    required this.isSucceeded,
    required this.statusCode,
    required this.message,
    required this.model,
  });

  factory ConcreteCompanyAccountSignUpResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$ConcreteCompanyAccountSignUpResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ConcreteCompanyAccountSignUpResponseModelToJson(this);
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

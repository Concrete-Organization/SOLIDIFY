import 'package:json_annotation/json_annotation.dart';

part 'engineer_sign_up_response_model.g.dart';

@JsonSerializable()
class EngineerSignUpResponseModel {
  final bool isSucceeded;
  final int statusCode;
  final String message;
  final UserModel? model;

  EngineerSignUpResponseModel({
    required this.isSucceeded,
    required this.statusCode,
    required this.message,
    this.model,
  });

  factory EngineerSignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EngineerSignUpResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$EngineerSignUpResponseModelToJson(this);
}

@JsonSerializable()
class UserModel {
  final String id;
  final String userName;
  final String email;

  UserModel({
    required this.id,
    required this.userName,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

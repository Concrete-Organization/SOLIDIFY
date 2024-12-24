import 'package:json_annotation/json_annotation.dart';

part 'user_sign_up_response_model.g.dart';

@JsonSerializable()
class UserSignUpResponseModel {
  final bool isSucceeded;
  final int statusCode;
  final String message;
  final UserModel? model;

  UserSignUpResponseModel({
    required this.isSucceeded,
    required this.statusCode,
    required this.message,
    this.model,
  });

  factory UserSignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserSignUpResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserSignUpResponseModelToJson(this);
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

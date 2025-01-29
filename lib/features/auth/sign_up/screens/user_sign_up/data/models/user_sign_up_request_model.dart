import 'package:json_annotation/json_annotation.dart';

part 'user_sign_up_request_model.g.dart';

@JsonSerializable()
class UserSignUpRequestModel {
  final String userName;
  final String email;
  final String password;
  final String confirmPassword;

  UserSignUpRequestModel({
    required this.userName,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  /// Factory constructor for creating a new `UserSignUpRequestModel` instance
  /// from a JSON map.
  factory UserSignUpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UserSignUpRequestModelFromJson(json);

  /// A method to convert this object to JSON.
  Map<String, dynamic> toJson() => _$UserSignUpRequestModelToJson(this);
}

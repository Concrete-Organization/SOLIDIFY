import 'package:json_annotation/json_annotation.dart';

part 'engineer_account_sign_up_request_model.g.dart';

@JsonSerializable()
class EngineerAccountSignUpRequestModel {
  final String userName;
  final String email;
  final String password;
  final String confirmPassword;

  EngineerAccountSignUpRequestModel({
    required this.userName,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  /// Factory constructor for creating a new `UserSignUpRequestModel` instance
  /// from a JSON map.
  factory EngineerAccountSignUpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$EngineerAccountSignUpRequestModelFromJson(json);

  /// A method to convert this object to JSON.
  Map<String, dynamic> toJson() => _$EngineerAccountSignUpRequestModelToJson(this);
}

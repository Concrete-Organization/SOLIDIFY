import 'package:json_annotation/json_annotation.dart';

part 'engineer_sign_up_request_model.g.dart';

@JsonSerializable()
class EngineerSignUpRequestModel {
  final String userName;
  final String email;
  final String password;
  final String confirmPassword;
  final String phoneNumber;
  final String address;
  final String cvFile;
  final String syndicateCard;

  EngineerSignUpRequestModel({
    required this.userName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phoneNumber,
    required this.address,
    required this.cvFile,
    required this.syndicateCard,
  });

  /// Factory constructor for creating a new `UserSignUpRequestModel` instance
  /// from a JSON map.
  factory EngineerSignUpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$EngineerSignUpRequestModelFromJson(json);

  /// A method to convert this object to JSON.
  Map<String, dynamic> toJson() => _$EngineerSignUpRequestModelToJson(this);
}

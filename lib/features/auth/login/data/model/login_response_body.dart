import 'package:json_annotation/json_annotation.dart';
part 'login_response_body.g.dart';

@JsonSerializable()
class LoginResponseBody {
  final bool isSucceeded;
  final int statusCode;
  final String message;
  final TokenModel model;

  LoginResponseBody({
    required this.isSucceeded,
    required this.statusCode,
    required this.message,
    required this.model,
  });

  /// A factory constructor for creating a new `LoginResponseBody` instance
  /// from a map (which is the deserialized JSON).
  factory LoginResponseBody.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseBodyFromJson(json);

  /// A method that serializes the `LoginResponseBody` instance to a map
  /// (which will be serialized into JSON).
  Map<String, dynamic> toJson() => _$LoginResponseBodyToJson(this);
}

@JsonSerializable()
class TokenModel {
  final String token;
  final List<String> roles;
  final String expireDate;

  TokenModel({
    required this.token,
    required this.roles,
    required this.expireDate,
  });

  /// A factory constructor for creating a new `TokenModel` instance
  /// from a map (which is the deserialized JSON).
  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);

  /// A method that serializes the `TokenModel` instance to a map
  /// (which will be serialized into JSON).
  Map<String, dynamic> toJson() => _$TokenModelToJson(this);
}
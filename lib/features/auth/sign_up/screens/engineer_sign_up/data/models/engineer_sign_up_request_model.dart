import 'dart:io';
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

  @JsonKey(fromJson: _fileFromJson, toJson: _fileToJson)
  final File? cvFile;

  @JsonKey(fromJson: _fileFromJson, toJson: _fileToJson)
  final File? syndicateCard;

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

  factory EngineerSignUpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$EngineerSignUpRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$EngineerSignUpRequestModelToJson(this);

  static File? _fileFromJson(String? json) => json != null ? File(json) : null;
  static String? _fileToJson(File? file) => file?.path;}

class FileConverter implements JsonConverter<File, String> {
  const FileConverter();

  @override
  File fromJson(String json) {
    return File(json);
  }

  @override
  String toJson(File object) {
    return object.path;
  }
}


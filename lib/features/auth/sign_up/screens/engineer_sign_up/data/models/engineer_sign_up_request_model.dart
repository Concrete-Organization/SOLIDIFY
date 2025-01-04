import 'dart:io';
import 'package:dio/dio.dart';
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

  @JsonKey(fromJson: FileConverter.fromJson, toJson: FileConverter.toJson)
  final File? cvFile;

  @JsonKey(fromJson: FileConverter.fromJson, toJson: FileConverter.toJson)
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

  Future<FormData> toFormData() async {
    final formData = FormData();

    formData.fields.addAll([
      MapEntry('userName', userName),
      MapEntry('email', email),
      MapEntry('password', password),
      MapEntry('confirmPassword', confirmPassword),
      MapEntry('phoneNumber', phoneNumber),
      MapEntry('address', address),
    ]);

    if (cvFile != null) {
      if (!await cvFile!.exists()) {
        return formData;
      }
      formData.files.add(
        MapEntry(
          'CV',
          await MultipartFile.fromFile(
              cvFile!.path,
              filename: cvFile!.path.split(Platform.pathSeparator).last
          ),
        ),
      );
    }

    if (syndicateCard != null) {
      if (!await syndicateCard!.exists()) {
        return formData;
      }
      formData.files.add(
        MapEntry(
          'SyndicateCard',
          await MultipartFile.fromFile(
              syndicateCard!.path,
              filename: syndicateCard!.path.split(Platform.pathSeparator).last
          ),
        ),
      );
    }

    return formData;
  }}

class FileConverter {
  static File? fromJson(String? path) => path != null ? File(path) : null;
  static String? toJson(File? file) => file?.path;
}
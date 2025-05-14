import 'dart:io';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'concrete_company_account_sign_up_request_model.g.dart';

@JsonSerializable()
class ConcreteCompanyAccountSignUpRequestModel {
  final String companyName;
  final String commercialNumber;
  final String taxId;
  final String userName;
  final String email;
  final String password;
  final String confirmPassword;
  final String address;

  @JsonKey(fromJson: FileConverter.fromJson, toJson: FileConverter.toJson)
  final File? commercialLicense;

  ConcreteCompanyAccountSignUpRequestModel({
    required this.companyName,
    required this.commercialNumber,
    required this.taxId,
    required this.userName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.address,
    required this.commercialLicense,
  });

  factory ConcreteCompanyAccountSignUpRequestModel.fromJson(
          Map<String, dynamic> json) =>
      _$ConcreteCompanyAccountSignUpRequestModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ConcreteCompanyAccountSignUpRequestModelToJson(this);

  Future<FormData> toFormData() async {
    final formData = FormData();

    formData.fields.addAll([
      MapEntry('CompanyName', companyName),
      MapEntry('CommericalNumber', commercialNumber),
      MapEntry('TaxId', taxId),
      MapEntry('UserName', userName),
      MapEntry('Email', email),
      MapEntry('Password', password),
      MapEntry('ConfirmPassword', confirmPassword),
      MapEntry('Address', address),
    ]);

    if (commercialLicense != null) {
      if (!await commercialLicense!.exists()) {
        return formData;
      }
      formData.files.add(
        MapEntry(
          'CommericalLicense',
          await MultipartFile.fromFile(commercialLicense!.path,
              filename:
                  commercialLicense!.path.split(Platform.pathSeparator).last),
        ),
      );
    }

    return formData;
  }
}

class FileConverter {
  static File? fromJson(String? path) => path != null ? File(path) : null;
  static String? toJson(File? file) => file?.path;
}

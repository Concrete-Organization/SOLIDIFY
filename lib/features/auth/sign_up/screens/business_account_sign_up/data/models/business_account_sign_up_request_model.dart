import 'dart:io';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'business_account_sign_up_request_model.g.dart';

@JsonSerializable()
class BusinessAccountSignUpRequestModel {
  final String companyName;
  final String commercialNumber;
  final String taxId;
  final String companyWebSite;
  final String faceBookAccount;
  final String instagramAccount;
  final String twitterAccount;
  final String bankAccount;
  final String paymentTerm;
  final String userName;
  final String email;
  final String password;
  final String confirmPassword;
  final String phoneNumber;
  final String address;

  @JsonKey(fromJson: FileConverter.fromJson, toJson: FileConverter.toJson)
  final File? commercialLicense;

  BusinessAccountSignUpRequestModel({
    required this.companyName,
    required this.commercialNumber,
    required this.taxId,
    required this.companyWebSite,
    required this.faceBookAccount,
    required this.instagramAccount,
    required this.twitterAccount,
    required this.bankAccount,
    required this.paymentTerm,
    required this.userName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phoneNumber,
    required this.address,
    required this.commercialLicense,
  });

  factory BusinessAccountSignUpRequestModel.fromJson(
          Map<String, dynamic> json) =>
      _$BusinessAccountSignUpRequestModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$BusinessAccountSignUpRequestModelToJson(this);

  Future<FormData> toFormData() async {
    final formData = FormData();

    formData.fields.addAll([
      MapEntry('CompanyName', companyName),
      MapEntry('CommericalNumber', commercialNumber),
      MapEntry('TaxId', taxId),
      MapEntry('CompanyWebSite', companyWebSite),
      MapEntry('FaceBookAccout', faceBookAccount),
      MapEntry('InstagramAccount', instagramAccount),
      MapEntry('TwitterAccount', twitterAccount),
      MapEntry('BankAccount', bankAccount),
      MapEntry('PaymentTerm', paymentTerm),
      MapEntry('UserName', userName),
      MapEntry('Email', email),
      MapEntry('Password', password),
      MapEntry('ConfirmPassword', confirmPassword),
      MapEntry('PhoneNumber', phoneNumber),
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

import 'package:json_annotation/json_annotation.dart';

part 'get_engineer_profile_response.g.dart';

@JsonSerializable()
class GetEngineerProfileResponse {
  final bool isSucceeded;
  final int statusCode;
  final String message;
  final EngineerProfileModel? model;

  GetEngineerProfileResponse({
    required this.isSucceeded,
    required this.statusCode,
    required this.message,
    this.model,
  });

  factory GetEngineerProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$GetEngineerProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetEngineerProfileResponseToJson(this);
}

@JsonSerializable()
class EngineerProfileModel {
  final String? profileImageUrl;
  final String userName;
  final String engineerName;
  final String? bio;
  final String? coverImageUrl;

  EngineerProfileModel({
    this.profileImageUrl,
    required this.userName,
    required this.engineerName,
    this.bio,
    this.coverImageUrl,
  });

  factory EngineerProfileModel.fromJson(Map<String, dynamic> json) =>
      _$EngineerProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$EngineerProfileModelToJson(this);
}
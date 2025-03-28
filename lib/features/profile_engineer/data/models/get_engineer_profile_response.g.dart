// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_engineer_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetEngineerProfileResponse _$GetEngineerProfileResponseFromJson(
        Map<String, dynamic> json) =>
    GetEngineerProfileResponse(
      isSucceeded: json['isSucceeded'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      model: json['model'] == null
          ? null
          : EngineerProfileModel.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetEngineerProfileResponseToJson(
        GetEngineerProfileResponse instance) =>
    <String, dynamic>{
      'isSucceeded': instance.isSucceeded,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'model': instance.model,
    };

EngineerProfileModel _$EngineerProfileModelFromJson(
        Map<String, dynamic> json) =>
    EngineerProfileModel(
      profileImageUrl: json['profileImageUrl'] as String?,
      userName: json['userName'] as String,
      engineerName: json['engineerName'] as String,
      bio: json['bio'] as String?,
      coverImageUrl: json['coverImageUrl'] as String?,
    );

Map<String, dynamic> _$EngineerProfileModelToJson(
        EngineerProfileModel instance) =>
    <String, dynamic>{
      'profileImageUrl': instance.profileImageUrl,
      'userName': instance.userName,
      'engineerName': instance.engineerName,
      'bio': instance.bio,
      'coverImageUrl': instance.coverImageUrl,
    };

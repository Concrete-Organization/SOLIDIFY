// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_engineer_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateEngineerProfileRequest _$UpdateEngineerProfileRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateEngineerProfileRequest(
      profileImageUrl:
          FileConverter.fromJson(json['profileImageUrl'] as String?),
    );

Map<String, dynamic> _$UpdateEngineerProfileRequestToJson(
        UpdateEngineerProfileRequest instance) =>
    <String, dynamic>{
      'profileImageUrl': FileConverter.toJson(instance.profileImageUrl),
    };

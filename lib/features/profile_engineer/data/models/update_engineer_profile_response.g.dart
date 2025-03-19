// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_engineer_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateEngineerProfileResponse _$UpdateEngineerProfileResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateEngineerProfileResponse(
      isSucceeded: json['isSucceeded'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      model: json['model'] as String?,
    );

Map<String, dynamic> _$UpdateEngineerProfileResponseToJson(
        UpdateEngineerProfileResponse instance) =>
    <String, dynamic>{
      'isSucceeded': instance.isSucceeded,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'model': instance.model,
    };

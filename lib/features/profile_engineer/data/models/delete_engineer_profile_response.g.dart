// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_engineer_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteEngineerProfileResponse _$DeleteEngineerProfileResponseFromJson(
        Map<String, dynamic> json) =>
    DeleteEngineerProfileResponse(
      isSucceeded: json['isSucceeded'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      model: json['model'],
    );

Map<String, dynamic> _$DeleteEngineerProfileResponseToJson(
        DeleteEngineerProfileResponse instance) =>
    <String, dynamic>{
      'isSucceeded': instance.isSucceeded,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'model': instance.model,
    };

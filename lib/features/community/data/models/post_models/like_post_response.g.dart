// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LikePostResponse _$LikePostResponseFromJson(Map<String, dynamic> json) =>
    LikePostResponse(
      isSucceeded: json['isSucceeded'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      model: json['model'],
    );

Map<String, dynamic> _$LikePostResponseToJson(LikePostResponse instance) =>
    <String, dynamic>{
      'isSucceeded': instance.isSucceeded,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'model': instance.model,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_comment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCommentResponse _$CreateCommentResponseFromJson(
        Map<String, dynamic> json) =>
    CreateCommentResponse(
      isSucceeded: json['isSucceeded'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      model: json['model'],
    );

Map<String, dynamic> _$CreateCommentResponseToJson(
        CreateCommentResponse instance) =>
    <String, dynamic>{
      'isSucceeded': instance.isSucceeded,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'model': instance.model,
    };

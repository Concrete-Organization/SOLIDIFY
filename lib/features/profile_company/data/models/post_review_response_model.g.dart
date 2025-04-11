// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_review_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostReviewResponseModel _$PostReviewResponseModelFromJson(
        Map<String, dynamic> json) =>
    PostReviewResponseModel(
      isSucceeded: json['isSucceeded'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      model: json['model'],
    );

Map<String, dynamic> _$PostReviewResponseModelToJson(
        PostReviewResponseModel instance) =>
    <String, dynamic>{
      'isSucceeded': instance.isSucceeded,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'model': instance.model,
    };

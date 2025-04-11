// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_review_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostReviewRequestModel _$PostReviewRequestModelFromJson(
        Map<String, dynamic> json) =>
    PostReviewRequestModel(
      message: json['Message'] as String,
      userRate: (json['userRate'] as num).toInt(),
    );

Map<String, dynamic> _$PostReviewRequestModelToJson(
        PostReviewRequestModel instance) =>
    <String, dynamic>{
      'Message': instance.message,
      'userRate': instance.userRate,
    };

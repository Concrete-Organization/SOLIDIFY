// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_cart_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostCartResponseModel _$PostCartResponseModelFromJson(
        Map<String, dynamic> json) =>
    PostCartResponseModel(
      isSucceeded: json['isSucceeded'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      model: json['model'],
    );

Map<String, dynamic> _$PostCartResponseModelToJson(
        PostCartResponseModel instance) =>
    <String, dynamic>{
      'isSucceeded': instance.isSucceeded,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'model': instance.model,
    };

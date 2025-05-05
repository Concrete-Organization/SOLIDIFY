// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crack_detection_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CrackDetectionResponseModel _$CrackDetectionResponseModelFromJson(
        Map<String, dynamic> json) =>
    CrackDetectionResponseModel(
      resultImageUrl: json['result_image_url'] as String?,
      status: json['status'] as String,
    );

Map<String, dynamic> _$CrackDetectionResponseModelToJson(
        CrackDetectionResponseModel instance) =>
    <String, dynamic>{
      'result_image_url': instance.resultImageUrl,
      'status': instance.status,
    };

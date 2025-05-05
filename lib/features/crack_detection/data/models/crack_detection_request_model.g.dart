// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crack_detection_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CrackDetectionRequestModel _$CrackDetectionRequestModelFromJson(
        Map<String, dynamic> json) =>
    CrackDetectionRequestModel(
      image: FileConverter.fromJson(json['image'] as String?),
    );

Map<String, dynamic> _$CrackDetectionRequestModelToJson(
        CrackDetectionRequestModel instance) =>
    <String, dynamic>{
      'image': FileConverter.toJson(instance.image),
    };

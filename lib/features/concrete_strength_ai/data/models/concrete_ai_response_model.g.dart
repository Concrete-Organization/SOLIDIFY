// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concrete_ai_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConcreteAiResponseModel _$ConcreteAiResponseModelFromJson(
        Map<String, dynamic> json) =>
    ConcreteAiResponseModel(
      strength: (json['strength'] as num).toDouble(),
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$ConcreteAiResponseModelToJson(
        ConcreteAiResponseModel instance) =>
    <String, dynamic>{
      'strength': instance.strength,
      'statusCode': instance.statusCode,
    };

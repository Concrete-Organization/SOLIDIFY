// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concrete_ai_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConcreteAiRequestModel _$ConcreteAiRequestModelFromJson(
        Map<String, dynamic> json) =>
    ConcreteAiRequestModel(
      cement: (json['Cement'] as num).toDouble(),
      slag: (json['Slag'] as num).toDouble(),
      flyAsh: (json['fly_ash'] as num).toDouble(),
      water: (json['Water'] as num).toDouble(),
      superplasticizer: (json['superplasticizer'] as num).toDouble(),
      coarseAggregate: (json['coarse_aggregate'] as num).toDouble(),
      fineAggregate: (json['fine_aggregate'] as num).toDouble(),
      age: (json['age'] as num).toInt(),
    );

Map<String, dynamic> _$ConcreteAiRequestModelToJson(
        ConcreteAiRequestModel instance) =>
    <String, dynamic>{
      'Cement': instance.cement,
      'Slag': instance.slag,
      'fly_ash': instance.flyAsh,
      'Water': instance.water,
      'superplasticizer': instance.superplasticizer,
      'coarse_aggregate': instance.coarseAggregate,
      'fine_aggregate': instance.fineAggregate,
      'age': instance.age,
    };

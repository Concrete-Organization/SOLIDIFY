import 'package:json_annotation/json_annotation.dart';

part 'concrete_ai_request_model.g.dart';

@JsonSerializable()
class ConcreteAiRequestModel {
  @JsonKey(name: 'Cement')
  final double cement;
  @JsonKey(name: 'Slag')
  final double slag;
  @JsonKey(name: 'fly_ash')
  final double flyAsh;
  @JsonKey(name: 'Water')
  final double water;
  final double superplasticizer;
  @JsonKey(name: 'coarse_aggregate')
  final double coarseAggregate;
  @JsonKey(name: 'fine_aggregate')
  final double fineAggregate;
  final int age;

  ConcreteAiRequestModel({
    required this.cement,
    required this.slag,
    required this.flyAsh,
    required this.water,
    required this.superplasticizer,
    required this.coarseAggregate,
    required this.fineAggregate,
    required this.age,
  });

  factory ConcreteAiRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ConcreteAiRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConcreteAiRequestModelToJson(this);
}
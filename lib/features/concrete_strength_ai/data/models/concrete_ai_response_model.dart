import 'package:json_annotation/json_annotation.dart';
part 'concrete_ai_response_model.g.dart';


@JsonSerializable()
class ConcreteAiResponseModel {
  final double strength;
  final int statusCode;

  ConcreteAiResponseModel({
    required this.strength,
    required this.statusCode,
  });

  factory ConcreteAiResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ConcreteAiResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConcreteAiResponseModelToJson(this);
}
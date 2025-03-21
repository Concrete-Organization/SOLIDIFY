import 'package:json_annotation/json_annotation.dart';

part 'delete_engineer_profile_response.g.dart';

@JsonSerializable()
class DeleteEngineerProfileResponse {
  final bool isSucceeded;
  final int statusCode;
  final String message;
  final dynamic model;

  DeleteEngineerProfileResponse({
    required this.isSucceeded,
    required this.statusCode,
    required this.message,
    this.model,
  });

  factory DeleteEngineerProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteEngineerProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteEngineerProfileResponseToJson(this);
}
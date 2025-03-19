import 'package:json_annotation/json_annotation.dart';

part 'update_engineer_profile_response.g.dart';

@JsonSerializable()
class UpdateEngineerProfileResponse {
  final bool isSucceeded;
  final int statusCode;
  final String message;
  final String? model;

  UpdateEngineerProfileResponse({
    required this.isSucceeded,
    required this.statusCode,
    required this.message,
    this.model,
  });

  factory UpdateEngineerProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateEngineerProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateEngineerProfileResponseToJson(this);
}

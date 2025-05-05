import 'package:json_annotation/json_annotation.dart';

part 'crack_detection_response_model.g.dart';

@JsonSerializable()
class CrackDetectionResponseModel {
  @JsonKey(name: 'result_image_url')
  final String? resultImageUrl;
  final String status;

  CrackDetectionResponseModel({
    this.resultImageUrl,
    required this.status,
  });

  factory CrackDetectionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CrackDetectionResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CrackDetectionResponseModelToJson(this);
}
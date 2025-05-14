import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final bool? isSucceeded;
  final int? statusCode;
  final String? message;
  @JsonKey(name: 'model')
  final List<String>? errors;

  ApiErrorModel({
    this.isSucceeded,
    required this.message,
    this.statusCode,
    this.errors,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  String getAllErrorMessages() {
    if (message != null && message!.isNotEmpty) {
      return message!;
    }

    if (errors != null) {
      if (errors is List<String>) {
        return errors!.join('\n');
      } else if (errors is Map<String, dynamic>) {
        return (errors as Map<String, dynamic>).entries.map((e) => e.value)
            .join('\n');
      }
    }

    return "";
  }
}
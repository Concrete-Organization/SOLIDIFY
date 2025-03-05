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
    if (errors == null || errors is List && (errors as List).isEmpty) {
      return message ?? "Unknown Error occurred";
    }

    if (errors is Map<String, dynamic>) {
      final errorMessage =
          (errors as Map<String, dynamic>).entries.map((entry) {
        final value = entry.value;
        return "${value.join(',')}";
      }).join('\n');

      return errorMessage;
    } else if (errors is List) {
      return (errors as List).join('\n');
    }

    return message ?? "Unknown Error occurred";
  }
}

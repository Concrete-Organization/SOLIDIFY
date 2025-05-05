import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/features/crack_detection/data/models/crack_detection_response_model.dart';

part 'crack_detection_ai_state.freezed.dart';

@freezed
class CrackDetectionAiState with _$CrackDetectionAiState {
  const factory CrackDetectionAiState.initial() = _Initial;
  const factory CrackDetectionAiState.loading() = _Loading;
  const factory CrackDetectionAiState.success(
      CrackDetectionResponseModel crackDetectionResponseModel,
      ) = _Success;
  const factory CrackDetectionAiState.failure(ApiErrorModel error) = Failure;
}
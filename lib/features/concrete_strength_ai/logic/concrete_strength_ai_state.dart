import 'package:solidify/features/concrete_strength_ai/data/models/concrete_ai_response_model.dart';
import '../../../../../core/network/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'concrete_strength_ai_state.freezed.dart';

@freezed
class ConcreteStrengthAiState<T> with _$ConcreteStrengthAiState<T> {
  const factory ConcreteStrengthAiState.initial() = _Initial;

  const factory ConcreteStrengthAiState.loading() = Loading;

  const factory ConcreteStrengthAiState.success(ConcreteAiResponseModel data) = Success;

  const factory ConcreteStrengthAiState.error({required ApiErrorModel error}) = Error;
}
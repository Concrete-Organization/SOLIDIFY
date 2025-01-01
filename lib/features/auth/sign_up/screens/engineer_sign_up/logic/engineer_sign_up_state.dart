import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../../core/network/api_error_model.dart';
part 'engineer_sign_up_state.freezed.dart';

@freezed
class EngineerSignUpState<T> with _$EngineerSignUpState<T> {
  const factory EngineerSignUpState.initial() = _Initial;

  const factory EngineerSignUpState.engineerSignUpLoading() = EngineerSignUpLoading;

  const factory EngineerSignUpState.engineerSignUpSuccess(T data) =
      EngineerSignUpSuccess<T>;

  const factory EngineerSignUpState.engineerSignUpError(
      {required ApiErrorModel error}) = EngineerSignUpError;
}

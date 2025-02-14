import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../../core/network/api_error_model.dart';

part 'engineer_account_sign_up_state.freezed.dart';

@freezed
class EngineerAccountSignUpState<T> with _$EngineerAccountSignUpState<T> {
  const factory EngineerAccountSignUpState.initial() = _Initial;

  const factory EngineerAccountSignUpState.engineerSignUpLoading() = EngineerAccountSignUpLoading;
  const factory EngineerAccountSignUpState.engineerSignUpSuccess(T data) = EngineerAccountSignUpSuccess<T>;
  const factory EngineerAccountSignUpState.engineerSignUpError(
      {required ApiErrorModel error}) = EngineerAccountSignUpError;
}

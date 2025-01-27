import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../../core/network/api_error_model.dart';

part 'business_account_sign_up_state.freezed.dart';

@freezed
class BusinessAccountSignUpState<T> with _$BusinessAccountSignUpState<T> {
  const factory BusinessAccountSignUpState.initial() = _Initial;

  const factory BusinessAccountSignUpState.businessSignUpLoading() =
      BusinessSignUpLoading;

  const factory BusinessAccountSignUpState.businessSignUpSuccess(T data) =
      BusinessSignUpSuccess<T>;

  const factory BusinessAccountSignUpState.businessSignUpError({
    required ApiErrorModel error,
  }) = BusinessSignUpError;
}

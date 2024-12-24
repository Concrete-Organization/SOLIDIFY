import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../../core/network/api_error_model.dart';

part 'user_sign_up_state.freezed.dart';

@freezed
class UserSignUpState<T> with _$UserSignUpState<T> {
  const factory UserSignUpState.initial() = _Initial;

  const factory UserSignUpState.userSignUpLoading() = SignUpLoading;
  const factory UserSignUpState.userSignUpsuccess(T data) = SignUpSuccess<T>;
  const factory UserSignUpState.userSignUpError(
      {required ApiErrorModel error}) = SignUpError;
}

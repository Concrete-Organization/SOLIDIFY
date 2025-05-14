import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solidify/core/network/api_error_model.dart';

part 'concrete_company_account_sign_up_state.freezed.dart';

@freezed
class ConcreteCompanyAccountSignUpState<T> with _$ConcreteCompanyAccountSignUpState<T> {
  const factory ConcreteCompanyAccountSignUpState.initial() = _Initial;

  const factory ConcreteCompanyAccountSignUpState.concreteCompanySignUpLoading() =
  ConcreteCompanySignUpLoading;

  const factory ConcreteCompanyAccountSignUpState.concreteCompanySignUpSuccess(T data) =
  ConcreteCompanySignUpSuccess<T>;

  const factory ConcreteCompanyAccountSignUpState.concreteCompanySignUpError({
    required ApiErrorModel error,
  }) = ConcreteCompanySignUpError;
}

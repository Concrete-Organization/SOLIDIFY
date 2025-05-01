import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solidify/core/network/api_error_model.dart';

part 'reset_password_state.freezed.dart';

@freezed
class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState.initial() = ResetPasswordInitial;
  const factory ResetPasswordState.loadingStoredData() = LoadingStoredData;
  const factory ResetPasswordState.storedDataLoaded({
    required bool isPasswordHidden,
    required bool isConfirmPasswordHidden,
  }) = StoredDataLoaded;
  const factory ResetPasswordState.resetPasswordLoading() = ResetPasswordLoading;
  const factory ResetPasswordState.resetPasswordSuccess() = ResetPasswordSuccess;
  const factory ResetPasswordState.error({required ApiErrorModel error}) = ResetPasswordError;
}
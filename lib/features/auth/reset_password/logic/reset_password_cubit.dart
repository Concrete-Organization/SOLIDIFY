import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/shared_pref_helper.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/features/auth/reset_password/data/models/reset_password_request_model.dart';
import 'package:solidify/features/auth/reset_password/data/repos/reset_password_repo.dart';
import 'package:solidify/features/auth/reset_password/logic/reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordRepo _resetPasswordRepo;
  String? _email;
  String? _otp;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  ResetPasswordCubit(this._resetPasswordRepo) : super(const ResetPasswordState.initial()) {
    _loadStoredData();
  }

  Future<void> _loadStoredData() async {
    emit(const ResetPasswordState.loadingStoredData());
    try {
      final email = await SharedPrefHelper.getString('email');
      final otp = await SharedPrefHelper.getSecuredString('otp');
      _email = email;
      _otp = otp;
      emit(ResetPasswordState.storedDataLoaded(
        isPasswordHidden: isPasswordHidden,
        isConfirmPasswordHidden: isConfirmPasswordHidden,
      ));
    } catch (e) {
      emit(ResetPasswordState.error(error: ApiErrorModel(message: 'Failed to load stored data: $e')));
    }
  }

  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    emit(ResetPasswordState.storedDataLoaded(
      isPasswordHidden: isPasswordHidden,
      isConfirmPasswordHidden: isConfirmPasswordHidden,
    ));
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden = !isConfirmPasswordHidden;
    emit(ResetPasswordState.storedDataLoaded(
      isPasswordHidden: isPasswordHidden,
      isConfirmPasswordHidden: isConfirmPasswordHidden,
    ));
  }

  Future<void> resetPassword() async {
    if (_email == null || _otp == null) {
      emit(ResetPasswordState.error(error: ApiErrorModel(message: 'Email or OTP not loaded')));
      return;
    }
    emit(const ResetPasswordState.resetPasswordLoading());
    final requestModel = ResetPasswordRequestModel(
      email: _email!,
      otp: _otp!,
      password: newPasswordController.text,
      confirmPassword: confirmPasswordController.text,
    );
    final result = await _resetPasswordRepo.resetPassword(requestModel);
    result.when(
      success: (_) => emit(const ResetPasswordState.resetPasswordSuccess()),
      failure: (error) => emit(ResetPasswordState.error(error: error)),
    );
  }
}
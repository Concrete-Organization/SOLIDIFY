import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/features/auth/forget_password/data/models/forget_password_request_model.dart';
import 'package:solidify/features/auth/forget_password/data/repos/forget_password_repo.dart';
import 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordRepo _forgetPasswordRepo;
  int currentStep = 0;
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  ForgetPasswordCubit(this._forgetPasswordRepo)
      : super(const ForgetPasswordState.initial());

  void goToNextStep() {
    if (currentStep < 2) currentStep++;
    emit(const ForgetPasswordState.success(null));
  }

  void resetPassword(String email) async {
    emit(const ForgetPasswordState.loading());

    final response = await _forgetPasswordRepo.forgetPassword(
      ForgetPasswordRequestModel(email: email),
    );

    response.when(
      success: (data) => emit(ForgetPasswordState.success(data)),
      failure: (error) => emit(ForgetPasswordState.error(error: error)),
    );
  }
  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}
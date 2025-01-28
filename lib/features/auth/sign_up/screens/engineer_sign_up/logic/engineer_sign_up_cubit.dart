import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/shared_pref_helper.dart' as shared_prefs;
import 'package:solidify/features/auth/sign_up/screens/engineer_sign_up/data/models/engineer_sign_up_request_model.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_sign_up/data/repos/engineer_sign_up_repo.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_sign_up/logic/engineer_sign_up_state.dart';

class EngineerSignUpCubit extends Cubit<EngineerSignUpState> {
  final EngineerSignUpRepo _engineerSignUpRepo;

  EngineerSignUpCubit(this._engineerSignUpRepo)
      : super(const EngineerSignUpState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final userAndEmailFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();
  File? syndicateFileName;
  File? cvFileName;

  void emitEngineerSignupStates() async {
    emit(const EngineerSignUpState.engineerSignUpLoading());
    if (cvFileName == null || syndicateFileName == null) {
      return;
    }


    final requestModel = EngineerSignUpRequestModel(
      userName: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
      cvFile: cvFileName,
      syndicateCard: syndicateFileName,
    );
    final response = await _engineerSignUpRepo.engineerSignUp(requestModel);

    response.when(
      success: (engineerSignUpResponse) async {
        await shared_prefs.SharedPrefHelper.setSecuredString(
            shared_prefs.SharedPrefKeys.userId,
            engineerSignUpResponse.model?.id ?? '');
        await shared_prefs.SharedPrefHelper.setSecuredString(
            shared_prefs.SharedPrefKeys.userName,
            engineerSignUpResponse.model?.userName ?? '');
        await shared_prefs.SharedPrefHelper.setSecuredString(
            shared_prefs.SharedPrefKeys.email,
            engineerSignUpResponse.model?.email ?? '');
        emit(EngineerSignUpState.engineerSignUpSuccess(engineerSignUpResponse));
      },
      failure: (error) {
        emit(EngineerSignUpState.engineerSignUpError(
            error: error.apiErrorModel));
      },
    );
  }
}
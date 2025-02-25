import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/shared_pref_helper.dart' as shared_prefs;
import 'package:solidify/features/auth/sign_up/screens/engineer_account_sign_up/data/models/engineer_account_sign_up_request_model.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_account_sign_up/data/repos/engineer_account_sign_up_repo.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_account_sign_up/logic/engineer_account_sign_up_state.dart';

import '../../../../../../core/helpers/shared_pref_helper.dart';

class EngineerAccountSignUpCubit extends Cubit<EngineerAccountSignUpState> {
  final EngineerAccountSignUpRepo _engineerAccountSignUpRepo;

  EngineerAccountSignUpCubit(this._engineerAccountSignUpRepo):super(const EngineerAccountSignUpState.initial());

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> userAndEmailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();

  void emitEngineerSignupStates() async {
    emit(const EngineerAccountSignUpState.engineerSignUpLoading());
    final response = await _engineerAccountSignUpRepo.engineerSignUp(
      EngineerAccountSignUpRequestModel(
        userName: userNameController.text,
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
      ),
    );

    response.when(success: (signupResponse) async {
      await shared_prefs.SharedPrefHelper.setSecuredString(
        shared_prefs.SharedPrefKeys.accessToken,
        signupResponse.model.accessToken,
      );
      await shared_prefs.SharedPrefHelper.setSecuredString(
        shared_prefs.SharedPrefKeys.refreshToken,
        signupResponse.model.refreshToken,
      );
      await shared_prefs.SharedPrefHelper.setSecuredString(
        shared_prefs.SharedPrefKeys.expiresOn,
        signupResponse.model.expiresOn,
      );
      await shared_prefs.SharedPrefHelper.setSecuredString(
        shared_prefs.SharedPrefKeys.refreshTokenExpiration,
        signupResponse.model.refreshTokenExpiration,
      );

      await SharedPrefHelper.setSecuredString(SharedPrefKeys.role, 'Engineer');
      await SharedPrefHelper.setData(SharedPrefKeys.isLoggedIn, true);


      emit(EngineerAccountSignUpState.engineerSignUpSuccess(signupResponse));
    }, failure: (error) {
      emit(EngineerAccountSignUpState.engineerSignUpError(error: error));
    });
  }
}

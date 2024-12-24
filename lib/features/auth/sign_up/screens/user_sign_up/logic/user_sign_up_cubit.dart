import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/helpers/constants.dart' as constants;
import 'package:solidify/core/helpers/shared_pref_helper.dart' as shared_prefs;
import 'package:solidify/features/auth/sign_up/screens/user_sign_up/logic/user_sign_up_state.dart';
import 'package:solidify/features/auth/sign_up/screens/user_sign_up/data/repos/user_sign_up_repo.dart';
import 'package:solidify/features/auth/sign_up/screens/user_sign_up/data/models/user_sign_up_request_model.dart';

class UserSignUpCubit extends Cubit<UserSignUpState> {
  final UserSignUpRepo _userSignUpRepo;

  UserSignUpCubit(this._userSignUpRepo)
      : super(const UserSignUpState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitUserSignupStates({
    required String name,
    required String email,
    required int phoneNumber,
    required String password,
    required String confirmPassword,
    required String address,
  }) async {
    emit(const UserSignUpState.userSignUpLoading());

    final response = await _userSignUpRepo.userSignUp(
      UserSignUpRequestModel(
        userName: name,
        email: email,
        password: password,
        phoneNumber: phoneNumber,
        confirmPassword: confirmPassword,
        address: address,
      ),
    );

    response.when(success: (signupResponse) async {
      await shared_prefs.SharedPrefHelper.setSecuredString(
          shared_prefs.SharedPrefKeys.userId, signupResponse.model?.id ?? '');
      await shared_prefs.SharedPrefHelper.setSecuredString(
          shared_prefs.SharedPrefKeys.userName,
          signupResponse.model?.userName ?? '');
      await shared_prefs.SharedPrefHelper.setSecuredString(
          shared_prefs.SharedPrefKeys.email, signupResponse.model?.email ?? '');

      emit(UserSignUpState.userSignUpsuccess(signupResponse));
    }, failure: (error) {
      emit(UserSignUpState.userSignUpError(error: error.apiErrorModel));
    });
  }
}

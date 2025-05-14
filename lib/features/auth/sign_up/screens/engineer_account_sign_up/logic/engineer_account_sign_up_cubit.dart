import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:solidify/core/helpers/shared_pref_helper.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_account_sign_up/data/models/engineer_account_sign_up_request_model.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_account_sign_up/data/repos/engineer_account_sign_up_repo.dart';
import 'package:solidify/features/auth/sign_up/screens/engineer_account_sign_up/logic/engineer_account_sign_up_state.dart';

class EngineerAccountSignUpCubit extends Cubit<EngineerAccountSignUpState> {
  final EngineerAccountSignUpRepo _engineerAccountSignUpRepo;

  EngineerAccountSignUpCubit(this._engineerAccountSignUpRepo):super(const EngineerAccountSignUpState.initial());

  TextEditingController fullNameController = TextEditingController();
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
        fullName: fullNameController.text,
      ),
    );

    response.when(success: (signupResponse) async {
      await SharedPrefHelper.setSecuredString(
        SharedPrefKeys.accessToken,
        signupResponse.model.accessToken,
      );
      await SharedPrefHelper.setSecuredString(
        SharedPrefKeys.refreshToken,
        signupResponse.model.refreshToken,
      );
      await SharedPrefHelper.setSecuredString(
        SharedPrefKeys.expiresOn,
        signupResponse.model.expiresOn,
      );
      await SharedPrefHelper.setSecuredString(
        SharedPrefKeys.refreshTokenExpiration,
        signupResponse.model.refreshTokenExpiration,
      );
      await SharedPrefHelper.setData(
          SharedPrefKeys.joinedDate,
          DateTime.now().toString()
      );
      await SharedPrefHelper.setSecuredString(SharedPrefKeys.role, 'Engineer');
      await SharedPrefHelper.setData(SharedPrefKeys.isLoggedIn, true);

      Map<String, dynamic> decodedToken = JwtDecoder.decode(signupResponse.model.accessToken);
      String userId = decodedToken['sub'] ?? decodedToken['Id'];
      String userName = decodedToken['User Name'];
      String email = decodedToken['Email'];

      await SharedPrefHelper.saveUserDetails(
        id: userId,
        userName: userName,
        email: email,
      );

      emit(EngineerAccountSignUpState.engineerSignUpSuccess(signupResponse));
    }, failure: (error) {
      emit(EngineerAccountSignUpState.engineerSignUpError(error: error));
    });
  }}

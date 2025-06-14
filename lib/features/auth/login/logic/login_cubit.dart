import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/jwt_helper.dart';
import 'package:solidify/core/helpers/shared_pref_helper.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/features/auth/login/data/model/login_request_body.dart';
import 'package:solidify/features/auth/login/data/repo/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  void emitLoginStates(String email, String password) async {
    emit(const LoginState.loading());

    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    response.when(
      success: (loginResponse) async {
        final accessToken = loginResponse.model.accessToken;
        final role = JwtHelper.getUserRole(accessToken);

        if (role == null) {
          emit(
            LoginState.error(
              error: ApiErrorModel(message: 'Invalid token structure'),
            ),
          );
          return;
        }

        await SharedPrefHelper.saveUserDetails(
          id: JwtHelper.getUserId(accessToken)!,
          userName: JwtHelper.getUserName(accessToken)!,
          email: email,
        );
        await SharedPrefHelper.setSecuredString(
          SharedPrefKeys.accessToken,
          loginResponse.model.accessToken,
        );
        await SharedPrefHelper.setSecuredString(
          SharedPrefKeys.refreshToken,
          loginResponse.model.refreshToken,
        );
        await SharedPrefHelper.setSecuredString(
          SharedPrefKeys.expiresOn,
          loginResponse.model.expiresOn.toIso8601String(),
        );
        await SharedPrefHelper.setSecuredString(
          SharedPrefKeys.refreshTokenExpiration,
          loginResponse.model.refreshTokenExpiration.toIso8601String(),
        );
        await SharedPrefHelper.setSecuredString(
          SharedPrefKeys.role,
          role,
        );
        await SharedPrefHelper.setData(
            SharedPrefKeys.joinedDate,
            DateTime.now().toString()
        );

        await SharedPrefHelper.setData(SharedPrefKeys.isLoggedIn, true);

        emit(LoginState.success(
          loginResponse: loginResponse,
          role: role,
        ));
      },
      failure: (error) {
        emit(LoginState.error(error: error));
      },
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
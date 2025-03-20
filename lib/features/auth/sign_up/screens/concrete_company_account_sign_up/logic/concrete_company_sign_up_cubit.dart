import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/core/helpers/shared_pref_helper.dart' as shared_prefs;
import 'package:solidify/features/auth/sign_up/screens/concrete_company_account_sign_up/data/models/concrete_company_account_sign_up_request_model.dart';
import 'package:solidify/features/auth/sign_up/screens/concrete_company_account_sign_up/data/repos/concrete_company_account_repo.dart';
import 'package:solidify/features/auth/sign_up/screens/concrete_company_account_sign_up/logic/concrete_company_account_sign_up_state.dart';

import '../../../../../../core/helpers/shared_pref_helper.dart';

class ConcreteCompanySignUpCubit extends Cubit<ConcreteCompanyAccountSignUpState> {
  final ConcreteCompanyAccountRepo _concreteCompanyAccountRepo;

  ConcreteCompanySignUpCubit(this._concreteCompanyAccountRepo)
      : super(const ConcreteCompanyAccountSignUpState.initial());

  TextEditingController companyNameController = TextEditingController();
  TextEditingController commercialNumberController = TextEditingController();
  TextEditingController taxIdController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  File? commercialLicenseFile;

  final GlobalKey<FormState> identityFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> userAndEmailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();

  void emitConcreteCompanySignUpStates() async {
    emit(const ConcreteCompanyAccountSignUpState.concreteCompanySignUpLoading());

    if (commercialLicenseFile == null) {
      emit(
        ConcreteCompanyAccountSignUpState.concreteCompanySignUpError(
          error: ApiErrorModel(message: 'Commercial license file is required',),
        ),
      );
      return;
    }

    final requestModel = ConcreteCompanyAccountSignUpRequestModel(
      companyName: companyNameController.text,
      commercialNumber: commercialNumberController.text,
      taxId: taxIdController.text,
      userName: userNameController.text,
      email: emailController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
      address: addressController.text,
      commercialLicense: commercialLicenseFile,
    );

    final response = await _concreteCompanyAccountRepo.companySignUp(requestModel);

    response.when(
      success: (businessSignUpResponse) async {
        await shared_prefs.SharedPrefHelper.setSecuredString(
          shared_prefs.SharedPrefKeys.userName,
          businessSignUpResponse.model.companyName,
        );
        await shared_prefs.SharedPrefHelper.setSecuredString(
          shared_prefs.SharedPrefKeys.accessToken,
          businessSignUpResponse.model.authResponse.accessToken,
        );
        await shared_prefs.SharedPrefHelper.setSecuredString(
          shared_prefs.SharedPrefKeys.refreshToken,
          businessSignUpResponse.model.authResponse.refreshToken,
        );
        await shared_prefs.SharedPrefHelper.setSecuredString(
          shared_prefs.SharedPrefKeys.expiresOn,
          businessSignUpResponse.model.authResponse.expiresOn,
        );
        await shared_prefs.SharedPrefHelper.setSecuredString(
          shared_prefs.SharedPrefKeys.refreshTokenExpiration,
          businessSignUpResponse.model.authResponse.refreshTokenExpiration,
        );
        await SharedPrefHelper.setData(
            SharedPrefKeys.joinedDate,
            DateTime.now().toString()
        );
        await SharedPrefHelper.setSecuredString(SharedPrefKeys.role, 'Company');
        await SharedPrefHelper.setData(SharedPrefKeys.isLoggedIn, true);

        emit(ConcreteCompanyAccountSignUpState.concreteCompanySignUpSuccess(
            businessSignUpResponse));
      },
      failure: (error) {
        emit(ConcreteCompanyAccountSignUpState.concreteCompanySignUpError(
            error: error));
      },
    );
  }
}

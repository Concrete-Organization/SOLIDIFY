import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/core/helpers/shared_pref_helper.dart' as shared_prefs;
import 'package:solidify/features/auth/sign_up/screens/business_account_sign_up/data/repos/business_account_repo.dart';
import 'package:solidify/features/auth/sign_up/screens/business_account_sign_up/logic/business_account_sign_up_state.dart';
import 'package:solidify/features/auth/sign_up/screens/business_account_sign_up/data/models/business_account_sign_up_request_model.dart';

class BusinessAccountSignUpCubit extends Cubit<BusinessAccountSignUpState> {
  final BusinessAccountRepo _businessAccountRepo;

  BusinessAccountSignUpCubit(this._businessAccountRepo)
      : super(const BusinessAccountSignUpState.initial());

  // Controllers for form fields
  TextEditingController companyNameController = TextEditingController();
  TextEditingController commercialNumberController = TextEditingController();
  TextEditingController taxIdController = TextEditingController();
  TextEditingController companyWebSiteController = TextEditingController();
  TextEditingController faceBookAccountController = TextEditingController();
  TextEditingController instagramAccountController = TextEditingController();
  TextEditingController twitterAccountController = TextEditingController();
  TextEditingController bankAccountController = TextEditingController();
  TextEditingController paymentTermController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  File? commercialLicenseFile;

  void emitBusinessSignUpStates() async {
    emit(const BusinessAccountSignUpState.businessSignUpLoading());

    if (commercialLicenseFile == null) {
      emit(BusinessAccountSignUpState.businessSignUpError(
        error: ApiErrorModel(message: 'Commercial license file is required'),
      ));
      return;
    }

    final requestModel = BusinessAccountSignUpRequestModel(
      companyName: companyNameController.text,
      commercialNumber: commercialNumberController.text,
      taxId: taxIdController.text,
      companyWebSite: companyWebSiteController.text,
      faceBookAccount: faceBookAccountController.text,
      instagramAccount: instagramAccountController.text,
      twitterAccount: twitterAccountController.text,
      bankAccount: bankAccountController.text,
      paymentTerm: paymentTermController.text,
      userName: userNameController.text,
      email: emailController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
      phoneNumber: phoneNumberController.text,
      address: addressController.text,
      commercialLicense: commercialLicenseFile,
    );

    final response = await _businessAccountRepo.componySignUp(requestModel);

    response.when(
      success: (businessSignUpResponse) async {
        await shared_prefs.SharedPrefHelper.setSecuredString(
          shared_prefs.SharedPrefKeys.userId,
          businessSignUpResponse.model.id,
        );
        await shared_prefs.SharedPrefHelper.setSecuredString(
          shared_prefs.SharedPrefKeys.userName,
          businessSignUpResponse.model.userName,
        );
        await shared_prefs.SharedPrefHelper.setSecuredString(
          shared_prefs.SharedPrefKeys.email,
          businessSignUpResponse.model.email,
        );
        emit(BusinessAccountSignUpState.businessSignUpSuccess(
            businessSignUpResponse));
      },
      failure: (error) {
        emit(BusinessAccountSignUpState.businessSignUpError(
            error: error.apiErrorModel));
      },
    );
  }
}

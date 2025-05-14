import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/features/auth/otp/data/models/verify_otp_request_model.dart';
import 'package:solidify/features/auth/otp/data/repos/verify_otp_repo.dart';
import 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  final VerifyOtpRepo _verifyOtpRepo;
  String? enteredOtp;

  VerifyOtpCubit(this._verifyOtpRepo) : super(const VerifyOtpState.initial());

  Future<void> verifyOtp(VerifyOtpRequestModel requestModel) async {
    emit(const VerifyOtpState.loading());
    final result = await _verifyOtpRepo.verifyOtp(requestModel);

    result.when(
      success: (response) => emit(VerifyOtpState.success(response)),
      failure: (error) => emit(VerifyOtpState.error(error: error)),
    );
  }
}
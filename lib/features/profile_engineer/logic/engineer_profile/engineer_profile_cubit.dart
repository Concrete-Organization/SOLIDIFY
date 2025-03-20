import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/features/profile_engineer/data/models/get_engineer_profile_response.dart';
import 'package:solidify/features/profile_engineer/data/models/update_engineer_profile_request.dart';
import 'package:solidify/features/profile_engineer/data/repo/engineer_profile_repo.dart';
import 'package:solidify/features/profile_engineer/logic/engineer_profile/engineer_profile_state.dart';
import 'dart:io';

class EngineerProfileCubit extends Cubit<EngineerProfileState> {
  final EngineerProfileRepo _engineerProfileRepo;
  GetEngineerProfileResponse? userData;

  EngineerProfileCubit(this._engineerProfileRepo)
      : super(const EngineerProfileState.initial());

  Future<void> fetchEngineerProfile(String engineerId) async {
    emit(const EngineerProfileState.loading());
    final result = await _engineerProfileRepo.engineerProfile(engineerId);
    result.when(
      success: (profile) {
        userData = profile;
        emit(EngineerProfileState.success(engineerId, profile));
      },
      failure: (error) {
        emit(EngineerProfileState.failure(error));
      },
    );
  }

  Future<void> updateEngineerProfile(String engineerId, File? newImage) async {
    if (newImage == null) return;

    emit(const EngineerProfileState.loading());
    final request = UpdateEngineerProfileRequest(profileImageUrl: newImage);
    final result =
    await _engineerProfileRepo.updateEngineerProfile(request, engineerId);

    result.when(
      success: (response) {
        if (response.isSucceeded) {
          fetchEngineerProfile(engineerId);
        } else {
          emit(
            EngineerProfileState.failure(
              ApiErrorModel(message: response.message),
            ),
          );
        }
      },
      failure: (error) {
        emit(EngineerProfileState.failure(error));
      },
    );
  }
}
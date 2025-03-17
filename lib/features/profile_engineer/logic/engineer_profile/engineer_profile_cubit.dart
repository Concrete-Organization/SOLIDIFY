import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/features/profile_engineer/data/repo/engineer_profile_repo.dart';
import 'package:solidify/features/profile_engineer/logic/engineer_profile/engineer_profile_state.dart';

class EngineerProfileCubit extends Cubit<EngineerProfileState> {
  final EngineerProfileRepo _engineerProfileRepo;

  EngineerProfileCubit(this._engineerProfileRepo)
      : super(const EngineerProfileState.initial());

  Future<void> fetchEngineerProfile(String engineerId) async {
    emit(const EngineerProfileState.loading());

    final result = await _engineerProfileRepo.engineerProfile(engineerId);

    result.when(
      success: (profile) {
        emit(EngineerProfileState.success(profile));
      },
      failure: (error) {
        emit(EngineerProfileState.failure(error));
      },
    );
  }
}
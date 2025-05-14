import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:solidify/core/helpers/shared_pref_helper.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/features/profile_engineer/data/models/get_engineer_profile_response.dart';
import 'package:solidify/features/profile_engineer/data/models/update_engineer_profile_request.dart';
import 'package:solidify/features/profile_engineer/data/repo/engineer_profile_repo.dart';
import 'package:solidify/features/profile_engineer/logic/engineer_profile/engineer_profile_state.dart';
import 'dart:io';
import 'package:solidify/features/profile_engineer/ui/change_profile_pic_screen.dart';

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
        if (profile.model?.profileImageUrl != null) {
          SharedPrefHelper.setData(
            SharedPrefKeys.profileImageUrl,
            profile.model!.profileImageUrl,
          );
        }
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

  Future<void> deleteEngineerProfile(String engineerId) async {
    emit(const EngineerProfileState.loading());
    final result = await _engineerProfileRepo.deleteEngineerProfile(engineerId);

    result.when(
      success: (response) {
        if (response.isSucceeded) {
          final oldProfileImageUrl = userData?.model?.profileImageUrl;
          userData = userData?.copyWith(
            model: userData?.model?.copyWith(profileImageUrl: null),
          );
          SharedPrefHelper.removeData(SharedPrefKeys.profileImageUrl);
          if (oldProfileImageUrl != null) {
             CachedNetworkImageProvider(oldProfileImageUrl).evict();
          }
          fetchEngineerProfile(engineerId);
        } else {
          emit(EngineerProfileState.failure(ApiErrorModel(message: response.message)));
        }
      },
      failure: (error) {
        emit(EngineerProfileState.failure(error));
      },
    );
  }

  Future<void> handleCameraUpdate(String engineerId, BuildContext context) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.camera);

      if (image != null) {
        File imageFile = File(image.path);
        await updateEngineerProfile(engineerId, imageFile);
        if(context.mounted){
          Navigator.pop(context);
        }
      }
    } catch (e) {
      emit(EngineerProfileState.failure(ApiErrorModel(message: 'Error while using camera')));
    }
  }

  Future<void> handleGalleryUpdate(String engineerId, BuildContext context) async {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: this,
          child: ChangeProfilePicScreen(
            currentImageUrl: userData?.model?.profileImageUrl,
            engineerId: engineerId,
          ),
        ),
      ),
    );
  }

  Future<void> handleRemoveImage(String engineerId, BuildContext context) async {
    await deleteEngineerProfile(engineerId);
    if(context.mounted){
      Navigator.pop(context);
    }
  }
}
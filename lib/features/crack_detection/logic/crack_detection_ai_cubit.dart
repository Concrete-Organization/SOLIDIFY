import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/features/crack_detection/data/models/crack_detection_request_model.dart';
import 'package:solidify/features/crack_detection/data/repo/crack_detection_ai_repo.dart';
import 'package:solidify/features/crack_detection/logic/crack_detection_ai_state.dart';
import 'dart:io';

class CrackDetectionAiCubit extends Cubit<CrackDetectionAiState> {
  final CrackDetectionAiRepo _crackDetectionAiRepo;

  CrackDetectionAiCubit(this._crackDetectionAiRepo)
      : super(const CrackDetectionAiState.initial());

  Future<void> crackDetect(File? image) async {
    if (image == null) return;

    emit(const CrackDetectionAiState.loading());
    final request = CrackDetectionRequestModel(image: image);
    final result = await _crackDetectionAiRepo.getCrackAiResponse(request);

    result.when(
      success: (response) {
        emit(CrackDetectionAiState.success(response));
      },
      failure: (error) {
        emit(CrackDetectionAiState.failure(error));
      },
    );
  }


  // Future<void> handleCameraUpdate(String engineerId, BuildContext context) async {
  //   try {
  //     final ImagePicker picker = ImagePicker();
  //     final XFile? image = await picker.pickImage(source: ImageSource.camera);
  //
  //     if (image != null) {
  //       File imageFile = File(image.path);
  //       await updateEngineerProfile(engineerId, imageFile);
  //       if(context.mounted){
  //         Navigator.pop(context);
  //       }
  //     }
  //   } catch (e) {
  //     emit(EngineerProfileState.failure(ApiErrorModel(message: 'Error while using camera')));
  //   }
  // }
  //
  // Future<void> handleGalleryUpdate(String engineerId, BuildContext context) async {
  //   Navigator.pop(context);
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => BlocProvider.value(
  //         value: this,
  //         child: ChangeProfilePicScreen(
  //           currentImageUrl: userData?.model?.profileImageUrl,
  //           engineerId: engineerId,
  //         ),
  //       ),
  //     ),
  //   );
  // }

}
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
}
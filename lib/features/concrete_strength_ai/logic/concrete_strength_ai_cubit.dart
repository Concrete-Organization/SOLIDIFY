import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/features/concrete_strength_ai/data/models/concrete_ai_request_model.dart';
import 'package:solidify/features/concrete_strength_ai/data/repo/concrete_strength_ai_repo.dart';
import 'package:solidify/features/concrete_strength_ai/logic/concrete_strength_ai_state.dart';

import '../../../core/helpers/shared_pref_helper.dart';

class ConcreteStrengthAiCubit extends Cubit<ConcreteStrengthAiState> {
  final ConcreteStrengthAiRepo _repo;

  final TextEditingController cementController = TextEditingController();
  final TextEditingController slagController = TextEditingController();
  final TextEditingController flyAshController = TextEditingController();
  final TextEditingController waterController = TextEditingController();
  final TextEditingController superplasticizerController =
      TextEditingController();
  final TextEditingController coarseAggregateController =
      TextEditingController();
  final TextEditingController fineAggregateController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  ConcreteStrengthAiCubit(this._repo)
      : super(const ConcreteStrengthAiState.initial());

  @override
  Future<void> close() {
    cementController.dispose();
    slagController.dispose();
    flyAshController.dispose();
    waterController.dispose();
    superplasticizerController.dispose();
    coarseAggregateController.dispose();
    fineAggregateController.dispose();
    ageController.dispose();
    return super.close();
  }

  bool areCurrentPageFieldsFilled(int currentPage) {
    if (currentPage == 0) {
      return cementController.text.isNotEmpty &&
          slagController.text.isNotEmpty &&
          flyAshController.text.isNotEmpty &&
          waterController.text.isNotEmpty;
    } else if (currentPage == 1) {
      return superplasticizerController.text.isNotEmpty &&
          coarseAggregateController.text.isNotEmpty &&
          fineAggregateController.text.isNotEmpty &&
          ageController.text.isNotEmpty;
    }
    return false;
  }

  Future<void> submitForm() async {
    emit(const ConcreteStrengthAiState.loading());

    final cement = double.tryParse(cementController.text);
    final slag = double.tryParse(slagController.text);
    final flyAsh = double.tryParse(flyAshController.text);
    final water = double.tryParse(waterController.text);
    final superplasticizer = double.tryParse(superplasticizerController.text);
    final coarseAggregate = double.tryParse(coarseAggregateController.text);
    final fineAggregate = double.tryParse(fineAggregateController.text);
    final age = int.tryParse(ageController.text);

    if (cement == null ||
        slag == null ||
        flyAsh == null ||
        water == null ||
        superplasticizer == null ||
        coarseAggregate == null ||
        fineAggregate == null ||
        age == null) {
      emit(ConcreteStrengthAiState.error(
        error: ApiErrorModel(message: 'Invalid input values'),
      ));
      return;
    }

    final requestModel = ConcreteAiRequestModel(
      cement: cement,
      slag: slag,
      flyAsh: flyAsh,
      water: water,
      superplasticizer: superplasticizer,
      coarseAggregate: coarseAggregate,
      fineAggregate: fineAggregate,
      age: age,
    );

    final result = await _repo.getConcreteAiResponse(requestModel);
    result.when(
      success: (data) async {
        String jsonString = jsonEncode(data.toJson());
        await SharedPrefHelper.setData('surveyResult', jsonString);
        emit(ConcreteStrengthAiState.success(data));
      },      failure: (error) =>
          emit(ConcreteStrengthAiState.error(error: error)),
    );
  }
}

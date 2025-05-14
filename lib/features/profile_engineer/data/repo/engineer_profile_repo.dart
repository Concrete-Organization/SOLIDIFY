import 'package:solidify/core/network/api_error_handler.dart';
import 'package:solidify/core/network/api_result.dart';
import 'package:solidify/core/network/api_service.dart';
import 'package:solidify/features/profile_engineer/data/models/delete_engineer_profile_response.dart';
import 'package:solidify/features/profile_engineer/data/models/get_engineer_profile_response.dart';
import 'package:solidify/features/profile_engineer/data/models/update_engineer_profile_request.dart';
import 'package:solidify/features/profile_engineer/data/models/update_engineer_profile_response.dart';

class EngineerProfileRepo {
  final ApiService _apiService;

  EngineerProfileRepo(this._apiService);

  Future<ApiResult<GetEngineerProfileResponse>> engineerProfile(
      String engineerId) async {
    try {
      final response = await _apiService.engineerProfile(engineerId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<UpdateEngineerProfileResponse>> updateEngineerProfile(
      UpdateEngineerProfileRequest updateEngineerProfileRequest,
      String engineerId) async {
    try {
      final formData = await updateEngineerProfileRequest.toFormData();
      final response = await _apiService.updateEngineerProfile(
        engineerId,
        formData,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DeleteEngineerProfileResponse>> deleteEngineerProfile(
      String engineerId) async {
    try {
      final response = await _apiService.deleteEngineerProfile(engineerId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}

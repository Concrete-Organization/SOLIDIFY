import 'package:solidify/core/network/api_result.dart';
import 'package:solidify/core/network/api_service.dart';
import 'package:solidify/core/network/api_error_handler.dart';

class CancelOrderRepo {
  final ApiService _apiService;

  CancelOrderRepo(this._apiService);

  Future<ApiResult<void>> cancelOrderById(
      String orderId,
      String token,
      ) async {
    try {
      final response = await _apiService.cancelOrder(orderId, token);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
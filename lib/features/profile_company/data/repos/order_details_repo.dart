import 'package:solidify/core/network/api_result.dart';
import 'package:solidify/core/network/api_service.dart';
import 'package:solidify/core/network/api_error_handler.dart';
import 'package:solidify/features/profile_company/data/models/get_order_by_id_response_model.dart';

class OrderDetailsRepo {
  final ApiService _apiService;

  OrderDetailsRepo(this._apiService);

  Future<ApiResult<GetOrderByIdResponseModel>> getOrderById(
    String orderId,
    String token,
  ) async {
    try {
      final response = await _apiService.getOrderById(orderId, token);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

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
import 'package:solidify/core/network/api_result.dart';
import 'package:solidify/core/network/api_service.dart';
import 'package:solidify/core/network/api_error_handler.dart';
import 'package:solidify/features/marketplace/order/data/models/order_post_request.dart';
import 'package:solidify/features/marketplace/order/data/models/order_response_model.dart';
import 'package:solidify/features/profile_company/data/models/get_order_response_model.dart';

class OrderRepo {
  final ApiService _apiService;

  OrderRepo(this._apiService);

  Future<ApiResult<OrderResponseModel>> createOrder(
    OrderPostRequest request,
    String token,
  ) async {
    try {
      final response = await _apiService.createOrder(request, token);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<GetOrderResponseModel>> getOrders(
    int page,
    String token,
  ) async {
    try {
      final response = await _apiService.getOrders(page, token);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}

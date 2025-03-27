import 'package:solidify/core/network/api_result.dart';
import 'package:solidify/core/network/api_service.dart';
import 'package:solidify/core/network/api_error_handler.dart';
import 'package:solidify/features/marketplace/order/data/models/shipping_address_request_model.dart';
import 'package:solidify/features/marketplace/order/data/models/shipping_address_response_model.dart';

class ShippingAddressRepo {
  final ApiService _apiService;

  ShippingAddressRepo(this._apiService);

  Future<ApiResult<ShippingAddressResponseModel>> createShippingAddress(
      ShippingAddressRequestModel request) async {
    try {
      final response = await _apiService.createShippingAddress(request);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}

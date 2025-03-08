import 'package:solidify/core/network/api_result.dart';
import 'package:solidify/core/network/api_service.dart';
import 'package:solidify/core/network/api_error_handler.dart';
import 'package:solidify/features/marketplace/data/models/post_cart_response_model.dart';

class CartRepo {
  final ApiService _apiService;

  CartRepo(this._apiService);

  Future<ApiResult<PostCartResponseModel>> addCartItem(String id) async {
    try {
      final response = await _apiService.addCartItem(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}

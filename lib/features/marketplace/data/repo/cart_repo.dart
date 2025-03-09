import 'package:solidify/core/network/api_result.dart';
import 'package:solidify/core/network/api_service.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/core/network/api_error_handler.dart';
import 'package:solidify/core/helpers/shared_pref_helper.dart';
import 'package:solidify/features/marketplace/data/models/post_cart_response_model.dart';

class CartRepo {
  final ApiService _apiService;

  CartRepo(this._apiService);

  Future<ApiResult<PostCartResponseModel>> addCartItem(String id) async {
    try {
      // Get the access token from secure storage
      final accessToken = await SharedPrefHelper.getSecuredString(
        SharedPrefKeys.accessToken,
      );

      if (accessToken.isEmpty) {
        return ApiResult.failure(
          ApiErrorModel(message: 'Authentication required'),
        );
      }

      // Pass the token to the API service
      final response = await _apiService.addCartItem(
        id,
        'Bearer $accessToken', // Add the Bearer prefix
      );

      // Cache the product ID on successful addition
      final cachedIds = await SharedPrefHelper.getCachedProductIds();
      if (!cachedIds.contains(id)) {
        cachedIds.add(id);
        await SharedPrefHelper.cacheProductIds(cachedIds);
      }

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<List<String>> getCartItems() async {
    return await SharedPrefHelper.getCachedProductIds();
  }

  Future<bool> isProductInCart(String id) async {
    final cachedIds = await SharedPrefHelper.getCachedProductIds();
    return cachedIds.contains(id);
  }
}
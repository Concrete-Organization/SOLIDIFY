import 'package:solidify/core/network/api_result.dart';
import 'package:solidify/core/network/api_service.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/core/network/api_error_handler.dart';
import 'package:solidify/core/helpers/shared_pref_helper.dart';
import 'package:solidify/features/marketplace/cart/data/models/get_cart_response_model.dart';
import 'package:solidify/features/marketplace/cart/data/models/post_cart_response_model.dart';

class CartRepo {
  final ApiService _apiService;

  CartRepo(this._apiService);

  Future<ApiResult<PostCartResponseModel>> addCartItem(String id) async {
    try {
      final accessToken = await SharedPrefHelper.getSecuredString(
        SharedPrefKeys.accessToken,
      );

      if (accessToken.isEmpty) {
        return ApiResult.failure(
          ApiErrorModel(message: 'Authentication required'),
        );
      }

      final response = await _apiService.addCartItem(
        id,
        'Bearer $accessToken',
      );

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

  Future<ApiResult<GetCartResponseModel>> getCartList() async {
    try {
      final accessToken = await SharedPrefHelper.getSecuredString(
        SharedPrefKeys.accessToken,
      );
      final response = await _apiService.cartList(accessToken);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<void>> deleteCartItem(String id) async {
    try {
      final accessToken = await SharedPrefHelper.getSecuredString(
        SharedPrefKeys.accessToken,
      );

      if (accessToken.isEmpty) {
        return ApiResult.failure(
          ApiErrorModel(message: 'Authentication required'),
        );
      }

      await _apiService.deleteCartItem(
        id,
        'Bearer $accessToken',
      );

      // Remove the item from the cached list
      final cachedIds = await SharedPrefHelper.getCachedProductIds();
      if (cachedIds.contains(id)) {
        cachedIds.remove(id);
        await SharedPrefHelper.cacheProductIds(cachedIds);
      }

      return const ApiResult.success(null); // No response body for DELETE
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<List<String>> getCachedCartItems() async {
    return await SharedPrefHelper.getCachedProductIds();
  }

  Future<bool> isProductInCart(String id) async {
    final cachedIds = await SharedPrefHelper.getCachedProductIds();
    return cachedIds.contains(id);
  }
}

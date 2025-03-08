import 'dart:convert';
import 'package:solidify/core/network/api_result.dart';
import 'package:solidify/core/network/api_service.dart';
import 'package:solidify/core/network/api_error_handler.dart';
import 'package:solidify/core/helpers/shared_pref_helper.dart';
import 'package:solidify/features/marketplace/data/models/post_cart_response_model.dart';

class CartRepo {
  final ApiService _apiService;

  CartRepo(this._apiService);

  Future<ApiResult<PostCartResponseModel>> addCartItem(String id) async {
    try {
      final response = await _apiService.addCartItem(id);

      // First, add the product ID to the cached list
      await _addToCartCache(id);

      // Then, set it as the currently selected product
      await SharedPrefHelper.setProductId(id);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<void> _addToCartCache(String id) async {
    // Get existing cart items
    final data = await SharedPrefHelper.getString('cartItems');
    List<String> items = [];
    if (data.isNotEmpty) {
      try {
        items = List<String>.from(json.decode(data));
      } catch (e) {
        items = [];
      }
    }

    // Add the new item if it's not already in the cart
    if (!items.contains(id)) {
      items.add(id);
      await SharedPrefHelper.setData('cartItems', json.encode(items));
    }

    // Also add to cached product IDs for future reference
    final cachedIds = await SharedPrefHelper.getCachedProductIds();
    if (!cachedIds.contains(id)) {
      cachedIds.add(id);
      await SharedPrefHelper.cacheProductIds(cachedIds);
    }
  }

  Future<List<String>> getCartItems() async {
    final data = await SharedPrefHelper.getString('cartItems');
    if (data.isEmpty) {
      return [];
    }
    try {
      return List<String>.from(json.decode(data));
    } catch (e) {
      return [];
    }
  }

  Future<bool> isProductInCart(String id) async {
    final items = await getCartItems();
    return items.contains(id);
  }
}

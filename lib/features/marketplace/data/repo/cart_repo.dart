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

      final data = await SharedPrefHelper.getString('cartItems');
      List<String> items = [];
      if (data.isNotEmpty) {
        try {
          items = List<String>.from(json.decode(data));
        } catch (e) {
          items = [];
        }
      }

      items.add(id);

      await SharedPrefHelper.setData('cartItems', json.encode(items));

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}

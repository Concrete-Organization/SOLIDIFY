import 'package:solidify/core/network/api_error_handler.dart';
import 'package:solidify/core/network/api_result.dart';
import 'package:solidify/core/network/api_service.dart';
import 'package:solidify/features/marketplace/data/models/product_list_response_model.dart';

class ProductsListRepo {
  final ApiService _apiService;

  ProductsListRepo(this._apiService);

  Future<ApiResult<ProductListResponseModel>> getProductsList() async {
    try {
      final response = await _apiService.productsList();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
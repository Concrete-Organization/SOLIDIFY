import 'package:solidify/core/network/api_result.dart';
import 'package:solidify/core/network/api_service.dart';
import 'package:solidify/core/network/api_error_handler.dart';
import 'package:solidify/features/marketplace/data/models/get_products_by_category_response_model.dart';

class ProductCategoryRepo {
  final ApiService _apiService;

  ProductCategoryRepo(this._apiService);

  Future<ApiResult<GetProductsByCategoryResponseModel>> getProductCategory(
      int id) async {
    try {
      final response = await _apiService.getCategory(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}

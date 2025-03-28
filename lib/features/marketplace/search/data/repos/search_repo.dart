import 'package:solidify/core/network/api_result.dart';
import 'package:solidify/core/network/api_service.dart';
import 'package:solidify/core/network/api_error_handler.dart';
import 'package:solidify/features/marketplace/marketplace/data/models/product_list_response_model.dart';

class SearchRepo {
  final ApiService _apiService;

  SearchRepo(this._apiService);

  Future<ApiResult<ProductListResponseModel>> searchProducts({
    String? searchedPhrase,
    String? categoryName,
    String? brandName,
    double? minPrice,
    double? maxPrice,
  }) async {
    try {
      final response = await _apiService.searchProducts(
        1, // page number
        minPrice,
        maxPrice,
        searchedPhrase,
        categoryName,
        brandName,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/shared_pref_helper.dart';
import 'package:solidify/features/marketplace/data/repo/product_category_repo.dart';
import 'package:solidify/features/marketplace/data/models/get_products_by_category_response_model.dart';
import 'package:solidify/features/marketplace/logic/product_category_cubit.dart/product_category_state.dart';

class ProductCategoryCubit extends Cubit<ProductCategoryState> {
  final ProductCategoryRepo _productCategoryRepo;

  ProductCategoryCubit(this._productCategoryRepo)
      : super(const ProductCategoryState.initial());

  Future<void> fetchProductCategory(int id) async {
    emit(const ProductCategoryState.categoryLoading());

    final result = await _productCategoryRepo.getProductCategory(id);

    result.when(
      success: (data) {
        final cachedIds = _cacheProductIds(data.model.result.items);
        emit(ProductCategoryState.categorySuccess(
            data, cachedIds)); // Pass cached IDs
      },
      failure: (error) {
        emit(ProductCategoryState.categoryError(error: error));
      },
    );
  }

  List<String> _cacheProductIds(List<ProductModel> products) {
    final List<String> productIds =
        products.map((product) => product.id).toList();
    SharedPrefHelper.cacheProductIds(productIds); // Cache the IDs
    return productIds; // Return the cached IDs for immediate use
  }

  Future<List<String>> getCachedProductIds() async {
    return await SharedPrefHelper.getCachedProductIds();
  }

  Future<bool> isProductIdCached(String id) async {
    return await SharedPrefHelper.isProductIdCached(id);
  }

  Future<void> clearCachedProductIds() async {
    await SharedPrefHelper.clearCachedProductIds();
  }
}

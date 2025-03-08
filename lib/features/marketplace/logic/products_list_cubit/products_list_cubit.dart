import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/features/marketplace/data/repo/products_list_repo.dart';
import 'package:solidify/core/helpers/shared_pref_helper.dart'; // Make sure to import
import 'package:solidify/features/marketplace/logic/products_list_cubit/products_list_state.dart';

class ProductsListCubit extends Cubit<ProductsListState> {
  final ProductsListRepo _productsListRepo;
  static const String CACHED_PRODUCT_IDS_KEY = 'cached_product_ids';

  ProductsListCubit(this._productsListRepo)
      : super(const ProductsListState.initial()) {
    print('onCreate -- ProductsListCubit');
  }

  Future<void> fetchProductsList() async {
    emit(const ProductsListState.productsListLoading());

    // Try to get cached products first
    final cachedIds = await _getCachedProductIds();
    if (cachedIds.isNotEmpty) {
      // If you want to use cached IDs for something before the API call
      // You can use them here
    }

    final result = await _productsListRepo.getProductsList();

    result.when(
      success: (data) {
        // Cache the product IDs when successful
        _cacheProductIds(data.model.items);
        emit(ProductsListState.productsListSuccess(data.model.items));
      },
      failure: (error) {
        emit(ProductsListState.productsListError(error: error));
      },
    );
  }

  // Cache product IDs
  Future<void> _cacheProductIds(List<dynamic> products) async {
    // Extract product IDs
    final List<String> productIds = products.map((product) => product.id.toString()).toList();
    
    // Store as a comma-separated string
    final String idsString = productIds.join(',');
    
    // Save to SharedPreferences
    await SharedPrefHelper.setData(CACHED_PRODUCT_IDS_KEY, idsString);
    print('ProductsListCubit: Cached ${productIds.length} product IDs');
  }

  // Retrieve cached product IDs
  Future<List<String>> _getCachedProductIds() async {
    final String idsString = await SharedPrefHelper.getString(CACHED_PRODUCT_IDS_KEY);
    if (idsString.isEmpty) {
      return [];
    }
    
    final List<String> productIds = idsString.split(',');
    print('ProductsListCubit: Retrieved ${productIds.length} cached product IDs');
    return productIds;
  }

  // You might want to add a method to check if a specific product ID is cached
  Future<bool> isProductCached(String productId) async {
    final cachedIds = await _getCachedProductIds();
    return cachedIds.contains(productId);
  }
  
  // Clear cached product IDs
  Future<void> clearCachedProductIds() async {
    await SharedPrefHelper.removeData(CACHED_PRODUCT_IDS_KEY);
    print('ProductsListCubit: Cleared cached product IDs');
  }
}
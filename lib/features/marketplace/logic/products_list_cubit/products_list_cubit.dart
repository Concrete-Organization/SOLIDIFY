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

    final cachedIds = await _getCachedProductIds();
    if (cachedIds.isNotEmpty) {}

    final result = await _productsListRepo.getProductsList();

    result.when(
      success: (data) {
        _cacheProductIds(data.model.items);
        emit(ProductsListState.productsListSuccess(data.model.items));
      },
      failure: (error) {
        emit(ProductsListState.productsListError(error: error));
      },
    );
  }

  Future<void> _cacheProductIds(List<dynamic> products) async {
    final List<String> productIds =
    products.map((product) => product.id.toString()).toList();

    final String idsString = productIds.join(',');

    await SharedPrefHelper.setData(CACHED_PRODUCT_IDS_KEY, idsString);
  }

  Future<List<String>> _getCachedProductIds() async {
    final String idsString =
    await SharedPrefHelper.getString(CACHED_PRODUCT_IDS_KEY);
    if (idsString.isEmpty) {
      return [];
    }

    final List<String> productIds = idsString.split(',');
    return productIds;
  }

  Future<bool> isProductCached(String productId) async {
    final cachedIds = await _getCachedProductIds();
    return cachedIds.contains(productId);
  }

  Future<void> clearCachedProductIds() async {
    await SharedPrefHelper.removeData(CACHED_PRODUCT_IDS_KEY);
  }
}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/core/helpers/shared_pref_helper.dart';
import 'package:solidify/features/marketplace/marketplace/data/repos/products_list_repo.dart';
import 'package:solidify/features/marketplace/marketplace/data/models/product_list_response_model.dart';
import 'package:solidify/features/marketplace/marketplace/logic/products_list_cubit/products_list_state.dart';

class ProductsListCubit extends Cubit<ProductsListState> {
  final ProductsListRepo _repo;
  int _currentPage = 1;
  bool _hasReachedMax = false;
  List<Product> _allProducts = [];
  List<Product> _filteredProducts = [];

  ProductsListCubit(this._repo) : super(const ProductsListState.initial());

  /// Fetches best sellers.
  Future<void> fetchBestSellers() async {
    _currentPage = 1;
    _hasReachedMax = false;
    _allProducts = [];

    emit(const ProductsListState.loading([]));

    final result = await _repo.getProductsList(_currentPage);

    result.when(
      success: (response) {
        _cacheProductIds(response.model.items);

        _allProducts = response.model.items;
        _filteredProducts = _allProducts; // Initialize filtered products
        _currentPage++;
        _hasReachedMax = response.model.totalPages <= _currentPage;

        emit(
            ProductsListState.bestSellersSuccess(_allProducts, _hasReachedMax));
      },
      failure: (error) {
        emit(ProductsListState.error(error));
      },
    );
  }

  /// Loads more best sellers.
  Future<void> loadMoreBestSellers() async {
    if (_hasReachedMax) return;

    emit(ProductsListState.loading(_allProducts));

    final result = await _repo.getProductsList(_currentPage);

    result.when(
      success: (response) {
        _allProducts.addAll(response.model.items);
        _filteredProducts = _allProducts; // Update filtered products
        _currentPage++;
        _hasReachedMax = response.model.totalPages < _currentPage;

        emit(
            ProductsListState.bestSellersSuccess(_allProducts, _hasReachedMax));
      },
      failure: (error) {
        emit(ProductsListState.error(error));
      },
    );
  }

  Future<void> fetchMarketplaceProducts() async {
    _currentPage = 1;
    _hasReachedMax = false;
    _allProducts = [];

    emit(const ProductsListState.loading([]));

    final result = await _repo.getProductsList(_currentPage);

    result.when(
      success: (response) {
        _cacheProductIds(response.model.items);

        _allProducts = response.model.items;
        _filteredProducts = _allProducts; // Initialize filtered products
        _currentPage++;
        _hasReachedMax = response.model.totalPages <= _currentPage;

        print('Fetched Products: ${_allProducts.length}'); // Debugging
        emit(ProductsListState.marketplaceSuccess(_allProducts));
      },
      failure: (error) {
        emit(ProductsListState.error(error));
      },
    );
  }

  /// Filters products based on the search query.
  void searchProducts(String query) {
    if (query.isEmpty) {
      _filteredProducts = _allProducts; // Show all products if query is empty
    } else {
      _filteredProducts = _allProducts
          .where((product) =>
              product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    emit(ProductsListState.searchSuccess(
        _filteredProducts)); // Emit search results
  }

  /// Checks if more products need to be loaded and triggers loading.
  void checkAndLoadMore(int index) {
    if (index >= _allProducts.length - 5 && !_hasReachedMax) {
      loadMoreBestSellers();
    }
  }

  /// Caches product IDs for later use.
  Future<void> _cacheProductIds(List<Product> products) async {
    final List<String> productIds =
        products.map((product) => product.id).toList();
    final String idsString = productIds.join(',');
    await SharedPrefHelper.setData('cached_product_ids', idsString);
  }

  /// Retrieves cached product IDs.
  Future<List<String>> _getCachedProductIds() async {
    final String idsString =
        await SharedPrefHelper.getString('cached_product_ids');
    if (idsString.isEmpty) return [];
    return idsString.split(',');
  }

  /// Checks if a product is cached.
  Future<bool> isProductCached(String productId) async {
    final cachedIds = await _getCachedProductIds();
    return cachedIds.contains(productId);
  }

  /// Clears cached product IDs.
  Future<void> clearCachedProductIds() async {
    await SharedPrefHelper.removeData('cached_product_ids');
  }
}

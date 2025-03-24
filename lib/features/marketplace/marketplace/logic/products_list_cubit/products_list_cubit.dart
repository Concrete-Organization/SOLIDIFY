import 'package:flutter_bloc/flutter_bloc.dart';
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

  Future<void> fetchAllProducts() async {
    _currentPage = 1;
    _hasReachedMax = false;
    _allProducts = [];

    emit(const ProductsListState.loading([]));

    while (!_hasReachedMax) {
      final result = await _repo.getProductsList(_currentPage);

      result.when(
        success: (response) {
          _allProducts.addAll(response.model.items);
          _currentPage++;
          _hasReachedMax = response.model.totalPages < _currentPage;

          if (_hasReachedMax) {
            _filteredProducts = _allProducts;
            emit(ProductsListState.marketplaceSuccess(_allProducts));
          }
        },
        failure: (error) {
          emit(ProductsListState.error(error));
          return;
        },
      );
    }
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
        _filteredProducts = _allProducts;
        _currentPage++;
        _hasReachedMax = response.model.totalPages <= _currentPage;

        emit(ProductsListState.marketplaceSuccess(_allProducts));
      },
      failure: (error) {
        emit(ProductsListState.error(error));
      },
    );
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      _filteredProducts = [];
    } else {
      _filteredProducts = _allProducts.where((product) {
        final matchesName =
            product.name.toLowerCase().contains(query.toLowerCase());
        final matchesDescription =
            product.description.toLowerCase().contains(query.toLowerCase());
        final matchesBrand =
            product.brandName.toLowerCase().contains(query.toLowerCase());
        return matchesName || matchesDescription || matchesBrand;
      }).toList();
    }
    emit(ProductsListState.searchSuccess(_filteredProducts));
  }

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
        _filteredProducts = _allProducts;
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

  Future<void> loadMoreBestSellers() async {
    if (_hasReachedMax) return;

    emit(ProductsListState.loading(_allProducts));

    final result = await _repo.getProductsList(_currentPage);

    result.when(
      success: (response) {
        _allProducts.addAll(response.model.items);
        _filteredProducts = _allProducts;
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

  void checkAndLoadMore(int index) {
    if (index >= _allProducts.length - 5 && !_hasReachedMax) {
      loadMoreBestSellers();
    }
  }

  Future<void> _cacheProductIds(List<Product> products) async {
    final List<String> productIds =
        products.map((product) => product.id).toList();
    final String idsString = productIds.join(',');
    await SharedPrefHelper.setData('cached_product_ids', idsString);
  }

  Future<List<String>> _getCachedProductIds() async {
    final String idsString =
        await SharedPrefHelper.getString('cached_product_ids');
    if (idsString.isEmpty) return [];
    return idsString.split(',');
  }

  Future<bool> isProductCached(String productId) async {
    final cachedIds = await _getCachedProductIds();
    return cachedIds.contains(productId);
  }

  Future<void> clearCachedProductIds() async {
    await SharedPrefHelper.removeData('cached_product_ids');
  }
}

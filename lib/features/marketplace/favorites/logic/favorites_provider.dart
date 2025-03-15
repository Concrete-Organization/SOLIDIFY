import 'package:flutter/foundation.dart';
import 'package:solidify/core/helpers/shared_pref_helper.dart';
import 'package:solidify/features/marketplace/marketplace/data/repos/products_list_repo.dart';
import 'package:solidify/features/marketplace/marketplace/data/models/product_list_response_model.dart';

class FavoritesProvider extends ChangeNotifier {
  List<Product> _favoriteProducts = [];

  List<Product> get favoriteProducts => _favoriteProducts;

  final ProductsListRepo _productsListRepo;

  FavoritesProvider(this._productsListRepo) {
    _loadFavorites();
  }

  // Load favorites from SharedPreferences
  Future<void> _loadFavorites() async {
    final favoriteIds = await SharedPrefHelper.getFavorites();
    if (favoriteIds.isNotEmpty) {
      // Fetch products based on favoriteIds
      _favoriteProducts = await _fetchProductsByIds(favoriteIds);
      notifyListeners();
    }
  }

  // Fetch products by their IDs
  Future<List<Product>> _fetchProductsByIds(List<String> ids) async {
    final result = await _productsListRepo.getProductsList();
    return result.when(
      success: (data) {
        final allProducts = data.model.items;
        return allProducts.where((product) => ids.contains(product.id)).toList();
      },
      failure: (error) {
        
        debugPrint('Failed to fetch products: $error');
        return [];
      },
    );
  }

  bool isFavorite(String productId) {
    return _favoriteProducts.any((product) => product.id == productId);
  }

  void toggleFavorite(Product product) async {
    if (isFavorite(product.id)) {
      _favoriteProducts.removeWhere((p) => p.id == product.id);
      await SharedPrefHelper.toggleFavorite(product.id);
    } else {
      _favoriteProducts.add(product);
      await SharedPrefHelper.toggleFavorite(product.id);
    }
    notifyListeners();
  }
}
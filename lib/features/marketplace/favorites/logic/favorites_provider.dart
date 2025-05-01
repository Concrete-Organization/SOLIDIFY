import 'package:flutter/foundation.dart';
import 'package:solidify/core/helpers/shared_pref_helper.dart';
import 'package:solidify/features/marketplace/favorites/domain/product_entity.dart';

class FavoritesProvider extends ChangeNotifier {
  List<ProductEntity> _favoriteProducts = [];

  List<ProductEntity> get favoriteProducts => _favoriteProducts;

  FavoritesProvider() {
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    _favoriteProducts = await SharedPrefHelper.getFavorites();
    notifyListeners();
  }

  bool isFavorite(String productId) {
    return _favoriteProducts.any((product) => product.id == productId);
  }

  void toggleFavorite(ProductEntity product) async {
    if (isFavorite(product.id)) {
      _favoriteProducts.removeWhere((p) => p.id == product.id);
    } else {
      _favoriteProducts.add(product);
    }
    await SharedPrefHelper.saveFavorites(_favoriteProducts);
    notifyListeners();
  }
}

import 'cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/shared_pref_helper.dart';
import 'package:solidify/features/marketplace/data/repo/cart_repo.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo _cartRepo;

  CartCubit(this._cartRepo) : super(const CartState.initial()) {
    _initializeCart();
  }

  Future<void> _initializeCart() async {
    final items = await _cartRepo.getCartItems();
    if (items.isNotEmpty) {}
  }

  Future<void> addCartItem(String id) async {
    emit(const CartState.loading());

    // Check if product ID is already cached
    final isCached = await SharedPrefHelper.isProductIdCached(id);
    if (!isCached) {
      // If not cached, add it to the cached list for future reference
      final cachedIds = await SharedPrefHelper.getCachedProductIds();
      cachedIds.add(id);
      await SharedPrefHelper.cacheProductIds(cachedIds);
    }

    // Process the cart item addition
    final result = await _cartRepo.addCartItem(id);
    result.when(
      success: (response) {
        emit(CartState.success(response));
      },
      failure: (error) {
        emit(CartState.error(error: error));
      },
    );
  }

  Future<bool> isProductInCart(String id) async {
    return await _cartRepo.isProductInCart(id);
  }

  Future<String> getCurrentProductId() async {
    return await SharedPrefHelper.getProductId();
  }
}

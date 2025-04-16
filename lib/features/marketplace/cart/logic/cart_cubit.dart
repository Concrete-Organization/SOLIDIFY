import 'dart:async';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/network/api_result.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/core/network/api_error_handler.dart';
import 'package:solidify/features/marketplace/cart/logic/cart_state.dart';
import 'package:solidify/features/marketplace/cart/data/repos/cart_repo.dart';
import 'package:solidify/features/marketplace/cart/data/models/get_cart_response_model.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo _cartRepo;
  bool _isErrorShown = false;

  CartCubit(this._cartRepo) : super(const CartState.initial());

  Future<void> addCartItem(String productId) async {
    emit(CartState.loading(productId));
    try {
      final result = await _cartRepo.addCartItem(productId);
      result.when(
        success: (_) => emit(CartState.success(productId)),
        failure: (error) {
          _handleError(productId, error);
          emit(CartState.error(productId: productId, error: error));
        },
      );
    } catch (e) {
      final errorModel = ApiErrorHandler.handle(e);
      _handleError(productId, errorModel);
      emit(CartState.error(productId: productId, error: errorModel));
    }
  }

  Future<void> getCartItems() async {
    emit(const CartState.cartLoading());
    try {
      final result = await _cartRepo.getCartList();
      result.when(
        success: (cartResponse) =>
            emit(CartState.cartListSuccess(cartResponse)),
        failure: (error) {
          _handleError('', error);
          emit(CartState.cartListError(error));
        },
      );
    } catch (e) {
      final errorModel = ApiErrorHandler.handle(e);
      _handleError('', errorModel);
      emit(CartState.cartListError(errorModel));
    }
  }

  Future<void> deleteCartItem(String productId, String name) async {
    emit(CartState.loading(productId));
    try {
      final result = await _cartRepo.deleteCartItem(productId);
      result.when(
        success: (_) async {
          emit(CartState.cartItemDeleted(productId, name));
          await getCartItems();
        },
        failure: (error) {
          _handleError(productId, error);
          emit(CartState.error(productId: productId, error: error));
        },
      );
    } catch (e) {
      final errorModel = ApiErrorHandler.handle(e);
      _handleError(productId, errorModel);
      emit(CartState.error(productId: productId, error: errorModel));
    }
  }

  Future<bool> incrementCartItem(String productId, int targetQuantity) async {
    final currentCart = state.maybeWhen(
      cartListSuccess: (cartResponse) => cartResponse,
      orElse: () => null,
    );

    if (currentCart == null) {
      await getCartItems();
      return false;
    }

    final currentItem = currentCart.model.items
        .firstWhereOrNull((item) => item.id == productId);
    if (currentItem == null) {
      await getCartItems();
      return false;
    }

    final currentQuantity = currentItem.quantity;
    final difference = targetQuantity - currentQuantity;

    final updatedItems = currentCart.model.items.map((item) {
      if (item.id == productId) {
        return CartItemModel(
          id: item.id,
          name: item.name,
          quantity: targetQuantity,
          price: item.price,
          imageUri: item.imageUri,
        );
      }
      return item;
    }).toList();

    final newTotalPrice = calculateTotalPrice(updatedItems);

    final updatedCartModel = CartModel(
      totalPrice: newTotalPrice,
      items: updatedItems,
    );

    final updatedCartResponse = GetCartResponseModel(
      isSucceeded: currentCart.isSucceeded,
      statusCode: currentCart.statusCode,
      message: currentCart.message,
      model: updatedCartModel,
    );

    emit(CartState.cartListSuccess(updatedCartResponse));

    bool success = true;
    if (difference > 0) {
      for (int i = 0; i < difference; i++) {
        final result = await _cartRepo.incrementCartItem(productId);
        if (!result.isSuccess) {
          success = false;
          break;
        }
      }
    } else if (difference < 0) {
      for (int i = 0; i < -difference; i++) {
        final result = await _cartRepo.decrementCartItem(productId);
        if (!result.isSuccess) {
          success = false;
          break;
        }
      }
    }

    if (!success) {
      await getCartItems();
    }

    return success;
  }

  Future<bool> decrementCartItem(String productId, int targetQuantity) async {
    final currentCart = state.maybeWhen(
      cartListSuccess: (cartResponse) => cartResponse,
      orElse: () => null,
    );

    if (currentCart == null) {
      await getCartItems();
      return false;
    }

    final currentItem = currentCart.model.items
        .firstWhereOrNull((item) => item.id == productId);
    if (currentItem == null) {
      await getCartItems();
      return false;
    }

    final currentQuantity = currentItem.quantity;
    final difference = targetQuantity - currentQuantity;

    final updatedItems = currentCart.model.items.map((item) {
      if (item.id == productId) {
        return CartItemModel(
          id: item.id,
          name: item.name,
          quantity: targetQuantity,
          price: item.price,
          imageUri: item.imageUri,
        );
      }
      return item;
    }).toList();

    final newTotalPrice = calculateTotalPrice(updatedItems);

    final updatedCartModel = CartModel(
      totalPrice: newTotalPrice,
      items: updatedItems,
    );

    final updatedCartResponse = GetCartResponseModel(
      isSucceeded: currentCart.isSucceeded,
      statusCode: currentCart.statusCode,
      message: currentCart.message,
      model: updatedCartModel,
    );

    emit(CartState.cartListSuccess(updatedCartResponse));

    bool success = true;
    if (difference > 0) {
      for (int i = 0; i < difference; i++) {
        final result = await _cartRepo.incrementCartItem(productId);
        if (!result.isSuccess) {
          success = false;
          break;
        }
      }
    } else if (difference < 0) {
      for (int i = 0; i < -difference; i++) {
        final result = await _cartRepo.decrementCartItem(productId);
        if (!result.isSuccess) {
          success = false;
          break;
        }
      }
    }

    if (!success) {
      await getCartItems();
    }

    return success;
  }

  Future<void> waitForSyncs() async {
    await getCartItems();
  }

  double calculateTotalPrice(List<CartItemModel> items) {
    return items.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }

  void _handleError(String productId, ApiErrorModel error) {
    if (!_isErrorShown) {
      _isErrorShown = true;
      Future.delayed(const Duration(seconds: 2), () => _isErrorShown = false);
    }
  }

}

extension ApiResultExtension<T> on ApiResult<T> {
  bool get isSuccess => maybeWhen(
        success: (_) => true,
        orElse: () => false,
      );
}

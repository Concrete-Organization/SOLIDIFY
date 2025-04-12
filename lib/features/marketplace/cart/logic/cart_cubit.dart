import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/network/api_result.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/core/network/api_error_handler.dart';
import 'package:solidify/features/marketplace/cart/logic/cart_state.dart';
import 'package:solidify/features/marketplace/cart/data/repos/cart_repo.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo _cartRepo;
  bool _isErrorShown = false;

  final _incrementController = StreamController<Map<String, dynamic>>();
  final _decrementController = StreamController<Map<String, dynamic>>();

  final Map<String, Completer<bool>> _pendingSyncs = {};

  CartCubit(this._cartRepo) : super(const CartState.initial()) {
    _incrementController.stream
        .debounceTime(const Duration(milliseconds: 500))
        .listen((data) {
      final productId = data['productId'] as String;
      final targetQuantity = data['targetQuantity'] as int;
      _syncQuantity(productId, targetQuantity).then((success) {
        // Complete the pending sync operation
        _pendingSyncs[productId]?.complete(success);
        _pendingSyncs.remove(productId);
      });
    });

    _decrementController.stream
        .debounceTime(const Duration(milliseconds: 500))
        .listen((data) {
      final productId = data['productId'] as String;
      final targetQuantity = data['targetQuantity'] as int;
      _syncQuantity(productId, targetQuantity).then((success) {
        // Complete the pending sync operation
        _pendingSyncs[productId]?.complete(success);
        _pendingSyncs.remove(productId);
      });
    });
  }

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
    print(
        'incrementCartItem called with productId: $productId, type: ${productId.runtimeType}');
    final safeProductId = productId.toString(); // Ensure it's a String

    final completer = Completer<bool>();
    _pendingSyncs[safeProductId] = completer;

    _incrementController.add({
      'productId': safeProductId,
      'targetQuantity': targetQuantity,
    });

    return completer.future;
  }

  Future<bool> decrementCartItem(String productId, int targetQuantity) async {
    print(
        'decrementCartItem called with productId: $productId, type: ${productId.runtimeType}');
    final safeProductId = productId.toString(); // Ensure it's a String

    // Create a completer for this sync operation
    final completer = Completer<bool>();
    _pendingSyncs[safeProductId] = completer;

    _decrementController.add({
      'productId': safeProductId,
      'targetQuantity': targetQuantity,
    });

    return completer.future;
  }

  Future<bool> _syncQuantity(String productId, int targetQuantity) async {
    try {
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

      if (difference == 0) return true;

      if (difference > 0) {
        // Need to increment
        for (int i = 0; i < difference; i++) {
          final result = await _cartRepo.incrementCartItem(productId);
          if (!result.isSuccess) {
            await getCartItems();
            return false;
          }
        }
      } else {
        // Need to decrement
        for (int i = 0; i < -difference; i++) {
          final result = await _cartRepo.decrementCartItem(productId);
          if (!result.isSuccess) {
            await getCartItems();
            return false;
          }
        }
      }

      return true;
    } catch (e) {
      print('Error syncing quantity for productId $productId: $e');
      await getCartItems();
      return false;
    }
  }

  void _handleError(String productId, ApiErrorModel error) {
    if (!_isErrorShown) {
      _isErrorShown = true;
      Future.delayed(const Duration(seconds: 2), () => _isErrorShown = false);
    }
  }

  @override
  Future<void> close() {
    _incrementController.close();
    _decrementController.close();

    _pendingSyncs.values.forEach((completer) => completer.complete(false));
    _pendingSyncs.clear();
    return super.close();
  }
}

extension ApiResultExtension<T> on ApiResult<T> {
  bool get isSuccess => maybeWhen(
        success: (_) => true,
        orElse: () => false,
      );
}

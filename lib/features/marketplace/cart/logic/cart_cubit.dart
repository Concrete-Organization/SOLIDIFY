import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/core/network/api_error_handler.dart';
import 'package:solidify/features/marketplace/cart/logic/cart_state.dart';
import 'package:solidify/features/marketplace/cart/data/repos/cart_repo.dart';

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

  void _handleError(String productId, ApiErrorModel error) {
    if (!_isErrorShown) {
      _isErrorShown = true;
      Future.delayed(const Duration(seconds: 2), () => _isErrorShown = false);
    }
  }
}

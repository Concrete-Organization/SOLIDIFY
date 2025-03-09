import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/core/network/api_error_handler.dart';
import 'package:solidify/core/helpers/shared_pref_helper.dart';
import 'package:solidify/features/marketplace/data/repo/cart_repo.dart';
import 'package:solidify/features/marketplace/logic/cart_cubit/cart_state.dart';

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
      _handleError(productId, ApiErrorHandler.handle(e));
      emit(CartState.error(
        productId: productId,
        error: ApiErrorHandler.handle(e),
      ));
    }
  }

  void _handleError(String productId, ApiErrorModel error) {
    if (!_isErrorShown) {
      _isErrorShown = true;
      Future.delayed(const Duration(seconds: 2), () => _isErrorShown = false);
    }
  }
}

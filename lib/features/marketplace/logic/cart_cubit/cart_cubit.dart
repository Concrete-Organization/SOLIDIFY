import 'cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/features/marketplace/data/repo/cart_repo.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo _cartRepo;

  CartCubit(this._cartRepo) : super(const CartState.initial());

  Future<void> addCartItem(String id) async {
    emit(const CartState.loading());
    final result = await _cartRepo.addCartItem(id);
    result.when(
      success: (response) => emit(CartState.success(response)),
      failure: (error) => emit(CartState.error(error: error)),
    );
  }
}

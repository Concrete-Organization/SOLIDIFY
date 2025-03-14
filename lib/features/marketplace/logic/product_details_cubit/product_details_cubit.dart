import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/core/network/api_error_handler.dart';
import 'package:solidify/features/marketplace/data/repo/product_details_repo.dart';
import 'package:solidify/features/marketplace/logic/product_details_cubit/product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ProductDetailsRepo _repo;
  bool _isErrorShown = false;

  ProductDetailsCubit(this._repo) : super(const ProductDetailsState.initial());

  Future<void> getProductDetails(String productId) async {
    emit(ProductDetailsState.loading(productId));

    try {
      final result = await _repo.getProductById(productId);

      result.when(
        success: (response) =>
            emit(ProductDetailsState.success(response.model)),
        failure: (error) {
          _handleError(productId, error);
          emit(
            ProductDetailsState.error(
              productId: productId,
              error: error,
            ),
          );
        },
      );
    } catch (e) {
      _handleError(productId, ApiErrorHandler.handle(e));
      emit(ProductDetailsState.error(
        productId: productId,
        error: ApiErrorHandler.handle(e),
      ));
    }
  }

  void _handleError(String productId, ApiErrorModel error) {
    if (!_isErrorShown) {
      _isErrorShown = true;
      Future.delayed(
        const Duration(seconds: 2),
        () => _isErrorShown = false,
      );
    }
  }
}

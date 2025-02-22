import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/features/marketplace/data/repo/products_list_repo.dart';
import 'package:solidify/features/marketplace/logic/products_list_cubit/products_list_state.dart';

class ProductsListCubit extends Cubit<ProductsListState> {
  final ProductsListRepo _productsListRepo;

  ProductsListCubit(this._productsListRepo) : super(const ProductsListState.initial());

  Future<void> fetchProductsList() async {
    emit(const ProductsListState.productsListLoading());

    final result = await _productsListRepo.getProductsList();

    result.when(
      success: (data) {
        emit(ProductsListState.productsListSuccess(data.model.items));
      },
      failure: (error) {
        emit(ProductsListState.productsListError(error: error.apiErrorModel));
      },
    );
  }
}
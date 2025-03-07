import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/features/marketplace/data/repo/product_category_repo.dart';
import 'package:solidify/features/marketplace/logic/product_category_cubit.dart/product_category_state.dart';

class ProductCategoryCubit extends Cubit<ProductCategoryState> {
  final ProductCategoryRepo _productCategoryRepo;

  ProductCategoryCubit(this._productCategoryRepo)
      : super(const ProductCategoryState.initial());

  Future<void> fetchProductCategory(int id) async {
    emit(const ProductCategoryState.categoryLoading());

    final result = await _productCategoryRepo.getProductCategory(id);

    result.when(
      success: (data) {
        emit(ProductCategoryState.categorySuccess(data));
      },
      failure: (error) {
        emit(ProductCategoryState.categoryError(error: error));
      },
    );
  }
}

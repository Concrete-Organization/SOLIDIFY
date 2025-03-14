import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/widgets/loading_circle_indicator.dart';
import 'package:solidify/features/marketplace/marketplace/ui/widgets/product_grid_view.dart';
import 'package:solidify/features/marketplace/marketplace/logic/products_list_cubit/products_list_cubit.dart';
import 'package:solidify/features/marketplace/marketplace/logic/products_list_cubit/products_list_state.dart';

class MarketplaceBlocBuilder extends StatelessWidget {
  const MarketplaceBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsListCubit, ProductsListState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
          productsListLoading: () => const SliverToBoxAdapter(
            child: LoadingCircleIndicator(),
          ),
          productsListSuccess: (products) =>
              ProductGridView(products: products),
          productsListError: (error) => SliverToBoxAdapter(
            child: Center(child: Text('Error: ${error.message}')),
          ),
        );
      },
    );
  }
}

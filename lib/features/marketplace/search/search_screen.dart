import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/loading_circle_indicator.dart';
import 'package:solidify/features/marketplace/marketplace/ui/widgets/product_grid_view.dart';
import 'package:solidify/features/marketplace/marketplace/ui/widgets/product_search_bar.dart';
import 'package:solidify/features/marketplace/marketplace/logic/products_list_cubit/products_list_cubit.dart';
import 'package:solidify/features/marketplace/marketplace/logic/products_list_cubit/products_list_state.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            children: [
              ProductSearchBar(
                onSearch: (query) {
                  context.read<ProductsListCubit>().searchProducts(query);
                },
              ),
              Expanded(
                child: BlocBuilder<ProductsListCubit, ProductsListState>(
                  builder: (context, state) {
                    return CustomScrollView(
                      slivers: [
                        state.when(
                          initial: () {
                            // Fetch products when the screen is first loaded
                            context
                                .read<ProductsListCubit>()
                                .fetchMarketplaceProducts();
                            return SliverToBoxAdapter(
                              child:
                                  Center(child: Text('Start typing to search')),
                            );
                          },
                          loading: (products) => SliverToBoxAdapter(
                            child: Center(child: LoadingCircleIndicator()),
                          ),
                          marketplaceSuccess: (products) =>
                              ProductGridView(products: products),
                          bestSellersSuccess: (_, __) =>
                              SliverToBoxAdapter(child: SizedBox.shrink()),
                          searchSuccess: (products) {
                            if (products.isEmpty) {
                              return SliverToBoxAdapter(
                                child: Center(child: Text('No products found')),
                              );
                            }
                            return ProductGridView(products: products);
                          },
                          error: (error) => SliverToBoxAdapter(
                            child:
                                Center(child: Text('Error: ${error.message}')),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

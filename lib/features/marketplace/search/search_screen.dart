import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/error_state_message.dart';
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
              // Search Bar
              ProductSearchBar(
                onSearch: (query) {
                  context
                      .read<ProductsListCubit>()
                      .fetchAllProducts()
                      .then((_) {
                    context.read<ProductsListCubit>().searchProducts(query);
                  });
                },
              ),

              // Vertical Spacing (35 pixels)
              verticalSpace(35),

              // Products or Messages
              Expanded(
                child: BlocBuilder<ProductsListCubit, ProductsListState>(
                  builder: (context, state) {
                    return CustomScrollView(
                      slivers: [
                        state.when(
                          initial: () => SliverToBoxAdapter(),
                          loading: (products) => SliverToBoxAdapter(
                            child: Center(
                              child: LoadingCircleIndicator(),
                            ),
                          ),
                          marketplaceSuccess: (products) => SliverToBoxAdapter(
                            child: SizedBox.shrink(),
                          ),
                          bestSellersSuccess: (_, __) => SliverToBoxAdapter(
                            child: SizedBox.shrink(),
                          ),
                          searchSuccess: (products) {
                            if (products.isEmpty) {
                              return SliverToBoxAdapter(
                                child: Center(
                                  child: Text('No products found',
                                      style: TextStyles.font15MainBlueMedium),
                                ),
                              );
                            }
                            return ProductGridView(products: products);
                          },
                          error: (error) => SliverToBoxAdapter(
                            child: ErrorStateMessage(
                              message: 'Error: ${error.message}',
                            ),
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

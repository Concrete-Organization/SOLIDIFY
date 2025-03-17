import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/loading_circle_indicator.dart';
import 'package:solidify/features/marketplace/marketplace/ui/widgets/product_grid_view_item.dart';
import 'package:solidify/features/marketplace/marketplace/data/models/product_list_response_model.dart';
import 'package:solidify/features/marketplace/marketplace/logic/products_list_cubit/products_list_cubit.dart';
import 'package:solidify/features/marketplace/marketplace/logic/products_list_cubit/products_list_state.dart';

class BestSellersScreen extends StatelessWidget {
  const BestSellersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Best Sellers',
          style: TextStyles.font18MainSemiBold,
        ),
      ),
      body: BlocConsumer<ProductsListCubit, ProductsListState>(
        listener: (context, state) {
          state.whenOrNull(
            error: (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${error.message}')),
              );
            },
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () {
              BlocProvider.of<ProductsListCubit>(context).fetchBestSellers();
              return const LoadingCircleIndicator();
            },
            loading: (products) => _buildProductGrid(
              context,
              products,
              isLoading: true,
            ),
            marketplaceSuccess: (products) =>
                _buildProductGrid(context, products),
            bestSellersSuccess: (products, hasReachedMax) => _buildProductGrid(
              context,
              products,
              hasReachedMax: hasReachedMax,
            ),
            error: (error) => _buildProductGrid(context, [], showError: true),
          );
        },
      ),
    );
  }

  Widget _buildProductGrid(
    BuildContext context,
    List<Product> products, {
    bool isLoading = false,
    bool hasReachedMax = false,
    bool showError = false,
  }) {
    final scrollController = ScrollController();

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollUpdateNotification) {
          final maxScroll = notification.metrics.maxScrollExtent;
          final currentScroll = notification.metrics.pixels;
          final threshold =
              maxScroll * 0.8; // Load more when 80% of the list is scrolled

          if (currentScroll >= threshold && !hasReachedMax) {
            BlocProvider.of<ProductsListCubit>(context).loadMoreBestSellers();
          }
        }
        return false;
      },
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(16.w),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15.w,
                mainAxisSpacing: 15.h,
                childAspectRatio: 0.6,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  // Check and load more if the user is near the end
                  BlocProvider.of<ProductsListCubit>(context)
                      .checkAndLoadMore(index);

                  return GestureDetector(
                    onTap: () {
                      context.pushNamed(
                        Routes.productDetailsScreen,
                        arguments: products[index].id,
                      );
                    },
                    child: ProductGridViewItem(
                      product: products[index],
                      index: index,
                    ),
                  );
                },
                childCount: products.length,
              ),
            ),
          ),
          if (hasReachedMax)
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Text(
                  'No more products to load',
                  style: TextStyles.font15MainBlueMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          if (showError)
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Text(
                  'Error loading products',
                  style: TextStyles.font14RedRegular,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

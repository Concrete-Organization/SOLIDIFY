import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/marketplace/data/models/product_list_response_model.dart';
import 'package:solidify/features/marketplace/ui/screens/marketplace/widgets/product_grid_view.dart';
import 'package:solidify/features/marketplace/ui/screens/marketplace/widgets/product_search_bar.dart';
import 'package:solidify/features/marketplace/ui/screens/marketplace/widgets/category_product_grid.dart';
import 'package:solidify/features/marketplace/logic/product_category_cubit.dart/prodcut_category_cubit.dart';
import 'package:solidify/features/marketplace/logic/product_category_cubit.dart/product_category_state.dart';

class ProductCategoryScreen extends StatelessWidget {
  const ProductCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    String categoryLabel = 'Material';
    int? categoryId;
    if (args != null && args is Map<String, dynamic>) {
      categoryLabel = args['label'] ?? 'Material';
      categoryId = args['id'];
    }

    // The cubit is provided via the route.
    // The cubit should fetch the products for the given category.
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            child: SvgPicture.asset('assets/svgs/cart_icon.svg'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: GestureDetector(
              child: SvgPicture.asset('assets/svgs/list_icon.svg'),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<ProductCategoryCubit, ProductCategoryState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                // Header with search bar and category label
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        verticalSpace(5),
                        const HorizontalDivider(),
                        verticalSpace(21),
                        const ProductSearchBar(),
                        verticalSpace(15),
                        Text(
                          categoryLabel,
                          style: TextStyles.font24lightBlackMedium,
                        ),
                        verticalSpace(15),
                      ],
                    ),
                  ),
                ),
                // Grid view of products (using cubit state)
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  sliver: state.when(
                    initial: () =>
                        const SliverToBoxAdapter(child: SizedBox.shrink()),
                    categoryLoading: () => const SliverToBoxAdapter(
                        child: Center(child: CircularProgressIndicator())),
                    categorySuccess: (categoryResponse) {
                      final products = categoryResponse.model.products;
                      return CategoryProductsGrid(products: products);
                    },
                    categoryError: (error) => SliverToBoxAdapter(
                        child: Center(child: Text('Error: ${error.message}'))),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

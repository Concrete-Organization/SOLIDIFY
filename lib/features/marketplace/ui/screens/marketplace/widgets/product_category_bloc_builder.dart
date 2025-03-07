import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/marketplace/ui/screens/marketplace/widgets/product_search_bar.dart';
import 'package:solidify/features/marketplace/ui/screens/marketplace/widgets/category_product_grid.dart';
import 'package:solidify/features/marketplace/logic/product_category_cubit.dart/prodcut_category_cubit.dart';
import 'package:solidify/features/marketplace/logic/product_category_cubit.dart/product_category_state.dart';

class ProductCategoryBlocBuilder extends StatelessWidget {
  final String categoryLabel;

  const ProductCategoryBlocBuilder({Key? key, required this.categoryLabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCategoryCubit, ProductCategoryState>(
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
            // Grid view based on cubit state
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
                  child: Center(child: Text('Error: ${error.message}')),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

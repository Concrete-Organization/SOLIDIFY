import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/core/widgets/error_state_message.dart';
import 'package:solidify/features/marketplace/ui/screens/marketplace/widgets/product_search_bar.dart';
import 'package:solidify/features/marketplace/ui/screens/marketplace/widgets/category_product_grid.dart';
import 'package:solidify/features/marketplace/logic/product_category_cubit.dart/prodcut_category_cubit.dart';
import 'package:solidify/features/marketplace/logic/product_category_cubit.dart/product_category_state.dart';

class ProductCategoryBlocBuilder extends StatelessWidget {
  final String categoryLabel;

  const ProductCategoryBlocBuilder({super.key, required this.categoryLabel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCategoryCubit, ProductCategoryState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
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
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
              sliver: state.when(
                initial: () => const SliverToBoxAdapter(
                  child: SizedBox.shrink(),
                ),
                categoryLoading: () => const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                categorySuccess: (categoryResponse, cachedIds) {
                  final products = categoryResponse.model.result.items;
                  return CategoryProductsGrid(
                    products: products,
                    cachedProductIds: cachedIds,
                  );
                },
                categoryError: (error) => SliverToBoxAdapter(
                    child: ErrorStateMessage(
                  message: 'Error: ${error.message}',
                )),
              ),
            ),
          ],
        );
      },
    );
  }
}

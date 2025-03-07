import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/marketplace/ui/screens/marketplace/widgets/product_grid_view.dart';
import 'package:solidify/features/marketplace/ui/screens/marketplace/widgets/product_search_bar.dart';
import 'package:solidify/features/marketplace/ui/screens/marketplace/widgets/category_product_grid.dart';
import 'package:solidify/features/marketplace/logic/product_category_cubit.dart/prodcut_category_cubit.dart';
import 'package:solidify/features/marketplace/logic/product_category_cubit.dart/product_category_state.dart';
import 'package:solidify/features/marketplace/ui/screens/marketplace/widgets/category_product_grid_view_item.dart';

class ProductCategoryScreen extends StatefulWidget {
  const ProductCategoryScreen({super.key});

  @override
  State<ProductCategoryScreen> createState() => _ProductCategoryScreenState();
}

class _ProductCategoryScreenState extends State<ProductCategoryScreen> {
  int? categoryId;
  String? categoryLabel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && args is Map<String, dynamic>) {
      categoryLabel = args['label'] ?? 'Material';
      categoryId = args['id'];
      // Trigger the API call if a category ID is provided.
      if (categoryId != null) {
        context.read<ProductCategoryCubit>().fetchProductCategory(categoryId!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                          categoryLabel ?? 'Material',
                          style: TextStyles.font24lightBlackMedium,
                        ),
                        verticalSpace(15),
                      ],
                    ),
                  ),
                ),
                // Grid view of products based on cubit state
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  sliver: state.when(
                    initial: () =>
                        const SliverToBoxAdapter(child: SizedBox.shrink()),
                    categoryLoading: () => const SliverToBoxAdapter(
                        child: Center(child: CircularProgressIndicator())),
                    categorySuccess: (categoryResponse) {
                      // The products are extracted from the category response model.
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

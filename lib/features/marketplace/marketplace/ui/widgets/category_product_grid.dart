import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/features/marketplace/marketplace/ui/widgets/category_product_grid_view_item.dart';
import 'package:solidify/features/marketplace/marketplace/data/models/get_products_by_category_response_model.dart';

class CategoryProductsGrid extends StatelessWidget {
  final List<ProductModel> products;
  final List<String> cachedProductIds;

  const CategoryProductsGrid({
    super.key,
    required this.products,
    required this.cachedProductIds,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final product = products[index];
          final isCached = cachedProductIds.contains(product.id);
          return GestureDetector(
            onTap: () {
              context.pushNamed(
                Routes.productDetailsScreen,
                arguments: product.id,
              );
            },
            child: CategoryProductGridViewItem(
              product: product,
              isCached: isCached,
            ),
          );
        },
        childCount: products.length,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 0.6,
      ),
    );
  }
}

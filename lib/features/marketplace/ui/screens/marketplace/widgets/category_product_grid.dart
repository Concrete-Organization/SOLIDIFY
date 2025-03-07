import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/features/marketplace/data/models/get_products_by_category_response_model.dart';
import 'package:solidify/features/marketplace/ui/screens/marketplace/widgets/category_product_grid_view_item.dart';

class CategoryProductsGrid extends StatelessWidget {
  final List<ProductModel> products;

  const CategoryProductsGrid({Key? key, required this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) => GestureDetector(
          onTap: () {
            // Add your navigation logic if needed.
          },
          child: CategoryProductGridViewItem(product: products[index]),
        ),
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

import 'product_grid_view_item.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) => GestureDetector(
            onTap: () {
              context.pushNamed(Routes.productDetailsScreen);
            },
            child: const ProductGridViewItem()),
        childCount: 6,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 12,
        childAspectRatio: 0.6,
      ),
    );
  }
}

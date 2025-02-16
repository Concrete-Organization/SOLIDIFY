import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/marketplace/ui/screens/marketplace/widgets/product_grid_view.dart';
import 'package:solidify/features/marketplace/ui/screens/marketplace/widgets/product_search_bar.dart';
import 'package:solidify/features/marketplace/ui/screens/marketplace/widgets/marketplace_top_bar.dart';

class ProductCategoryScreen extends StatelessWidget {
  const ProductCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header section
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    MarketplaceTopBar(
                      leftIconPath: 'assets/svgs/back_arrow.svg',
                      onLeftIconTap: () {
                        context.pop();
                      },
                    ),
                    verticalSpace(30),
                    const HorizontalDivider(),
                    verticalSpace(25),
                    const ProductSearchBar(),
                    verticalSpace(30),
                  ],
                ),
              ),
            ),
            // Grid section (using our new SliverGrid)
            const ProductGridView(),
          ],
        ),
      ),
    );
  }
}

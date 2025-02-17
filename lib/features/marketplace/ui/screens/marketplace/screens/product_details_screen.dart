import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/widgets/backble_top_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/marketplace/ui/screens/marketplace/widgets/product_text_column.dart';
import 'package:solidify/features/marketplace/ui/screens/marketplace/widgets/review_card_list_view.dart';
import 'package:solidify/features/marketplace/ui/screens/marketplace/widgets/product_stack_for_details_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              sliver: SliverToBoxAdapter(
                child: const BackableTopBar(
                  screenTitle: 'Product Details',
                  suffixIconPath: 'assets/svgs/cart_icon.svg',
                ),
              ),
            ),
            SliverToBoxAdapter(child: verticalSpace(20)),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              sliver: const SliverToBoxAdapter(child: HorizontalDivider()),
            ),
            SliverToBoxAdapter(child: verticalSpace(20)),
            SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: const ProductStackForDetailsScreen(),
                ),
              ),
            ),
            SliverToBoxAdapter(child: verticalSpace(20)),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              sliver: const SliverToBoxAdapter(child: HorizontalDivider()),
            ),
            SliverToBoxAdapter(child: verticalSpace(35)),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              sliver: const SliverToBoxAdapter(child: ProductTextColumn()),
            ),
            SliverToBoxAdapter(child: verticalSpace(25)),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              sliver: const SliverToBoxAdapter(child: ReviewCardListView()),
            ),
          ],
        ),
      ),
    );
  }
}

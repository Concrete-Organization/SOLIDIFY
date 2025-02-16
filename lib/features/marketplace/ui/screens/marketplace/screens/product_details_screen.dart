import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/widgets/backble_top_bar.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/marketplace/ui/screens/marketplace/widgets/product_stack_for_details_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackableTopBar(
              screenTitle: 'Product Details',
              suffixIconPath: 'assets/svgs/cart_icon.svg',
            ),
            verticalSpace(20),
            const HorizontalDivider(),
            verticalSpace(20),
            const Center(child: ProductStackForDetailsScreen()),
            verticalSpace(20),
            const HorizontalDivider(),
          ],
        ),
      )),
    );
  }
}

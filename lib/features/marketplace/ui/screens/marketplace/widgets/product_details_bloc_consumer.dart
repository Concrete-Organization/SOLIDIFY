import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/core/widgets/error_state_message.dart';
import 'package:solidify/features/marketplace/data/models/get_product_by_id_response_body.dart';
import 'package:solidify/features/marketplace/logic/product_details_cubit/product_details_cubit.dart';
import 'package:solidify/features/marketplace/logic/product_details_cubit/product_details_state.dart';
import 'package:solidify/features/marketplace/ui/screens/marketplace/widgets/product_text_column.dart';
import 'package:solidify/features/marketplace/ui/screens/marketplace/widgets/review_card_list_view.dart';
import 'package:solidify/features/marketplace/ui/screens/marketplace/widgets/product_stack_for_details_screen.dart';

class ProductDetailsBlocConsumer extends StatelessWidget {
  final String productId;

  const ProductDetailsBlocConsumer({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: (_) {},
          success: (_) {},
          error: (productId, error) {
            // Show error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${error.message}')),
            );
          },
        );
      },
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: (_) => const Center(child: CircularProgressIndicator()),
          success: (product) => _buildProductContent(product),
          error: (productId, error) => ErrorStateMessage(
            message: 'Error: ${error.message}',
          ),
        );
      },
    );
  }

  Widget _buildProductContent(ProductModel product) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: verticalSpace(5)),
        const SliverToBoxAdapter(child: HorizontalDivider()),
        SliverToBoxAdapter(child: verticalSpace(20)),
        SliverToBoxAdapter(
          child: ProductStackForDetailsScreen(
            imageUrl: product.imageUri,
            discount: product.discount,
          ),
        ),
        SliverToBoxAdapter(child: verticalSpace(20)),
        const SliverToBoxAdapter(child: HorizontalDivider()),
        SliverToBoxAdapter(child: verticalSpace(24)),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          sliver: SliverToBoxAdapter(
            child: ProductTextColumn(
              brandName: product.brandName ?? 'No Brand',
              productName: product.name,
              price: product.price,
              description: product.description,
              measurement: product.measurement,
              rate: product.rate,
              reviewText: product.description,
            ),
          ),
        ),
        SliverToBoxAdapter(child: verticalSpace(14)),
        const ReviewCardListView(),
      ],
    );
  }
}

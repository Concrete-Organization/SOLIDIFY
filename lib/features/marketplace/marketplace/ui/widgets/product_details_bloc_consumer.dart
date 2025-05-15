import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/custom_snack_bar.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/core/widgets/error_state_message.dart';
import 'package:solidify/core/widgets/loading_circle_indicator.dart';
import 'package:solidify/features/marketplace/marketplace/ui/widgets/product_text_column.dart';
import 'package:solidify/features/marketplace/marketplace/ui/widgets/review_card_list_view.dart';
import 'package:solidify/features/marketplace/marketplace/data/models/get_product_by_id_response_body.dart';
import 'package:solidify/features/marketplace/marketplace/ui/widgets/product_stack_for_details_screen.dart';
import 'package:solidify/features/marketplace/marketplace/logic/product_details_cubit/product_details_cubit.dart';
import 'package:solidify/features/marketplace/marketplace/logic/product_details_cubit/product_details_state.dart';

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
            CustomSnackBar.showError(context, error.getAllErrorMessages());
          },
        );
      },
      builder: (context, state) {
        return state.when(
          initial: () => LoadingCircleIndicator(),
          loading: (_) => LoadingCircleIndicator(),
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
              productDescription: product.description,
              rate: product.rate,
              reviews: product.reviews,
            ),
          ),
        ),
        SliverToBoxAdapter(child: verticalSpace(14)),
        ReviewCardListView(reviews: product.reviews),
      ],
    );
  }
}

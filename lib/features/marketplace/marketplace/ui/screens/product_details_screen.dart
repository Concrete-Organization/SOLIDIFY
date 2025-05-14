import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/core/widgets/custom_snack_bar.dart';
import 'package:solidify/features/marketplace/cart/logic/cart_cubit.dart';
import 'package:solidify/features/marketplace/cart/logic/cart_state.dart';
import 'package:solidify/features/marketplace/marketplace/ui/widgets/product_details_bloc_consumer.dart';
import 'package:solidify/features/marketplace/marketplace/logic/product_details_cubit/product_details_cubit.dart';
import 'package:solidify/features/marketplace/marketplace/logic/product_details_cubit/product_details_state.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late String _productId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is String) {
      _productId = args;
      context.read<ProductDetailsCubit>().getProductDetails(_productId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Details',
          style: TextStyles.font18MainSemiBold,
        ),
        actions: [
          IconButton(
            onPressed: () => context.pushNamed(Routes.cartScreen),
            icon: SvgPicture.asset('assets/svgs/cart_icon.svg'),
          ),
        ],
      ),
      body: ProductDetailsBlocConsumer(productId: _productId),
      bottomNavigationBar:
          BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
            child: state.when(
              initial: () => const SizedBox.shrink(),
              loading: (_) => const SizedBox.shrink(),
              success: (product) => BlocListener<CartCubit, CartState>(
                listener: (context, cartState) {
                  cartState.maybeWhen(
                    success: (productId) {
                      CustomSnackBar.showInfo(
                        context,
                        '${product.name} added to cart',
                      );
                    },
                    error: (productId, error) {
                      CustomSnackBar.showInfo(
                        context,
                        'Error: ${error.message}',
                      );
                    },
                    orElse: () {},
                  );
                },
                child: AppTextButton(
                  onPressed: () => _addToCart(context, product.id),
                  textButton: 'Add to cart',
                ),
              ),
              error: (productId, error) => const SizedBox.shrink(),
            ),
          );
        },
      ),
    );
  }

  void _addToCart(BuildContext context, String productId) {
    context.read<CartCubit>().addCartItem(productId);
  }
}

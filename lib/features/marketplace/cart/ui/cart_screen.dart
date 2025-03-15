import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/core/widgets/error_state_message.dart';
import 'package:solidify/core/widgets/loading_circle_indicator.dart';
import 'package:solidify/features/marketplace/cart/logic/cart_cubit.dart';
import 'package:solidify/features/marketplace/cart/logic/cart_state.dart';
import 'package:solidify/features/marketplace/cart/ui/widgets/cart_list_view.dart';
import 'package:solidify/features/marketplace/cart/data/models/get_cart_response_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double totalPrice = 0;

  void _updateTotalPrice(double priceChange) {
    setState(() {
      totalPrice += priceChange;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset('assets/svgs/back_arrow.svg'),
        ),
        title: Text(
          'Cart List',
          style: TextStyles.font18MainSemiBold,
        ),
      ),
      body: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          state.whenOrNull(
            cartListError: (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${error.message}')),
              );
            },
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () {
              context.read<CartCubit>().getCartItems();
              return const Center(child: CircularProgressIndicator());
            },
            cartLoading: () => LoadingCircleIndicator(),
            cartListSuccess: (cartResponse) {
              // Initialize total price with the sum of all items' prices
              if (totalPrice == 0) {
                totalPrice = cartResponse.model.items.fold(
                  0,
                  (sum, item) => sum + item.price,
                );
              }
              return _buildCartContent(
                context,
                cartResponse.model.items,
                totalPrice,
              );
            },
            cartListError: (error) => SliverToBoxAdapter(
              child: ErrorStateMessage(
                message: 'Error: ${error.message}',
              ),
            ),
            loading: (_) => const SizedBox.shrink(),
            success: (_) => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _buildCartContent(
    BuildContext context,
    List<CartItemModel> items,
    double total,
  ) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CartListView(
              items: items,
              onPriceUpdated:
                  _updateTotalPrice, // Pass callback to update total price
            ),
            verticalSpace(10),
            Text(
              'Total',
              style: TextStyles.font20MainLightBlack,
            ),
            verticalSpace(15),
            Text(
              '${total.toStringAsFixed(2)} EGP', // Display updated total price
              style: TextStyles.font15MainBlueSemiBold,
            ),
            verticalSpace(15),
            AppTextButton(
              onPressed: () {
                context.pushNamed(Routes.addressDetailsScreen);
              },
              textButton: 'Place Order',
            ),
          ],
        ),
      ),
    );
  }
}

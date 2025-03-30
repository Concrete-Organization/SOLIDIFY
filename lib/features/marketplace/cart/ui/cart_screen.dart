import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/custom_snack_bar.dart';
import 'package:solidify/core/widgets/error_state_message.dart';
import 'package:solidify/core/widgets/loading_circle_indicator.dart';
import 'package:solidify/features/marketplace/cart/logic/cart_cubit.dart';
import 'package:solidify/features/marketplace/cart/logic/cart_state.dart';
import 'package:solidify/features/marketplace/cart/ui/widgets/cart_content.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double totalPrice = 0;
  bool _isDeleting = false;

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
              CustomSnackBar.showError(
                context,
                'Error: ${error.message}',
              );
            },
            cartItemDeleted: (productId, productName) {
              CustomSnackBar.showInfo(
                context,
                '$productName removed from cart',
              );
              context.read<CartCubit>().getCartItems();
              setState(() {
                _isDeleting = false;
              });
            },
          );
        },
        builder: (context, state) {
          if (_isDeleting) {
            return LoadingCircleIndicator();
          }
          return state.when(
            initial: () {
              context.read<CartCubit>().getCartItems();
              return LoadingCircleIndicator();
            },
            cartLoading: () => const LoadingCircleIndicator(),
            cartListSuccess: (cartResponse) {
              if (totalPrice == 0) {
                totalPrice = cartResponse.model.items.fold(
                  0,
                  (sum, item) => sum + (item.price * item.quantity),
                );
              }
              return CartContent(
                items: cartResponse.model.items,
                total: totalPrice,
                onPriceUpdated: _updateTotalPrice,
              );
            },
            cartListError: (error) => ErrorStateMessage(
              message: 'Error: ${error.message}',
            ),
            cartItemDeleted: (_, __) {
              return const LoadingCircleIndicator();
            },
            loading: (_) => const SizedBox.shrink(),
            success: (_) => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}

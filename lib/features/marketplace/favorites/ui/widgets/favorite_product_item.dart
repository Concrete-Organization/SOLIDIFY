import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/core/theming/font_weight_helper.dart';
import 'package:solidify/core/widgets/custom_snack_bar.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/core/widgets/loading_circle_indicator.dart';
import 'package:solidify/features/marketplace/cart/logic/cart_cubit.dart';
import 'package:solidify/features/marketplace/cart/logic/cart_state.dart';
import 'package:solidify/features/marketplace/favorites/domain/product_entity.dart';
import 'package:solidify/features/marketplace/favorites/logic/favorites_provider.dart';

class FavoriteProductItem extends StatefulWidget {
  final ProductEntity product;

  const FavoriteProductItem({super.key, required this.product});

  @override
  State<FavoriteProductItem> createState() => _FavoriteProductItemState();
}

class _FavoriteProductItemState extends State<FavoriteProductItem> {
  String? _currentProductId;
  bool _localLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: _cartStateListener,
      builder: (context, state) {
        final favoritesProvider = Provider.of<FavoritesProvider>(context);
        final isLoading =
            state is CartLoading && state.productId == widget.product.id;

        return GestureDetector(
          onTap: () {
            context.pushNamed(
              Routes.productDetailsScreen,
              arguments: widget.product.id,
            );
          },
          child: Card(
            margin: EdgeInsets.zero,
            color: ColorsManager.white,
            elevation: 4,
            shape: _buildCardShape(),
            child: Column(
              children: [
                _buildProductHeader(favoritesProvider),
                _buildProductImage(),
                const HorizontalDivider(),
                _buildProductDetails(isLoading),
              ],
            ),
          ),
        );
      },
    );
  }

  void _cartStateListener(BuildContext context, CartState state) {
    state.maybeWhen(
      error: (productId, error) {
        if (productId == widget.product.id &&
            _currentProductId == productId &&
            !_localLoading) {
          _showErrorSnackBar(context, error.message);
          _currentProductId = null;
        }
      },
      success: (productId) {
        if (productId == widget.product.id) {
          _showSuccessSnackBar(context);
          _currentProductId = null;
        }
      },
      orElse: () {},
    );
  }

  RoundedRectangleBorder _buildCardShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: const BorderSide(
        color: ColorsManager.mainBlue,
        width: 1,
      ),
    );
  }

  Widget _buildProductHeader(FavoritesProvider favoritesProvider) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        _buildDiscountBadge(),
        _buildFavoriteButton(favoritesProvider),
      ],
    );
  }

  Widget _buildDiscountBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: const BoxDecoration(
        color: ColorsManager.secondaryGold,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(2),
          bottomRight: Radius.circular(2),
        ),
      ),
      child: Text(
        '${widget.product.discount}%',
        style: TextStyles.font10MainBlueRegular,
      ),
    );
  }

  Widget _buildFavoriteButton(FavoritesProvider favoritesProvider) {
    return Align(
      alignment: Alignment.centerRight,
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: const Icon(
          Icons.favorite,
          color: ColorsManager.secondaryGold,
          size: 22,
        ),
        onPressed: () => favoritesProvider.toggleFavorite(widget.product),
      ),
    );
  }

  Widget _buildProductImage() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: SizedBox(
        width: 68,
        height: 92,
        child: Image.network(
          widget.product.imageUri,
          fit: BoxFit.contain,
          errorBuilder: (_, __, ___) => const Icon(Icons.error),
        ),
      ),
    );
  }

  Widget _buildProductDetails(bool isLoading) {
    return Expanded(
      child: Container(
        decoration: _buildDetailsDecoration(),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildBrandRow(),
            Text(
              widget.product.name,
              style: TextStyles.font12lightBlackLight,
            ),
            Text(
              '${widget.product.price} EGP',
              style: TextStyles.font12MainBlueSemiBold,
            ),
            _buildAddToCartButton(isLoading),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildDetailsDecoration() {
    return BoxDecoration(
      color: ColorsManager.mainBlueWith1Opacity,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
    );
  }

  Widget _buildBrandRow() {
    return Row(
      children: [
        Text(
          widget.product.brandName.length > 15
              ? '${widget.product.brandName.substring(0, 15)}...'
              : widget.product.brandName,
          style: TextStyles.font12lightBlackLight,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const Spacer(),
        const Icon(
          Icons.star,
          color: ColorsManager.secondaryGold,
          size: 16,
        ),
        const SizedBox(width: 4),
        Text(
          widget.product.rate.toString(),
          style: TextStyles.font12MainBlueMedium,
        ),
      ],
    );
  }

  Widget _buildAddToCartButton(bool isLoading) {
    return isLoading || _localLoading
        ? LoadingCircleIndicator()
        : AppTextButton(
            height: 34,
            borderRadius: 10,
            textButton: 'Add to cart',
            fontSize: 12,
            fontWeight: FontWeightHelper.medium,
            onPressed: () => _addToCart(context),
            backgroundColor: ColorsManager.mainBlue,
            padding: EdgeInsets.zero,
          );
  }

  void _addToCart(BuildContext context) async {
    if (_localLoading) return;

    setState(() => _localLoading = true);
    _currentProductId = widget.product.id;

    try {
      context.read<CartCubit>().addCartItem(widget.product.id);
    } finally {
      if (mounted) setState(() => _localLoading = false);
    }
  }

  void _showSuccessSnackBar(BuildContext context) {
    CustomSnackBar.showInfo(
      context,
      '${widget.product.name} added to cart',
    );
  }

  void _showErrorSnackBar(BuildContext context, String? message) {
    CustomSnackBar.showError(
      context,
      'Error: $message',
    );
  }
}


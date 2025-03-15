import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/core/theming/font_weight_helper.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/marketplace/cart/logic/cart_cubit.dart';
import 'package:solidify/features/marketplace/cart/logic/cart_state.dart';
import 'package:solidify/features/marketplace/favorites/logic/favorites_provider.dart';
import 'package:solidify/features/marketplace/marketplace/data/models/product_list_response_model.dart';

class ProductGridViewItem extends StatefulWidget {
  final Product product;
  final int index;

  const ProductGridViewItem({
    super.key,
    required this.product,
    required this.index,
  });

  @override
  State<ProductGridViewItem> createState() => _ProductGridViewItemState();
}

class _ProductGridViewItemState extends State<ProductGridViewItem> {
  String? _currentProductId;
  bool _localLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        state.maybeWhen(
          error: (productId, error) {
            if (productId == widget.product.id &&
                _currentProductId == productId &&
                !_localLoading) {
              _showErrorSnackbar(context, error.message);
              _currentProductId = null;
            }
          },
          success: (productId) {
            if (productId == widget.product.id) {
              _showSuccessSnackbar(context);
              _currentProductId = null;
            }
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        final favoritesProvider = Provider.of<FavoritesProvider>(context);
        final productEntity =
            widget.product.toEntity(); // Convert to ProductEntity
        final isFavorite = favoritesProvider.isFavorite(productEntity.id);
        final isLoading =
            state is CartLoading && state.productId == widget.product.id;

        return Card(
          margin: EdgeInsets.zero,
          color: ColorsManager.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
            side: BorderSide(
              color: ColorsManager.mainBlue,
              width: 1.w,
            ),
          ),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: ColorsManager.secondaryGold,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(2.r),
                        bottomRight: Radius.circular(2.r),
                      ),
                    ),
                    child: Text(
                      '${widget.product.discount}%',
                      style: TextStyles.font10MainBlueRegular,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite
                            ? ColorsManager.secondaryGold
                            : ColorsManager.mainBlue,
                        size: 22.w,
                      ),
                      onPressed: () {
                        favoritesProvider
                            .toggleFavorite(productEntity); // Use ProductEntity
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: SizedBox(
                  width: 68.w,
                  height: 92.h,
                  child: Image.network(
                    widget.product.imageUri,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => const Icon(Icons.error),
                  ),
                ),
              ),
              const HorizontalDivider(),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorsManager.mainBlueWith1Opacity,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 8.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.product.brandName,
                            style: TextStyles.font12lightBlackLight,
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.star,
                            color: ColorsManager.secondaryGold,
                            size: 16,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            widget.product.rate.toString(),
                            style: TextStyles.font12MainBlueMedium,
                          ),
                        ],
                      ),
                      Text(
                        widget.product.name,
                        style: TextStyles.font12lightBlackLight,
                      ),
                      Text(
                        '${widget.product.price} EGP',
                        style: TextStyles.font12MainBlueSemiBold,
                      ),
                      isLoading || _localLoading
                          ? const Center(
                              child: SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                            )
                          : AppTextButton(
                              height: 34.h,
                              borderRadius: 10.r,
                              textButton: 'Add to cart',
                              fontSize: 12.sp,
                              fontWeight: FontWeightHelper.medium,
                              onPressed: () => _addToCart(context),
                              backgroundColor: ColorsManager.mainBlue,
                              padding: EdgeInsets.zero,
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _addToCart(BuildContext context) async {
    if (_localLoading) return;

    setState(() => _localLoading = true);
    _currentProductId = widget.product.id;

    try {
      final cubit = context.read<CartCubit>();
      final productId = widget.product.id;

      cubit.addCartItem(productId);
    } finally {
      if (mounted) setState(() => _localLoading = false);
    }
  }

  void _showSuccessSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.product.name} added to cart'),
        backgroundColor: ColorsManager.mainBlue,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showErrorSnackbar(BuildContext context, String? message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error: $message'),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

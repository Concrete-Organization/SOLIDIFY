import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/core/theming/font_weight_helper.dart';
import 'package:solidify/core/widgets/custom_snack_bar.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/marketplace/cart/logic/cart_cubit.dart';
import 'package:solidify/features/marketplace/cart/logic/cart_state.dart';
import 'package:solidify/features/marketplace/favorites/logic/favorites_provider.dart';
import 'package:solidify/features/marketplace/marketplace/data/models/get_products_by_category_response_model.dart';

class CategoryProductGridViewItem extends StatefulWidget {
  final ProductModel product;
  final bool isCached;

  const CategoryProductGridViewItem({
    super.key,
    required this.product,
    required this.isCached,
  });

  @override
  State<CategoryProductGridViewItem> createState() =>
      _CategoryProductGridViewItemState();
}

class _CategoryProductGridViewItemState
    extends State<CategoryProductGridViewItem> {
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
      },
      builder: (context, state) {
        final favoritesProvider = Provider.of<FavoritesProvider>(context);
        final productEntity = widget.product.toEntity();
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
                        favoritesProvider.toggleFavorite(productEntity);
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
                            widget.product.brandName ?? '',
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

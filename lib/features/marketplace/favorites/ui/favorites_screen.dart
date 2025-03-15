import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/core/theming/font_weight_helper.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/marketplace/favorites/domain/product_entity.dart';
import 'package:solidify/features/marketplace/favorites/logic/favorites_provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorites',
          style: TextStyles.font18MainSemiBold,
        ),
      ),
      body: Consumer<FavoritesProvider>(
        builder: (context, favoritesProvider, _) {
          final favoriteProducts = favoritesProvider.favoriteProducts;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: favoriteProducts.isEmpty
                ? _buildEmptyFavorites()
                : _buildFavoritesGrid(favoriteProducts, context),
          );
        },
      ),
    );
  }

  Widget _buildEmptyFavorites() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border,
            size: 64.w,
            color: ColorsManager.mainBlue,
          ),
          SizedBox(height: 16.h),
          Text(
            'No favorites yet',
            style: TextStyles.font15lightBlackRegular,
          ),
        ],
      ),
    );
  }

  Widget _buildFavoritesGrid(
      List<ProductEntity> favoriteProducts, BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 0.6,
      ),
      itemCount: favoriteProducts.length,
      itemBuilder: (context, index) {
        final product = favoriteProducts[index];
        return _buildProductItem(product, context);
      },
    );
  }

  Widget _buildProductItem(ProductEntity product, BuildContext context) {
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
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: ColorsManager.secondaryGold,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(2.r),
                    bottomRight: Radius.circular(2.r),
                  ),
                ),
                child: Text(
                  '${product.discount}%',
                  style: TextStyles.font10MainBlueRegular,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.favorite,
                    color: ColorsManager.secondaryGold,
                    size: 22,
                  ),
                  onPressed: () {
                    final favoritesProvider =
                        Provider.of<FavoritesProvider>(context, listen: false);
                    favoritesProvider.toggleFavorite(product);
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
                product.imageUri,
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
                        product.brandName,
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
                        product.rate.toString(),
                        style: TextStyles.font12MainBlueMedium,
                      ),
                    ],
                  ),
                  Text(
                    product.name,
                    style: TextStyles.font12lightBlackLight,
                  ),
                  Text(
                    '${product.price} EGP',
                    style: TextStyles.font12MainBlueSemiBold,
                  ),
                  AppTextButton(
                    height: 34.h,
                    borderRadius: 10.r,
                    textButton: 'Add to cart',
                    fontSize: 12.sp,
                    fontWeight: FontWeightHelper.medium,
                    onPressed: () {
                      // Add to cart logic
                    },
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
  }
}

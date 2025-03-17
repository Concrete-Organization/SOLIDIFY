import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/features/marketplace/favorites/domain/product_entity.dart';
import 'package:solidify/features/marketplace/favorites/logic/favorites_provider.dart';
import 'package:solidify/features/marketplace/favorites/ui/widgets/favorites_empty.dart';
import 'package:solidify/features/marketplace/favorites/ui/widgets/favorite_product_item.dart';

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
        leading: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: SvgPicture.asset('assets/svgs/back_arrow.svg'),
        ),
      ),
      body: Consumer<FavoritesProvider>(
        builder: (context, favoritesProvider, _) {
          final favoriteProducts = favoritesProvider.favoriteProducts;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: favoriteProducts.isEmpty
                ? const FavoritesEmpty()
                : _buildFavoritesGrid(favoriteProducts),
          );
        },
      ),
    );
  }

  Widget _buildFavoritesGrid(List<ProductEntity> favoriteProducts) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 12,
        childAspectRatio: 0.6,
      ),
      itemCount: favoriteProducts.length,
      itemBuilder: (context, index) {
        return FavoriteProductItem(product: favoriteProducts[index]);
      },
    );
  }
}

import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/di/dependency_injection.dart';
import 'package:solidify/features/marketplace/cart/logic/cart_cubit.dart';
import 'package:solidify/features/marketplace/favorites/logic/favorites_provider.dart';
import 'package:solidify/features/marketplace/marketplace/ui/widgets/product_grid_view_item.dart';
import 'package:solidify/features/marketplace/marketplace/data/models/product_list_response_model.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CartCubit>(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset('assets/svgs/back_arrow.svg'),
          ),
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
                  : _buildFavoritesGrid(favoriteProducts),
            );
          },
        ),
      ),
    );
  }

  Widget _buildEmptyFavorites() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border,
              size: 64.w, color: ColorsManager.mainBlue),
          SizedBox(height: 16.h),
          Text(
            'No favorites yet',
            style: TextStyles.font15lightBlackRegular,
          ),
        ],
      ),
    );
  }

  Widget _buildFavoritesGrid(List<Product> favoriteProducts) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 0.6,
      ),
      itemCount: favoriteProducts.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.pushNamed(
              Routes.productDetailsScreen,
              arguments: favoriteProducts[index].id,
            );
          },
          child: ProductGridViewItem(
            product: favoriteProducts[index],
            index: index,
          ),
        );
      },
    );
  }
}

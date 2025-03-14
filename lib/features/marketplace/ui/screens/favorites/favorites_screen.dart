import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/di/dependency_injection.dart'; // Add this import
import 'package:solidify/features/marketplace/data/models/product_list_response_model.dart';
import 'package:solidify/features/marketplace/ui/screens/favorites/logic/favroites_provider.dart';
import 'package:solidify/features/marketplace/logic/cart_cubit/cart_cubit.dart'; // Add this import
import 'package:solidify/features/marketplace/ui/screens/marketplace/widgets/product_grid_view_item.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Provide the CartCubit here
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
            // Get the list of favorite products directly from the provider
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

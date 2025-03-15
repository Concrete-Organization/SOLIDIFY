import 'package:flutter/material.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';

class FavoritesEmpty extends StatelessWidget {
  const FavoritesEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.favorite_border,
            size: 64,
            color: ColorsManager.mainBlue,
          ),
          const SizedBox(height: 16),
          Text(
            'No favorites yet',
            style: TextStyles.font15lightBlackRegular,
          ),
        ],
      ),
    );
  }
}

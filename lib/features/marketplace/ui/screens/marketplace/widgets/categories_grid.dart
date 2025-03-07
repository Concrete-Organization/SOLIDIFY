import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesGrid extends StatefulWidget {
  const CategoriesGrid({super.key});

  @override
  State<CategoriesGrid> createState() => _CategoriesGridState();
}

class _CategoriesGridState extends State<CategoriesGrid>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  // Updated categories list includes an 'id' for each category.
  final List<Map<String, String>> categories = [
    {'id': '0', 'icon': 'assets/images/all_categories_icon.png', 'label': 'All'},
    {
      'id': '1',
      'icon': 'assets/images/coarse_aggregate.png',
      'label': 'Coarse Aggregate'
    },
    {'id': '2', 'icon': 'assets/images/cement_icon.png', 'label': 'Cement'},
    {'id': '3', 'icon': 'assets/images/blast.png', 'label': 'Blast'},
    {
      'id': '4',
      'icon': 'assets/images/superplasticizer_icon.png',
      'label': 'Superplasticizer'
    },
    {'id': '5', 'icon': 'assets/images/fly_ash.png', 'label': 'Fly Ash'},
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            categoryItem(0),
            categoryItem(1),
            categoryItem(2),
          ],
        ),
        verticalSpace(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            categoryItem(3),
            categoryItem(4),
            categoryItem(5),
          ],
        ),
      ],
    );
  }

  Widget categoryItem(int index) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });

        _controller.forward().then((_) {
          _controller.reverse().then((_) {
            final selectedCategory = categories[index]['label'];
            final categoryId = categories[index]['id'];
            // Pass both label and id (converted to int) as arguments
            context.pushNamed(
              Routes.productCategoryScreen,
              arguments: {
                'label': selectedCategory,
                'id': int.tryParse(categoryId ?? '0') ?? 0,
              },
            );
          });
        });
      },
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: isSelected ? _scaleAnimation.value : 1.0,
            child: Column(
              children: [
                Image.asset(
                  categories[index]['icon']!,
                  width: 55,
                  height: 55,
                ),
                verticalSpace(5),
                Text(
                  categories[index]['label']!,
                  style: TextStyles.font12MainBlueMedium.copyWith(
                    color: isSelected
                        ? ColorsManager.secondaryGold
                        : ColorsManager.mainBlue,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

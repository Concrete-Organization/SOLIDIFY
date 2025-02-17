import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/marketplace/ui/screens/marketplace/widgets/product_grid_view.dart';
import 'package:solidify/features/marketplace/ui/screens/marketplace/widgets/product_search_bar.dart';

class ProductCategoryScreen extends StatelessWidget {
  const ProductCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;

    String categoryLabel = 'Material';
    if (args != null && args is Map<String, dynamic>) {
      categoryLabel = args['label'] ?? 'Material';
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            child: SvgPicture.asset('assets/svgs/cart_icon.svg'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: GestureDetector(
              child: SvgPicture.asset('assets/svgs/list_icon.svg'),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    verticalSpace(5),
                    const HorizontalDivider(),
                    verticalSpace(21),
                    const ProductSearchBar(),
                    verticalSpace(15),
                    Text(
                      categoryLabel,
                      style: TextStyles.font24lightBlackMedium,
                    ),
                    verticalSpace(15),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              sliver: const ProductGridView(),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/marketplace/ui/screens/marketplace/widgets/product_text_column.dart';
import 'package:solidify/features/marketplace/ui/screens/marketplace/widgets/review_card_list_view.dart';
import 'package:solidify/features/marketplace/ui/screens/marketplace/widgets/product_stack_for_details_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Details',
          style: TextStyles.font18MainSemiBold,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/svgs/cart_icon.svg'),
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: verticalSpace(5)),
            const SliverToBoxAdapter(child: HorizontalDivider()),
            SliverToBoxAdapter(child: verticalSpace(20)),
            const SliverToBoxAdapter(
              child: ProductStackForDetailsScreen(),
            ),
            SliverToBoxAdapter(child: verticalSpace(20)),
            const SliverToBoxAdapter(child: HorizontalDivider()),
            SliverToBoxAdapter(child: verticalSpace(24)),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              sliver: const SliverToBoxAdapter(child: ProductTextColumn()),
            ),
            SliverToBoxAdapter(child: verticalSpace(14)),
            const ReviewCardListView(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
        child: AppTextButton(
          onPressed: () {},
          textButton: 'Add to cart',
        ),
      ),
    );
  }
}

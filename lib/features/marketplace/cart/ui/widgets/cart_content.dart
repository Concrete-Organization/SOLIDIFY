import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/features/marketplace/cart/ui/widgets/cart_list_view.dart';
import 'package:solidify/features/marketplace/cart/data/models/get_cart_response_model.dart';

class CartContent extends StatelessWidget {
  final List<CartItemModel> items;
  final double total;
  final ValueChanged<double> onPriceUpdated;

  const CartContent({
    super.key,
    required this.items,
    required this.total,
    required this.onPriceUpdated,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: items.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.remove_shopping_cart_outlined,
                    size: 70,
                    color: Colors.grey,
                  ),
                  verticalSpace(20),
                  Text(
                    'No Items Added to Cart',
                    style: TextStyles.font16lightBlackRegular.copyWith(
                        color: ColorsManager.lightBlack.withValues(alpha: 0.7)),
                  ),
                ],
              ),
            )
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CartListView(
                      items: items,
                      onPriceUpdated: onPriceUpdated,
                      onItemDeleted: (itemId) {
                        final deletedItem =
                            items.firstWhere((item) => item.id == itemId);
                        onPriceUpdated(
                            -(deletedItem.price * deletedItem.quantity));
                      },
                    ),
                    Text(
                      'Total',
                      style: TextStyles.font20MainLightBlack,
                    ),
                    verticalSpace(15),
                    Text(
                      '${total.toStringAsFixed(2)} EGP',
                      style: TextStyles.font15MainBlueSemiBold,
                    ),
                    verticalSpace(15),
                    AppTextButton(
                      onPressed: () {
                        context.pushNamed(Routes.addressDetailsScreen);
                      },
                      textButton: 'Place Order',
                    ),
                    verticalSpace(36),
                  ],
                ),
              ),
            ),
    );
  }
}

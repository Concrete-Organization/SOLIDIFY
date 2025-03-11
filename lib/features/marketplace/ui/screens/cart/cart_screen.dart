import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart';
import 'package:solidify/features/marketplace/ui/screens/cart/widgets/cart_list_view.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset('assets/svgs/back_arrow.svg'),
        ),
        title: Text(
          'Cart list',
          style: TextStyles.font18MainSemiBold,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CartListView(),
              verticalSpace(10),
              Text(
                'Total',
                style: TextStyles.font20MainLightBlack,
              ),
              verticalSpace(15),
              Text(
                '7,900 EGP',
                style: TextStyles.font15MainBlueSemiBold,
              ),
              verticalSpace(15),
              AppTextButton(
                  onPressed: () {
                    context.pushNamed(Routes.addressDetailsScreen);
                  },
                  textButton: 'Place Order')
            ],
          ),
        ),
      ),
    );
  }
}

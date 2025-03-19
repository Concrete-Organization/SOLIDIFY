import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/profile_company/ui/widgets/profile_top_bar.dart';
import 'package:solidify/features/profile_company/ui/widgets/order_list_view.dart';
import 'package:solidify/features/profile_company/ui/widgets/selected_order_container.dart';

class ProfileCompanyScreen extends StatelessWidget {
  const ProfileCompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: 1.sw,
                height: 800.h,
                margin: EdgeInsets.only(top: 852.h),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFF5F1E9).withOpacity(0.9),
                      Color(0xFFEDE1D4).withOpacity(0.9),
                    ],
                    stops: const [0.0, 1.0],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProfileTopBar(),
                  verticalSpace(10),
                  HorizontalDivider(
                    color: ColorsManager.mainBlueWith50Opacity,
                  ),
                  verticalSpace(20),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
                    child: Center(
                      child: Column(
                        children: [
                          const SelectedOrderContainer(),
                          verticalSpace(30),
                          const OrderListView(itemsToShow: 2),
                          verticalSpace(35),
                          GestureDetector(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    context.pushNamed(Routes.ordersListScreen);
                                  },
                                  child: Text(
                                    'Show All',
                                    style: TextStyles.font12MainBlueMedium,
                                  ),
                                ),
                                horizontalSpace(10),
                                SvgPicture.asset(
                                    'assets/svgs/see_all_arrow.svg')
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

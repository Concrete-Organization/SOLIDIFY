import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/di/dependency_injection.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/marketplace/logic/cart_cubit/cart_cubit.dart';
import 'package:solidify/features/marketplace/ui/screens/marketplace/widgets/categories_grid.dart';
import 'package:solidify/features/marketplace/ui/screens/marketplace/widgets/market_place_app_bar.dart';
import 'package:solidify/features/marketplace/ui/screens/marketplace/widgets/available_now_containers.dart';
import 'package:solidify/features/marketplace/ui/screens/marketplace/widgets/market_place_bloc_builder.dart';

class MarketplaceScreen extends StatelessWidget {
  const MarketplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<CartCubit>()),
      ],
      child: Scaffold(
        appBar: const MarketPlaceAppBar(),
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
                      verticalSpace(19),
                      const AvailableNowContainers(),
                      Row(
                        children: [
                          Text(
                            'Categories',
                            style: TextStyles.font15lightBlackSemiBold,
                          ),
                          const Spacer(),
                          Text(
                            'View All',
                            style: TextStyles.font13MainBlueMedium,
                          ),
                        ],
                      ),
                      verticalSpace(20),
                      const CategoriesGrid(),
                      verticalSpace(26),
                      const HorizontalDivider(),
                      verticalSpace(20),
                      Row(
                        children: [
                          Text(
                            'Best sellers',
                            style: TextStyles.font15lightBlackSemiBold,
                          ),
                          const Spacer(),
                          Text(
                            'View All',
                            style: TextStyles.font13MainBlueMedium,
                          ),
                        ],
                      ),
                      verticalSpace(10),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                sliver: const MarketplaceBlocBuilder(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

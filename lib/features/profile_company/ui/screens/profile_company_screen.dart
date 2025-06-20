import 'dart:ui';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/widgets/custom_snack_bar.dart';
import 'package:solidify/core/widgets/profile_top_bar.dart';
import 'package:solidify/core/widgets/custom_tab_toggle.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/core/widgets/custom_profile_drawer.dart';
import 'package:solidify/features/profile_company/ui/widgets/order_list_view.dart';
import 'package:solidify/features/marketplace/order/logic/order_cubit/order_cubit.dart';
import 'package:solidify/features/marketplace/order/logic/order_cubit/order_state.dart';

class ProfileCompanyScreen extends StatefulWidget {
  const ProfileCompanyScreen({super.key});

  @override
  State<ProfileCompanyScreen> createState() => _ProfileCompanyScreenState();
}

class _ProfileCompanyScreenState extends State<ProfileCompanyScreen> {
  int _currentTabIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isDrawerOpen = false;

  static const Map<String, int> _statusMap = {
    'pending': 0,
    'completed': 1,
  };

  @override
  void initState() {
    super.initState();
    context.read<OrderCubit>().getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomProfileDrawer(),
      onDrawerChanged: (isOpen) {
        setState(() {
          _isDrawerOpen = isOpen;
        });
      },
      drawerScrimColor: Colors.transparent,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: BlocBuilder<OrderCubit, OrderState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      verticalSpace(13),
                      ProfileTopBar(
                        scaffoldKey: _scaffoldKey,
                      ),
                      verticalSpace(10),
                      HorizontalDivider(
                        color: ColorsManager.mainBlueWith50Opacity,
                      ),
                      verticalSpace(20),
                      Column(
                        children: [
                          verticalSpace(37),
                          CustomTabToggle(
                            tabs: const ['Active Orders', 'Completed Orders'],
                            onTabSelected: (index) {
                              setState(() {
                                _currentTabIndex = index;
                              });
                            },
                          ),
                          verticalSpace(25),
                          state.maybeWhen(
                            getOrdersLoading: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            getOrdersSuccess: (response) {
                              final filteredOrders = response.model.items
                                  .where((order) {
                                final status = order.orderStatus.toLowerCase();
                                return _statusMap[status] == _currentTabIndex;
                              }).toList()
                                ..sort((a, b) =>
                                    b.orderDate.compareTo(a.orderDate));

                              if (filteredOrders.isEmpty) {
                                return const Center(
                                  child: Text('No orders available yet'),
                                );
                              }

                              return OrderListView(
                                itemsToShow: 2,
                                orders: filteredOrders,
                              );
                            },
                            getOrdersError: (error) => Center(
                              child: Text('Error: ${error.message}'),
                            ),
                            orElse: () => const Center(
                              child: Text('No orders available yet'),
                            ),
                          ),
                          verticalSpace(35),
                          GestureDetector(
                            onTap: () {
                              state.maybeWhen(
                                getOrdersSuccess: (response) {
                                  context.pushNamed(
                                    Routes.ordersListScreen,
                                    arguments: response.model.items,
                                  );
                                },
                                orElse: () {
                                  CustomSnackBar.showInfo(context, 'No orders to show');
                                },
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Show All',
                                  style: TextStyles.font12MainBlueMedium,
                                ),
                                horizontalSpace(10),
                                SvgPicture.asset(
                                  'assets/svgs/see_all_arrow.svg',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          if (_isDrawerOpen)
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withValues(alpha: 0.2),
              ),
            ),
        ],
      ),
    );
  }
}

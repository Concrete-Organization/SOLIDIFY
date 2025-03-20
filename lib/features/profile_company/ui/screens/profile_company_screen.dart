import 'dart:ui';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/widgets/custom_profile_drawer.dart';
import 'package:solidify/core/widgets/custom_tab_toggle.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/core/widgets/profile_top_bar.dart';
import 'package:solidify/features/profile_company/ui/widgets/order_list_view.dart';

class ProfileCompanyScreen extends StatefulWidget {
  const ProfileCompanyScreen({super.key});

  @override
  State<ProfileCompanyScreen> createState() => _ProfileCompanyScreenState();
}

class _ProfileCompanyScreenState extends State<ProfileCompanyScreen> {
  int _currentTabIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomProfileDrawer(),
      onDrawerChanged: (isOpen) {
        setState(() {
          _isDrawerOpen = isOpen;
        });
      },
      drawerScrimColor: Colors.transparent, // اجعل الخلفية شفافة لرؤية البلور
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
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
                        tabs: const ['Active orders', 'Completed orders'],
                        onTabSelected: (index) {
                          setState(() {
                            _currentTabIndex = index;
                          });
                        },
                      ),
                      verticalSpace(25),
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
                              'assets/svgs/see_all_arrow.svg',
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (_isDrawerOpen)
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0.2), // إضافة تأثير شفافية خفيف
              ),
            ),
        ],
      ),
    );
  }
}

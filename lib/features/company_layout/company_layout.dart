import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/features/chatbot/ui/chatbot_screen.dart';
import 'package:solidify/features/profile/ui/profile_screen.dart';
import 'package:solidify/features/concrete_strength/ui/concrete_strength_screen.dart';
import 'package:solidify/features/marketplace/ui/screens/marketplace/screens/marketplace_screen.dart';

class CompanyLayout extends StatefulWidget {
  const CompanyLayout({super.key});

  @override
  State<CompanyLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<CompanyLayout> {
  int selectedIndex = 0;
  List<Widget> screens = [
    const MarketplaceScreen(),
    const ConcreteStrengthScreen(),
    const ChatbotScreen(),
    const ProfileScreen(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: ColorsManager.mainBlueWith5Opacity,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.r),
            topRight: Radius.circular(40.r),
          ),
          border: const Border(
            top: BorderSide(
              color: ColorsManager.mainBlue,
              width: .8,
            ),
          ),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: ColorsManager.secondaryGold,
          unselectedItemColor: ColorsManager.mainBlue,
          selectedLabelStyle: TextStyles.font13MainBlueMedium,
          unselectedLabelStyle: TextStyles.font13MainBlueMedium,
          onTap: onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svgs/home.svg',
                colorFilter: ColorFilter.mode(
                  selectedIndex == 0
                      ? ColorsManager.secondaryGold
                      : ColorsManager.mainBlue,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Market',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svgs/ai.svg',
                colorFilter: ColorFilter.mode(
                  selectedIndex == 1
                      ? ColorsManager.secondaryGold
                      : ColorsManager.mainBlue,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Ai',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svgs/chatbot_icon.svg',
                colorFilter: ColorFilter.mode(
                  selectedIndex == 2
                      ? ColorsManager.secondaryGold
                      : ColorsManager.mainBlue,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Chatbot',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svgs/profile_icon.svg',
                colorFilter: ColorFilter.mode(
                  selectedIndex == 3
                      ? ColorsManager.secondaryGold
                      : ColorsManager.mainBlue,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTopBar extends StatefulWidget {
  const ProfileTopBar({super.key});

  @override
  State<ProfileTopBar> createState() => _ProfileTopBarState();
}

class _ProfileTopBarState extends State<ProfileTopBar> {
  bool _isMenuOpen = false;
  OverlayEntry? _overlayEntry;

  void _showPopupMenu() {
    setState(() => _isMenuOpen = true);

    final overlayState = Overlay.of(context);

    _overlayEntry = OverlayEntry(
      builder: (context) => Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            // Semi-transparent overlay to dim the screen
            Positioned.fill(
              child: GestureDetector(
                onTap: _closeMenu,
                child: Container(
                  color: Colors.black.withOpacity(0.3), // Dimmed layer
                ),
              ),
            ),
            // Menu items without a solid background
            Positioned(
              top: 60.h,
              left: 20.w,
              child: Container(
                width: 240.w, // Constrain the width to fix layout issues
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Padding(
                      padding:
                          EdgeInsets.only(left: 16.w, top: 8.h, bottom: 16.h),
                      child: Text('More info and support',
                          style: TextStyles.font12lightBlackRegular),
                    ),
                    _buildMenuItem(
                      iconPath: 'assets/svgs/about_icon.svg',
                      text: 'About',
                      style: TextStyles.font15lightBlackMedium.copyWith(
                        height: 1.5, // Apply the 1.5x height
                        decoration: TextDecoration.none,
                        decorationColor: const Color(0xFF1D1B20), // #1D1B20
                      ),
                      onTap: () => _handleNavigation(Routes.aboutScreen),
                    ),
                    _buildMenuItem(
                      iconPath: 'assets/svgs/help_icon.svg',
                      text: 'Help',
                      style: TextStyles.font15lightBlackMedium.copyWith(
                        height: 1.5,
                        decoration: TextDecoration.none,
                        decorationColor: const Color(0xFF1D1B20),
                      ),
                      onTap: () => _handleNavigation(Routes.helpScreen),
                    ),
                    _buildMenuItem(
                      iconPath: 'assets/svgs/privacy_policy_icon.svg',
                      text: 'Privacy Policy',
                      style: TextStyles.font15lightBlackMedium.copyWith(
                        height: 1.5,
                        decoration: TextDecoration.none,
                        decorationColor: const Color(0xFF1D1B20),
                      ),
                      onTap: () =>
                          _handleNavigation(Routes.privacyPolicyScreen),
                    ),
                    _buildTextItem(
                      text: 'Login',
                      style: TextStyles.font12lightBlackRegular.copyWith(
                        height: 1.5,
                        decoration: TextDecoration.none,
                        decorationColor: const Color(0xFF1D1B20),
                      ),
                      onTap: () => _handleNavigation(Routes.loginScreen),
                    ),
                    _buildTextItem(
                      text: 'Add account',
                      style: TextStyles.font15MainBlueMedium.copyWith(
                        height: 1.5,
                        decoration: TextDecoration.none,
                        decorationColor: const Color(0xFF1D1B20),
                      ),
                      onTap: () => _handleNavigation(Routes.addAccountScreen),
                    ),
                    _buildMenuItem(
                      iconPath: 'assets/svgs/log_out_icon.svg',
                      text: 'Log Out',
                      style: TextStyles.font15RedMedium.copyWith(
                        height: 1.5,
                        decoration: TextDecoration.none,
                        decorationColor: const Color(0xFF1D1B20),
                      ),
                      onTap: _handleLogout,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    overlayState.insert(_overlayEntry!);
  }

  void _handleNavigation(String route) {
    _closeMenu();
    context.pushNamed(route);
  }

  void _handleLogout() {
    _closeMenu();
    // Add logout logic here
  }

  void _closeMenu() {
    setState(() => _isMenuOpen = false);
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  Widget _buildMenuItem({
    required String iconPath,
    required String text,
    required TextStyle style,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 24.w,
              height: 24.h,
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                text,
                style: style,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextItem({
    required String text,
    required TextStyle style,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
        child: Row(
          children: [
            SizedBox(width: 40.w),
            Expanded(
              child: Text(
                text,
                style: style,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: _showPopupMenu,
            child: SvgPicture.asset(
              'assets/svgs/settings_icon.svg',
              colorFilter: _isMenuOpen
                  ? ColorFilter.mode(
                      ColorsManager.secondaryGold,
                      BlendMode.srcIn,
                    )
                  : null,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => context.pushNamed(Routes.notificationsScreen),
            child: SvgPicture.asset('assets/svgs/notification_icon.svg'),
          ),
        ],
      ),
    );
  }
}

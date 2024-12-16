import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/features/auth/forget_password/ui/widgets/forget_password_indicator.dart';

class ForgetPasswordAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final int currentIndex;
  final int totalPages;

  const ForgetPasswordAppBar({
    super.key,
    required this.currentIndex,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: GestureDetector(
        onTap: (){
          context.pop();
        },
        child: SvgPicture.asset(
          "assets/svgs/back_button.svg",
          fit: BoxFit.scaleDown,
        ),
      ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ForgetPasswordIndicator(
            currentPage: currentIndex,
            totalPages: totalPages,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

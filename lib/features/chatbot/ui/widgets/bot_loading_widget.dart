import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';

class BotLoadingWidget extends StatefulWidget {
  const BotLoadingWidget({super.key});

  @override
  State<BotLoadingWidget> createState() => _BotLoadingWidgetState();
}

class _BotLoadingWidgetState extends State<BotLoadingWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Center(
        child: Column(
          children: [
            SvgPicture.asset('assets/svgs/chatbot_avatar.svg'),
            verticalSpace(15),
            LinearProgressIndicator(
              color: ColorsManager.secondaryGold,
            ),
          ],
        ),
      ),
    );
  }
}

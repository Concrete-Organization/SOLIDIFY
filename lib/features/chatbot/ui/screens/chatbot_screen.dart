import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  bool animateSvg = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 15.w),
        child: Column(
          children: [
            verticalSpace(70),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Hi, I’m ',
                    style: TextStyles.font25MainBlueBold,
                  ),
                  TextSpan(
                    text: 'Sila',
                    style: TextStyles.font25secondaryGoldBold,
                  ),
                  TextSpan(
                    text: ' let’s talk!',
                    style: TextStyles.font25MainBlueBold,
                  ),
                ],
              ),
            ),
            verticalSpace(30),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: animateSvg
                  ? SvgPicture.asset(
                      'assets/svgs/chatbot_avatar.svg',
                      key: const ValueKey('animated_svg'),
                    )
                  : SvgPicture.asset(
                      'assets/svgs/chatbot_avatar.svg',
                      key: const ValueKey('static_svg'),
                    ),
            ),
            verticalSpace(60),
            AppTextButton(
              onPressed: () {
                setState(() {
                  animateSvg = true; // Trigger animation before navigating
                });
                Future.delayed(const Duration(milliseconds: 500), () {
                  context.pushNamed(Routes.chatScreen);
                });
              },
              textButton: 'Get started!',
            ),
          ],
        ),
      ),
    );
  }
}

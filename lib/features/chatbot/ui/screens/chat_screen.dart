import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SvgPicture.asset('assets/svgs/back_arrow.svg'),
      ),
      body: Column(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Welcome',
                  style: TextStyles.font25MainBlueBold,
                ),
                TextSpan(
                  text: 'Ahmed',
                  style: TextStyles.font25secondaryGoldBold,
                ),
                TextSpan(
                  text: 'ask my anything',
                  style: TextStyles.font25MainBlueBold,
                ),
              ],
            ),
          ),
          verticalSpace(40),
          SvgPicture.asset('assets/svgs/chatbot_avatar.svg'),
        ],
      ),
    );
  }
}

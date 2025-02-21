import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_button.dart';

class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 15.w),
        child: Column(
          children: [
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
            verticalSpace(40),
            SvgPicture.asset('assets/svgs/chatbot_avatar.svg'),
            verticalSpace(90),
            AppTextButton(
                onPressed: () {
                  context.pushNamed(Routes.chatScreen);
                },
                textButton: 'Get started!')
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/features/chatbot/ui/widgets/message_form_filed.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    verticalSpace(78),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Welcome ',
                            style: TextStyles.font25MainBlueBold,
                          ),
                          TextSpan(
                            text: 'Ahmed ',
                            style: TextStyles.font25secondaryGoldBold,
                          ),
                          TextSpan(
                            text: 'ask me anything',
                            style: TextStyles.font25MainBlueBold,
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(40),
                    SvgPicture.asset('assets/svgs/chatbot_avatar.svg'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: MessageFormField(),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/features/chatbot/ui/widgets/message_form_filed.dart';
import 'package:solidify/features/chatbot/ui/widgets/user_message_container.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _messageSent = false;
  String _userMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        // If a message is sent, show "Sila" with mini avatar on the right
        title: _messageSent
            ? Text(
                'Sila',
                style: TextStyles.font18MainBlueSemiBold,
              )
            : null,
        actions: _messageSent
            ? [
                Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  child:
                      SvgPicture.asset('assets/svgs/mini_chatbot_avatar.svg'),
                ),
              ]
            : [],
        leading: _messageSent
            ? null
            : IconButton(
                onPressed: () => Navigator.pop(context),
                icon: SvgPicture.asset('assets/svgs/back_arrow.svg'),
              ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // If message not sent yet, show welcome text + big avatar
                    if (!_messageSent) ...[
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
                    ] else ...[
                      verticalSpace(20),
                      Text(
                        'Me',
                        style: TextStyles.font14SecondaryGoldRegular,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 16.w),
                          child: UserMessageContainer(
                            message: _userMessage,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),

            // Text input at bottom
            Padding(
              padding: EdgeInsets.all(16.w),
              child: MessageFormField(
                onSend: (String message) {
                  if (message.isNotEmpty) {
                    setState(() {
                      _messageSent = true;
                      _userMessage = message;
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

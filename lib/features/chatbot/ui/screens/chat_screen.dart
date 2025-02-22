import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/features/chatbot/logic/chatbot_cubit.dart';
import 'package:solidify/features/chatbot/logic/chatbot_state.dart';
import 'package:solidify/features/chatbot/ui/widgets/message_form_filed.dart';
import 'package:solidify/features/chatbot/ui/widgets/user_message_container.dart';
import 'package:solidify/features/chatbot/ui/widgets/sila_bot_message_container.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String _userMessage = '';

  
  String _botMessage = '';

  void _onSend(String message) {
    if (message.isEmpty) return;
    setState(() {
      _userMessage = message;
    });
    // Dispatch to Cubit
    context.read<ChatbotCubit>().sendMessage(message);
  }

  @override
  Widget build(BuildContext context) {
    final isMessageSent = _userMessage.isNotEmpty;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        // If a message is sent, show "Sila" with mini avatar on the right
        title: isMessageSent
            ? Text(
                'Sila',
                style: TextStyles.font18MainBlueSemiBold,
              )
            : null,
        actions: isMessageSent
            ? [
                Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  child: SvgPicture.asset('assets/svgs/mini_chatbot_avatar.svg'),
                ),
              ]
            : [],
        leading: isMessageSent
            ? null
            : IconButton(
                onPressed: () => Navigator.pop(context),
                icon: SvgPicture.asset('assets/svgs/back_arrow.svg'),
              ),
      ),
      body: SafeArea(
        child: BlocListener<ChatbotCubit, ChatbotState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (request, response) {
                final text = response.candidates.isNotEmpty
                    ? response.candidates.first.output
                    : "I couldn't find an answer.";
                setState(() {
                  _botMessage = text;
                });
              },
              error: (error) {
                setState(() {
                  _botMessage = 'Error: ${error.message ?? "Unknown"}';
                });
              },
            );
          },
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!isMessageSent) ...[
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
                        Center(
                          child:
                              SvgPicture.asset('assets/svgs/chatbot_avatar.svg'),
                        ),
                      ] else ...[
                        verticalSpace(20),
                        Text(
                          'Me',
                          style: TextStyles.font14SecondaryGoldRegular,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: UserMessageContainer(message: _userMessage),
                        ),
                        verticalSpace(20),
                        Text(
                          'Sila',
                          style: TextStyles.font14SecondaryGoldRegular,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: SilaBotMessageContainer(message: _botMessage),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              // The text input
              Padding(
                padding: EdgeInsets.all(16.w),
                child: MessageFormField(
                  onSend: _onSend,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

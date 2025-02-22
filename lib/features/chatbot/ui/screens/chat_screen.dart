import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/features/chatbot/logic/chatbot_cubit.dart';
import 'package:solidify/features/chatbot/logic/chatbot_state.dart';
import 'package:solidify/features/chatbot/ui/widgets/chat_message.dart';
import 'package:solidify/features/chatbot/ui/widgets/message_form_filed.dart';
import 'package:solidify/features/chatbot/ui/widgets/bot_loading_widget.dart';
import 'package:solidify/features/chatbot/ui/widgets/user_message_container.dart';
import 'package:solidify/features/chatbot/ui/widgets/sila_bot_message_container.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = [];

  void _onSend(String message) {
    if (message.isEmpty) return;
    setState(() {
      // Add user's message to conversation history
      _messages.add(ChatMessage(text: message, isUser: true));
    });
    // Dispatch to Cubit
    context.read<ChatbotCubit>().sendMessage(message);
  }

  @override
  Widget build(BuildContext context) {
    final bool hasMessages = _messages.isNotEmpty;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        // If there's at least one message, show "Sila" with mini avatar on the right.
        title: hasMessages
            ? Text(
                'Sila',
                style: TextStyles.font18MainBlueSemiBold,
              )
            : null,
        actions: hasMessages
            ? [
                Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  child:
                      SvgPicture.asset('assets/svgs/mini_chatbot_avatar.svg'),
                ),
              ]
            : [],
        leading: hasMessages
            ? null
            : IconButton(
                onPressed: () => Navigator.pop(context),
                icon: SvgPicture.asset('assets/svgs/back_arrow.svg'),
              ),
      ),
      body: SafeArea(
        child: BlocConsumer<ChatbotCubit, ChatbotState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (request, response) {
                final text = response.candidates.isNotEmpty
                    ? response.candidates.first.output
                    : "I couldn't find an answer.";
                setState(() {
                  _messages.add(ChatMessage(text: text, isUser: false));
                });
              },
              error: (error) {
                setState(() {
                  _messages.add(
                    ChatMessage(
                      text: 'Error: ${error.message}',
                      isUser: false,
                    ),
                  );
                });
              },
            );
          },
          builder: (context, state) {
            final bool isLoading =
                state.maybeWhen(loading: () => true, orElse: () => false);

            if (isLoading) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: const BotLoadingWidget(),
              );
            } else {
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      // No horizontal padding here
                      padding: EdgeInsets.zero,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Show welcome text if no messages yet.
                          if (!hasMessages) ...[
                            verticalSpace(78),
                            Center(
                              child: RichText(
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
                            ),
                            verticalSpace(40),
                            Center(
                              child: SvgPicture.asset(
                                'assets/svgs/chatbot_avatar.svg',
                              ),
                            ),
                          ],
                          // Display conversation history
                          ..._messages.map((msg) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Column(
                                crossAxisAlignment: msg.isUser
                                    ? CrossAxisAlignment.end
                                    : CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.w, right: 10.w),
                                    child: Text(
                                      msg.isUser ? 'Me' : 'Sila',
                                      style:
                                          TextStyles.font14SecondaryGoldRegular,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Row(
                                    mainAxisAlignment: msg.isUser
                                        ? MainAxisAlignment.end
                                        : MainAxisAlignment.start,
                                    children: [
                                      if (msg.isUser) ...[
                                        // user message pinned to right
                                        UserMessageContainer(message: msg.text),
                                        SizedBox(width: 10.w),
                                      ] else ...[
                                        // bot message pinned to left
                                        SizedBox(width: 10.w),
                                        SilaBotMessageContainer(
                                            message: msg.text),
                                      ],
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 10.w, right: 10.w, bottom: 16.h),
                    child: MessageFormField(
                      onSend: _onSend,
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

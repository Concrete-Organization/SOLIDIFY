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
  final ScrollController _scrollController = ScrollController();

  void _onSend(String message) {
    if (message.isEmpty) return;
    setState(() {
      _messages.add(ChatMessage(text: message, isUser: true));
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
    context.read<ChatbotCubit>().sendMessage(message);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool hasMessages = _messages.isNotEmpty;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: hasMessages
            ? Text(
          'Sila',
          style: TextStyles.font18MainBlueSemiBold,
        )
            : null,
        actions: hasMessages
            ? [
          Padding(
            padding: EdgeInsets.only(right: 13.w),
            child: SvgPicture.asset('assets/svgs/mini_chatbot_avatar.svg'),
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
                // Scroll to bottom after bot response
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _scrollController.animateTo(
                    _scrollController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
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
                // Scroll to bottom after error message
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _scrollController.animateTo(
                    _scrollController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                });
              },
            );
          },
          builder: (context, state) {
            final bool isLoading = state.maybeWhen(
              loading: () => true,
              orElse: () => false,
            );
            if (isLoading) {
              return const BotLoadingWidget();
            } else {
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      controller: _scrollController, // Attach controller
                      padding: EdgeInsets.zero,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                      left: 20.w,
                                      right: 20.w,
                                    ),
                                    child: Text(
                                      msg.isUser ? 'Me' : 'Sila',
                                      style: TextStyles.font14SecondaryGoldRegular,
                                    ),
                                  ),
                                  verticalSpace(4),
                                  Row(
                                    mainAxisAlignment: msg.isUser
                                        ? MainAxisAlignment.end
                                        : MainAxisAlignment.start,
                                    children: [
                                      if (msg.isUser) ...[
                                        UserMessageContainer(message: msg.text),
                                        horizontalSpace(20),
                                      ] else ...[
                                        horizontalSpace(20),
                                        SilaBotMessageContainer(
                                          message: msg.text,
                                        ),
                                      ],
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(left: 20.w, right: 20.w, bottom: 12.h),
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
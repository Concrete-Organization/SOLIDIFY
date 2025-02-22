import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageFormField extends StatefulWidget {
  final Function(String) onSend;

  const MessageFormField({super.key, required this.onSend});

  @override
  State<MessageFormField> createState() => _MessageFormFieldState();
}

class _MessageFormFieldState extends State<MessageFormField> {
  final TextEditingController _controller = TextEditingController();
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _isTyping = _controller.text.isNotEmpty;
      });
    });
  }

  void _handleSend() {
    final message = _controller.text.trim();
    widget.onSend(message);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 59.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        color: ColorsManager.mainBlueWith1Opacity,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color:
              _isTyping ? ColorsManager.secondaryGold : ColorsManager.mainBlue,
          width: 1.5.w,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              cursorColor: ColorsManager.mainBlue,
              controller: _controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Ask Sila...',
                hintStyle: TextStyles.font14lightBlackLight,
              ),
              style: TextStyles.font14lightBlackLight,
              onSubmitted: (_) => _handleSend(),
            ),
          ),
          GestureDetector(
            onTap: _handleSend,
            child: SvgPicture.asset(
              'assets/svgs/send_message_icon.svg',
              width: 20.w,
              height: 20.h,
              colorFilter: ColorFilter.mode(
                _isTyping
                    ? ColorsManager.secondaryGold
                    : ColorsManager.mainBlue,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

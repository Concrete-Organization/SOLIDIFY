import 'package:flutter/material.dart';
import 'package:solidify/core/theming/text_styles.dart';

class ErrorStateMessage extends StatelessWidget {
  final String message;

  const ErrorStateMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Error: $message',
        style: TextStyles.font14RedRegular,
      ),
    );
  }
}

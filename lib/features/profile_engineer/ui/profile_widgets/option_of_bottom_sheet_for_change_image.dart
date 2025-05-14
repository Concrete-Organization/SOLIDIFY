import 'package:flutter/material.dart';

class OptionOfBottomSheetForChangeImage extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;
  final Function() onTap;

  const OptionOfBottomSheetForChangeImage({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: iconColor),
      title: Text(text),
      onTap: onTap,
    );
  }
}

import 'package:flutter/material.dart';
// ignore_for_file: deprecated_member_use

class ColorsManager {
  static const Color mainBlue = Color(0xFF1B4965);
  static const Color secondaryGold = Color(0xFFC29818);
  static const Color scaffoldBackground = Color(0xFFFFFFFE);
  static const Color lightBlack = Color(0xFF333533);
  static const Color white = Colors.white;
  static Color mainBlueWith1Opacity = const Color(0xFF1B4965).withOpacity(0.10);
  static Color mainBlueWith15Opacity =
      const Color(0xFF1B4965).withOpacity(0.15);
  static Color mainBlueWith5Opacity = const Color(0xFF1B4965).withOpacity(0.05);
  static Color mainBlueWith50Opacity =
      const Color(0xFF1B4965).withOpacity(0.50);
  static Color mainBlueWith2Opacity = const Color(0xFF1B4965).withOpacity(0.20);

  static Color secondaryGoldWith10Opacity = Color(0xFFC29818).withOpacity(0.10);
  static Color red = Color(0xFFC70000);
  static Color cancelRed = Color(0xFFEB2A2A);
}

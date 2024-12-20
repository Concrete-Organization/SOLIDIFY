import 'package:flutter/material.dart';
import 'package:solidify/core/theming/text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Home',
          style: TextStyles.font24MainBlueMedium,
        ),
      ),
    );
  }
}

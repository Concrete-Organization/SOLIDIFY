import 'package:flutter/material.dart';
import 'package:solidify/core/theming/text_styles.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Active orders',
          style: TextStyles.font18MainSemiBold,
        ),
      ),
    );
  }
}

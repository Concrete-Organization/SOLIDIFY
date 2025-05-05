import 'package:flutter/material.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/features/crack_detection/ui/widgets/crack_detection_bloc_consumer.dart';

class CrackDetectionResultScreen extends StatelessWidget {
  const CrackDetectionResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cracks Detection',
          style: TextStyles.font18MainBlueSemiBold,
        ),
      ),
      body: CrackDetectionBlocConsumer(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BotLoadingWidget extends StatelessWidget {
  const BotLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [SvgPicture.asset('')],
      ),
    );
  }
}

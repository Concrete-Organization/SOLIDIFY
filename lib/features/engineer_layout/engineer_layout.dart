import 'package:flutter/material.dart';

class EngineerLayout extends StatelessWidget {
  const EngineerLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Engineer layout'),
          )
        ],
      ),
    );
  }
}

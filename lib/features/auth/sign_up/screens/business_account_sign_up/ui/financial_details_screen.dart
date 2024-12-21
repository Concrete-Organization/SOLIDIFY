import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinancialDetailsScreen extends StatefulWidget {
  const FinancialDetailsScreen({super.key});

  @override
  State<FinancialDetailsScreen> createState() => _FinancialDetailsScreenState();
}

class _FinancialDetailsScreenState extends State<FinancialDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [],
              ),
            ),
          ))
        ],
      )),
    );
  }
}

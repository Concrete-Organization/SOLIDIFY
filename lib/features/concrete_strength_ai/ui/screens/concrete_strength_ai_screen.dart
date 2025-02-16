import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/app_text_button.dart';

class ConcreteStrengthAiScreen extends StatelessWidget {
  const ConcreteStrengthAiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Concrete Comprehensive\nStrength',
          style: TextStyles.font18MainSemiBold,
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(41),
              Image.asset('assets/images/ai_concrete.png'),
              verticalSpace(13),
              Text(
                'This AI tool predicts the strength of concrete by analyzing various factors like material mix and environmental conditions. It helps ensure strong and durable concrete structures.',
                style: TextStyles.font15lightBlackMedium,
                textAlign: TextAlign.center,
              ),
              verticalSpace(27),
              AppTextButton(
                onPressed: () {
                  context.pushNamed(Routes.concreteStrengthScreens);
                },
                textButton: 'Get started!',
              )
            ],
          ),
        ),
      ),
    );
  }
}

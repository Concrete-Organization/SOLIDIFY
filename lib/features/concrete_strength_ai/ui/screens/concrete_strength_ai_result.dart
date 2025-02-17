import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/app_text_button.dart';

class ConcreteStrengthAiResult extends StatelessWidget {
  const ConcreteStrengthAiResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Concrete Comprehensive\nStrength',
          style: TextStyles.font18MainSemiBold,
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            verticalSpace(136),
            Stack(
              children: [
                SvgPicture.asset('assets/svgs/concrete_result.svg'),
                Positioned(
                  top: 60.h,
                  right: 35.w,
                  child: Column(
                    children: [
                      Text(
                        'Strength result:',
                        style: TextStyles.font15MainBlueMedium,
                      ),
                      verticalSpace(8),
                      Text(
                        '9.88888',
                        style: TextStyles.font20SecondaryGoldBold,
                      ),
                      verticalSpace(16),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            AppTextButton(
              onPressed: () {},
              textButton: 'Done',
            ),
            verticalSpace(56),
          ],
        ),
      ),
    );
  }
}

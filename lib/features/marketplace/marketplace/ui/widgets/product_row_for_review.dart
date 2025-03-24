import 'package:flutter/widgets.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductRowForReview extends StatelessWidget {
  const ProductRowForReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Product Image
        Container(
          width: 74.w,
          height: 60.h,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.3.w,
              color: ColorsManager.mainBlue,
            ),
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Image.asset('assets/images/cement_bag_3x.png'),
        ),
        horizontalSpace(15),
        Column(
          children: [
            Text('Ambuja cement', style: TextStyles.font12LightBlackMedium),
            verticalSpace(20),
            Text('1,000 EGP', style: TextStyles.font12MainBlueMedium),
          ],
        )
      ],
    );
  }
}

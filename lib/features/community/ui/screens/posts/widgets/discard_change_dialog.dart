import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';

class DiscardChangeDialog extends StatelessWidget {
  const DiscardChangeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ColorsManager.white,
      child: Container(
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: ColorsManager.mainBlue,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 15,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            verticalSpace(24),
            Image.asset(
              'assets/images/question_mark.png',
              width: 44.w,
              height: 44.h,
            ),
            verticalSpace(11),
            Text(
              'Are you sure you want to delete this?',
              style: TextStyles.font15lightBlackRegularWith70Opacity.copyWith(
                fontSize: 14.sp,
              ),
            ),
            verticalSpace(12),
            HorizontalDivider(),
            TextButton(
              onPressed: () {
                context.pushNamedAndRemoveUntil(
                  Routes.engineerLayout,
                  predicate: (route) => false,
                );
              },
              child: Text(
                'Discard changes',
                style: TextStyles.font14RedRegular,
              ),
            ),
            HorizontalDivider(),
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text(
                'Cancel',
                style: TextStyles.font14RedRegular.copyWith(
                  color: ColorsManager.mainBlue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

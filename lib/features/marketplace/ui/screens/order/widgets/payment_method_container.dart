import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodContainer extends StatefulWidget {
  final String iconPath;
  final String title;

  const PaymentMethodContainer({
    super.key,
    required this.iconPath,
    required this.title,
  });

  @override
  State<PaymentMethodContainer> createState() => _PaymentMethodContainerState();
}

class _PaymentMethodContainerState extends State<PaymentMethodContainer> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _isSelected = !_isSelected),
      child: Container(
        width: 353.w,
        height: 56.h,
        decoration: BoxDecoration(
          color: ColorsManager.mainBlueWith1Opacity,
          border: Border.all(
            color: _isSelected
                ? ColorsManager.secondaryGold
                : ColorsManager.mainBlue,
            width: 1,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            children: [
              SvgPicture.asset(widget.iconPath),
              horizontalSpace(15),
              Text(
                widget.title,
                style: _isSelected
                    ? TextStyles.font13secondaryGoldMedium
                    : TextStyles.font13MainBlueMedium,
              ),
              const Spacer(),
              if (_isSelected) SvgPicture.asset('assets/svgs/done_icon.svg'),
            ],
          ),
        ),
      ),
    );
  }
}

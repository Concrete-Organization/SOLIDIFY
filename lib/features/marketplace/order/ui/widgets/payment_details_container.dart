import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_form_field.dart';

class PaymentDetailsContainer extends StatefulWidget {
  final Function(bool) onFieldsFilled;

  const PaymentDetailsContainer({super.key, required this.onFieldsFilled});

  @override
  State<PaymentDetailsContainer> createState() =>
      _PaymentDetailsContainerState();
}

class _PaymentDetailsContainerState extends State<PaymentDetailsContainer> {
  final TextEditingController _cardHolderNameController =
      TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expDateController = TextEditingController();
  final TextEditingController _cvcCodeController = TextEditingController();

  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    _cardHolderNameController.addListener(_checkFields);
    _cardNumberController.addListener(_checkFields);
    _expDateController.addListener(_checkFields);
    _cvcCodeController.addListener(_checkFields);
  }

  void _checkFields() {
    bool allFieldsFilled = _cardHolderNameController.text.isNotEmpty &&
        _cardNumberController.text.isNotEmpty &&
        _expDateController.text.isNotEmpty &&
        _cvcCodeController.text.isNotEmpty;
    widget.onFieldsFilled(allFieldsFilled);
  }

  @override
  void dispose() {
    _cardHolderNameController.dispose();
    _cardNumberController.dispose();
    _expDateController.dispose();
    _cvcCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 353.w,
      decoration: BoxDecoration(
        color: ColorsManager.mainBlueWith1Opacity,
        border: Border.all(
          color:
              isSelected ? ColorsManager.secondaryGold : ColorsManager.mainBlue,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Card Holder Name',
              style: TextStyles.font12LightBlackRegular,
            ),
            verticalSpace(8),
            AppTextFormField(
              controller: _cardHolderNameController,
              width: 320.w,
              height: 43.h,
            ),
            verticalSpace(15),
            Text(
              'Card Number',
              style: TextStyles.font12LightBlackRegular,
            ),
            verticalSpace(8),
            AppTextFormField(
              controller: _cardNumberController,
              width: 320.w,
              height: 43.h,
            ),
            verticalSpace(15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Exp Date',
                        style: TextStyles.font12LightBlackRegular,
                      ),
                      verticalSpace(8),
                      AppTextFormField(
                        controller: _expDateController,
                        height: 43.h,
                        width: 142.w,
                      ),
                    ],
                  ),
                ),
                horizontalSpace(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CVC Code',
                        style: TextStyles.font12LightBlackRegular,
                      ),
                      verticalSpace(8),
                      AppTextFormField(
                        controller: _cvcCodeController,
                        height: 43.h,
                        width: 142.w,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            verticalSpace(8),
          ],
        ),
      ),
    );
  }
}

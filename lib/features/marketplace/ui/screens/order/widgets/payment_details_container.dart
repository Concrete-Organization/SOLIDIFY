import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_form_field.dart';

class PaymentDetailsContainer extends StatefulWidget {
  final Function(bool) onFieldsFilled;

  const PaymentDetailsContainer({super.key, required this.onFieldsFilled});

  @override
  _PaymentDetailsContainerState createState() =>
      _PaymentDetailsContainerState();
}

class _PaymentDetailsContainerState extends State<PaymentDetailsContainer> {
  final TextEditingController _cardHolderNameController =
      TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expDateController = TextEditingController();
  final TextEditingController _cvcCodeController = TextEditingController();

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
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Card Holder Name',
              style: TextStyles.font12LightBlackMedium,
            ),
            verticalSpace(12),
            AppTextFormField(
              controller: _cardHolderNameController,
              width: 301.w,
              height: 43.h,
            ),
            verticalSpace(15),
            Text(
              'Card Number',
              style: TextStyles.font12LightBlackMedium,
            ),
            verticalSpace(8),
            AppTextFormField(
              controller: _cardNumberController,
              width: 353.w,
              height: 48.h,
            ),
            verticalSpace(15),
            Row(
              children: [
                Text(
                  'Exp Data',
                  style: TextStyles.font12LightBlackMedium,
                ),
                verticalSpace(8),
                AppTextFormField(
                  controller: _expDateController,
                  width: 142.w,
                  height: 43.h,
                ),
                horizontalSpace(30),
                Text(
                  'Cvc code',
                  style: TextStyles.font12LightBlackMedium,
                ),
                verticalSpace(8),
                AppTextFormField(
                  controller: _cvcCodeController,
                  width: 142.w,
                  height: 43.h,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

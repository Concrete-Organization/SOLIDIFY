import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/widgets/app_text_form_field.dart';

class TextFieldOfQuestionItem extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String unit;

  const TextFieldOfQuestionItem({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    final textFieldBorderColor = controller.text.isNotEmpty
        ? ColorsManager.mainBlue
        : focusNode.hasFocus
        ? ColorsManager.secondaryGold
        : ColorsManager.mainBlue;

    return SizedBox(
      width: 147.w,
      height: 38.h,
      child: AppTextFormField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        borderRadius: 10.r,
        inputTextStyle: TextStyles.font12MainBlueMedium,
        borderColor: textFieldBorderColor,
        suffixIcon: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Text(
            unit,
            style: TextStyles.font10lightBlackRegularWithOpacity,
          ),
        ),
        onChanged: (value) {
          final newText = value.replaceAll(RegExp(r'[^0-9.]'), '');
          if (newText.contains('.') &&
              newText.indexOf('.') != newText.lastIndexOf('.')) {
            return;
          }
          controller.text = newText;
          controller.selection = TextSelection.fromPosition(
            TextPosition(offset: newText.length),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_form_field.dart';

class SearchWithFilterBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onSubmitted;

  const SearchWithFilterBar({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: controller,
      hintText: 'Search any item',
      borderRadius: 25.r,
      prefixIcon: SvgPicture.asset('assets/svgs/search_icon.svg'),
      onChanged: onChanged,
      onFieldSubmitted: (_) => onSubmitted(),
      textInputAction: TextInputAction.done,
    );
  }
}

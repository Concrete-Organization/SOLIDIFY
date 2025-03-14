import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/app_text_form_field.dart';

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: 'Search any item',
      borderRadius: 25.r,
      prefixIcon: SvgPicture.asset('assets/svgs/search_icon.svg'),
      suffixIcon: SvgPicture.asset(
        'assets/svgs/lets-icons_filter.svg',
        fit: BoxFit.scaleDown,
      ),
    );
  }
}

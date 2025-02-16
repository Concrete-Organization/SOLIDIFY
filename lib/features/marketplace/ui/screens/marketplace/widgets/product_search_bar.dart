import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 353.w,
      height: 45.h,
      child: TextField(
        cursorColor: ColorsManager.mainBlue,
        style: TextStyles.font12lightBlackregular,
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorsManager.mainBlueWith1Opacity,
          contentPadding: EdgeInsets.symmetric(vertical: 10.h),
          hintText: 'Search any item',
          hintStyle: TextStyles.font12lightBlackregular,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: SvgPicture.asset('assets/svgs/search_icon.svg'),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child:
                SvgPicture.asset('assets/svgs/product_search_filter_icon.svg'),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.r),
            borderSide: BorderSide(
              color: ColorsManager.mainBlue,
              width: 1.w,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.r),
            borderSide: BorderSide(
              color: ColorsManager.mainBlueWith1Opacity,
              width: 1.w,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.r),
            borderSide: BorderSide(
              color: ColorsManager.mainBlue,
              width: 1.w,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/theming/font_weight_helper.dart';

class TextStyles {
  static TextStyle font15MainBlueMedium = GoogleFonts.poppins(
    fontSize: 15.sp,
    color: ColorsManager.mainBlue,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font15MainBlueSemiBold = GoogleFonts.poppins(
    fontSize: 15.sp,
    color: ColorsManager.mainBlue,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font12MainBlueSemiBold = GoogleFonts.poppins(
    fontSize: 12.sp,
    color: ColorsManager.mainBlue,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font13MainBlueMedium = GoogleFonts.poppins(
    fontSize: 13.sp,
    color: ColorsManager.mainBlue,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font20MainBlueMedium = GoogleFonts.poppins(
    fontSize: 20.sp,
    color: ColorsManager.mainBlue,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font15MainBlueRegular = GoogleFonts.poppins(
    fontSize: 15.sp,
    color: ColorsManager.mainBlue,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font10MainBlueRegular = GoogleFonts.poppins(
    fontSize: 10.sp,
    color: ColorsManager.mainBlue,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font24MainBlueMedium = GoogleFonts.poppins(
    fontSize: 24.sp,
    color: ColorsManager.mainBlue,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font12MainBlueMedium = GoogleFonts.poppins(
    fontSize: 12.sp,
    color: ColorsManager.mainBlue,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font24MainBlueSemiBold = GoogleFonts.poppins(
    fontSize: 24.sp,
    color: ColorsManager.mainBlue,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font18MainBlueBold = GoogleFonts.poppins(
    fontSize: 18.sp,
    color: ColorsManager.mainBlue,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font14lightBlackRegular = GoogleFonts.poppins(
    fontSize: 14.sp,
    color: ColorsManager.lightBlack,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font12lightBlackLight = GoogleFonts.poppins(
    fontSize: 12.sp,
    color: ColorsManager.lightBlack,
    fontWeight: FontWeightHelper.light,
  );
  static TextStyle font10lightBlackRegularWithOpacity = GoogleFonts.poppins(
    fontSize: 10.sp,
    color: ColorsManager.lightBlack.withOpacity(0.8),
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font15lightBlackRegular = GoogleFonts.poppins(
    fontSize: 15.sp,
    color: ColorsManager.lightBlack,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font15lightBlackRegularWith70Opacity = GoogleFonts.poppins(
    fontSize: 15.sp,
    color: ColorsManager.lightBlack.withOpacity(0.70),
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font15lightBlackSemiBold = GoogleFonts.poppins(
    fontSize: 15.sp,
    color: ColorsManager.lightBlack,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle font16WhiteMedium = GoogleFonts.poppins(
    fontSize: 16.sp,
    color: ColorsManager.white,
    fontWeight: FontWeightHelper.medium,
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_colors.dart';

abstract class AppStyle {
  static TextStyle semiBold32 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 32.sp,
    color: AppColors.black,
  );
  static TextStyle semiBold18 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18.sp,
    color: AppColors.black,
  );
  static TextStyle regular18 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 18.sp,
    color: AppColors.graniteGray,
  );
  static final TextStyle regular14 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    color: AppColors.graniteGray,
  );
  static final TextStyle bold14 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 14.sp,
    color: AppColors.graniteGray,
  );

  // static final TextStyle medium40 = TextStyle(
  //   fontWeight: FontWeight.w500,
  //   fontSize: 40.sp,
  //   color: Colors.white,
  // );
  // static final TextStyle medium24 = TextStyle(
  //   fontWeight: FontWeight.w500,
  //   fontSize: 24.sp,
  //   color: Colors.white,
  // );
  // static final TextStyle extraLight14 = TextStyle(
  //   fontWeight: FontWeight.w200,
  //   fontSize: 14.sp,
  //   color: AppColors.textFiledColor,
  // );
  // static final TextStyle light19 = TextStyle(
  //   fontWeight: FontWeight.w300,
  //   fontSize: 19.sp,
  //   color: Colors.white,
  // );
  // static final TextStyle light12 = TextStyle(
  //   fontWeight: FontWeight.w300,
  //   fontSize: 12.sp,
  //   color: AppColors.black,
  // );
  // static final TextStyle light14 = TextStyle(
  //   fontWeight: FontWeight.w300,
  //   fontSize: 14.sp,
  //   color: AppColors.black,
  // );
}

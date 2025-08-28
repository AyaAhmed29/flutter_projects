import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_colors.dart';

abstract class AppStyle {
  static TextStyle semiBold32 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 32.sp,
    color: AppColors.black,
  );
  static TextStyle semiBold20 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20.sp,
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
  static final TextStyle regular12 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
    color: AppColors.black,
  );
  static final TextStyle bold14 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 14.sp,
    color: AppColors.graniteGray,
  );
  static final TextStyle bold48 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 48.sp,
    color: AppColors.black,
  );
  static final TextStyle medium16 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    color: AppColors.white,
  );
  static final TextStyle medium32 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 32.sp,
    color: AppColors.black,
  );
  static final TextStyle semiBold24 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 24.sp,
    color: AppColors.black,
  );
  static final TextStyle semiBold16 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
    color: AppColors.blue,
  );
}

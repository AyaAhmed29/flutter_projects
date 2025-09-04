import 'package:ecommerce_app/core/utlis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppStyle {
  static TextStyle bold40 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 40.sp,
    color: AppColors.pink,
  );
  static TextStyle bold18 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18.sp,
    color: AppColors.blueberry,
  );
  static TextStyle extraBold24 = TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 24.sp,
  );
  static TextStyle extraBold14 = TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 14.sp,
    color: AppColors.grey,
  );
  static TextStyle semiBold18 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18.sp,
  );
  static TextStyle semiBold20 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20.sp,
  );
  static TextStyle semiBold16 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
  );
  static TextStyle semiBold36 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 36.sp,
  );
  static TextStyle semiBold23 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 23.sp,
    color: AppColors.white,
  );
  static TextStyle semiBold134 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 34.sp,
    color: AppColors.white,
  );
  static TextStyle regular14 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    color: AppColors.lightGrey,
  );
  static TextStyle regular12 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
    color: AppColors.darkGray,
  );
  static TextStyle medium12 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
  );
  static TextStyle medium16 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
  );
  static const TextStyle regular10 = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 10,
  );
}

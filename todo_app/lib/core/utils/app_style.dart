import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/app_colors.dart';

abstract class AppStyle {
  static final TextStyle regular25 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 25.sp,
  );
  static final TextStyle regular16 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
  );
  static final TextStyle regular14 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    color: Colors.white,
  );
  static final TextStyle medium16 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    color: AppColors.textFiledColor,
  );

  static final TextStyle medium40 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 40.sp,
    color: Colors.white,
  );
  static final TextStyle medium24 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 24.sp,
    color: Colors.white,
  );
  static final TextStyle extraLight14 = TextStyle(
    fontWeight: FontWeight.w200,
    fontSize: 14.sp,
    color: AppColors.textFiledColor,
  );
  static final TextStyle light19 = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 19.sp,
    color: Colors.white,
  );
  static final TextStyle light12 = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 12.sp,
    color: AppColors.black,
  );
  static final TextStyle light14 = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 14.sp,
    color: AppColors.black,
  );
}

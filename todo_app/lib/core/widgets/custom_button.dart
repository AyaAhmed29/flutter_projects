import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
  });
  final Color? color;
  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 5, vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 8,

          shadowColor: AppColors.primaryColor,
          side: BorderSide(color: AppColors.primaryColor, width: 1.w),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColors.primaryColor, width: 1.w),
            borderRadius: BorderRadiusGeometry.circular(14.r),
          ),
          fixedSize: Size(331.w, 50.h),
          backgroundColor: color ?? AppColors.primaryColor,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppStyle.light19.copyWith(
            color: color == null ? AppColors.white : AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}

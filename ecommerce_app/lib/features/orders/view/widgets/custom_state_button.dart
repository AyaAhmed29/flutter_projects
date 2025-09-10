import 'package:ecommerce_app/core/utlis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomStateButton extends StatelessWidget {
  const CustomStateButton({
    super.key,
    required this.text,
    this.isSelected,
    required this.onPressed,
  });

  final String text;
  final bool? isSelected;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            minimumSize: Size(90.w, 20.h),
            backgroundColor: isSelected == true
                ? AppColors.pink
                : AppColors.lightPink,
            foregroundColor: isSelected == true
                ? AppColors.lightPink
                : AppColors.pink,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.r),
            ),
          ),
          onPressed: onPressed,
          child: Text(text, style: TextStyle(fontSize: 16.sp)),
        ),
        SizedBox(width: 2.w),
      ],
    );
  }
}

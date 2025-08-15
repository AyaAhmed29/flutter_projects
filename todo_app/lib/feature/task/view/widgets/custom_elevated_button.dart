import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_style.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        side: BorderSide(
          width: 1.w,
          color: isSelected ? AppColors.primaryColor : AppColors.black,
        ),
        backgroundColor: isSelected ? AppColors.primaryColor : AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
        ),
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: AppStyle.light12.copyWith(
          color: isSelected ? AppColors.white : AppColors.black,
        ),
      ),
    );
  }
}

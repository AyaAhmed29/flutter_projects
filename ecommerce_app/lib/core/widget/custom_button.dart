import 'package:ecommerce_app/core/utlis/app_colors.dart';
import 'package:ecommerce_app/core/utlis/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.ontap,
    this.color,
    required this.text,
    this.icon,
  });

  final void Function() ontap;
  final Color? color;
  final String text;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 2, color: AppColors.pink),
            borderRadius: BorderRadius.circular(4),
          ),
          foregroundColor: color == null ? Colors.white : AppColors.pink,
          backgroundColor: color ?? AppColors.pink,
        ),
        onPressed: ontap,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Image.asset(
                  icon!,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                SizedBox(width: 10.w),
              ],
              Text(
                text,
                style: AppStyle.semiBold23.copyWith(
                  color: color == null ? Colors.white : AppColors.pink,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

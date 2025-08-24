import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_style.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    required this.text,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
    this.controller,
  });
  final String text;
  final String? prefixIcon;
  final Widget? suffixIcon;
  final void Function()? onPressed;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Container(
        margin: EdgeInsets.all(8),
        height: 60.h,
        width: 350.w,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          children: [
            if (prefixIcon != null)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: SvgPicture.asset(prefixIcon!),
              ),
            Text(text, style: AppStyle.regular16),
            Spacer(flex: 1),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child:
                  suffixIcon ?? SvgPicture.asset(Assets.assetsImagesIconsArrow),
            ),
          ],
        ),
      ),
    );
  }
}

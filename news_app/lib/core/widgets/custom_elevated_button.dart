import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_paddings.dart';
import 'package:news_app/core/widgets/custom_svg.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    this.icon,
    required this.onPressed,
  });

  final String text;
  final String? icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: AppPaddings.horizontal24vertical16,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        side: BorderSide(width: 1.w, color: AppColors.blue),
        backgroundColor: AppColors.blue,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.r),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text),
          SizedBox(width: icon != null ? 8.w : 0),
          icon != null ? CustomSvg(icon: icon!) : SizedBox(width: 1),
        ],
      ),
    );
  }
}

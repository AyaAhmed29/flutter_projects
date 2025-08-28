
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_paddings.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
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
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: AppPaddings.horizontal16vertical8,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            side: BorderSide(width: 2.w, color: AppColors.lavender),
            backgroundColor: isSelected == true
                ? AppColors.lavender
                : AppColors.white,
            foregroundColor: AppColors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.r),
            ),
          ),
          onPressed: onPressed,
          child: Text(text),
        ),
        SizedBox(width: 16.w),
      ],
    );
  }
}

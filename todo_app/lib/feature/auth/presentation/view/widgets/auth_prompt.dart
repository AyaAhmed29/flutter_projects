import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_style.dart';

class AuthPrompt extends StatelessWidget {
  const AuthPrompt({
    super.key,
    required this.text,
    required this.textButton,
    this.onPressed,
  });
  final String text;
  final String textButton;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.0.w, vertical: 22.0.h),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: AppStyle.extraLight14),
          SizedBox(width: 5.w),
          TextButton(
            onPressed:
                onPressed ??
                () {
                  GoRouter.of(context).pop();
                },
            child: Text(
              textButton,
              style: AppStyle.extraLight14.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

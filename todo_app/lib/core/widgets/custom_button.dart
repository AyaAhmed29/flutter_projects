import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed});

  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 8,
        shadowColor: AppColors.primaryColor,
        side: BorderSide(color: AppColors.primaryColor,width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(14),
        ),
        fixedSize: Size(331, 50),
        backgroundColor: AppColors.primaryColor,
      ),
      onPressed: onPressed,
      child: Text(text, style: AppStyle.light19),
    );
  }
}

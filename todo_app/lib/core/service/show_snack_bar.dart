
import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_colors.dart';

void showSnackBar({required context, required text}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      backgroundColor: AppColors.primaryColor   ),
  );
}
void errorShowSnackBar({required context, required text}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      
      content: Text(text),
      backgroundColor: AppColors.errorColor,   ),
  );
}
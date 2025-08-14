
import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_colors.dart';

void ShowSnackBar({required context, required text}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      backgroundColor: AppColors.primaryColor   ),
  );
}